package com.android.camera.ui;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ListAdapter;
import android.widget.Scroller;
import com.android.camera.ActivityBase;
import com.android.camera.Util;
import java.util.LinkedList;
import java.util.Queue;

public class HorizontalListView extends AdapterView<ListAdapter> {
    private static final int MIN_DELTA_FOR_SCROLLING = 10;
    private static final String TAG = HorizontalListView.class.getSimpleName();
    protected ListAdapter mAdapter;
    private boolean mBlockNotification;
    protected int mCurrentX;
    private boolean mDataChanged = false;
    private DataSetObserver mDataObserver = new DataSetObserver() {
        public void onChanged() {
            synchronized (HorizontalListView.this) {
                HorizontalListView.this.mDataChanged = true;
            }
            HorizontalListView.this.invalidate();
            HorizontalListView.this.requestLayout();
        }

        public void onInvalidated() {
            HorizontalListView.this.reset();
            HorizontalListView.this.invalidate();
            HorizontalListView.this.requestLayout();
        }
    };
    private int mDisplayOffset = 0;
    private GestureDetector mGesture;
    private boolean mIsScrollingPerformed;
    private int mItemWidth = 180;
    private View mLastSelectImageListItem;
    private int mLeftViewIndex = -1;
    private int mMaxX = Integer.MAX_VALUE;
    protected int mNextX;
    private OnGestureListener mOnGesture = new SimpleOnGestureListener() {
        public boolean onDown(MotionEvent motionEvent) {
            return HorizontalListView.this.onDown(motionEvent);
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return HorizontalListView.this.onFling(motionEvent, motionEvent2, f, f2);
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (!HorizontalListView.this.isTouchMoveEnable()) {
                return false;
            }
            synchronized (HorizontalListView.this) {
                HorizontalListView horizontalListView = HorizontalListView.this;
                horizontalListView.mNextX += (int) f;
            }
            HorizontalListView.this.mIsScrollingPerformed = true;
            HorizontalListView.this.requestLayout();
            return true;
        }

        public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
            HorizontalListView.this.mBlockNotification = true;
            for (int i = 0; i < HorizontalListView.this.getChildCount(); i++) {
                View childAt = HorizontalListView.this.getChildAt(i);
                if (isEventWithinView(motionEvent, childAt)) {
                    int access$600 = HorizontalListView.this.toDataIndex((HorizontalListView.this.mLeftViewIndex + 1) + i);
                    if (HorizontalListView.this.mOnItemSelected != null) {
                        HorizontalListView.this.mOnItemSelected.onItemSelected(HorizontalListView.this, childAt, access$600, HorizontalListView.this.mAdapter.getItemId(access$600));
                    }
                    if (HorizontalListView.this.mOnItemSingleTapDowned != null) {
                        HorizontalListView.this.mOnItemSingleTapDowned.onSingleTapDown(HorizontalListView.this, childAt, access$600, HorizontalListView.this.mAdapter.getItemId(access$600));
                    }
                    return true;
                }
            }
            return true;
        }

        public void onLongPress(MotionEvent motionEvent) {
            int childCount = HorizontalListView.this.getChildCount();
            int i = 0;
            while (i < childCount) {
                View childAt = HorizontalListView.this.getChildAt(i);
                if (!isEventWithinView(motionEvent, childAt)) {
                    i++;
                } else if (HorizontalListView.this.mOnItemLongClicked != null) {
                    int access$600 = HorizontalListView.this.toDataIndex((HorizontalListView.this.mLeftViewIndex + 1) + i);
                    HorizontalListView.this.mOnItemLongClicked.onItemLongClick(HorizontalListView.this, childAt, access$600, HorizontalListView.this.mAdapter.getItemId(access$600));
                    return;
                } else {
                    return;
                }
            }
        }

        private boolean isEventWithinView(MotionEvent motionEvent, View view) {
            Rect rect = new Rect();
            int[] iArr = new int[2];
            view.getLocationOnScreen(iArr);
            int i = iArr[0];
            int width = view.getWidth() + i;
            int i2 = iArr[1];
            rect.set(i, i2, width, view.getHeight() + i2);
            return rect.contains((int) motionEvent.getRawX(), (int) motionEvent.getRawY());
        }
    };
    private OnItemClickListener mOnItemClicked;
    private OnItemLongClickListener mOnItemLongClicked;
    private OnItemSelectedListener mOnItemSelected;
    private OnSingleTapDownListener mOnItemSingleTapDowned;
    private int mPaddingWidth;
    private int mPresetWidth = 0;
    private int mPreviousSelectViewIndex = 0;
    private Queue<View> mRemovedViewQueue = new LinkedList();
    private int mRightViewIndex = 0;
    protected Scroller mScroller;
    private boolean mSelectCenter = true;
    private int mSelectViewIndex = 0;
    private boolean mTouchDown;
    private boolean mTouchMoveEnable = true;

    public interface OnSingleTapDownListener {
        void onSingleTapDown(AdapterView<?> adapterView, View view, int i, long j);
    }

    public interface OnValueChangedListener {
        void onValueChanged(int i, boolean z);
    }

    public HorizontalListView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public void setItemWidth(int i) {
        this.mItemWidth = i;
        if (this.mSelectCenter) {
            this.mPaddingWidth = (this.mPresetWidth - this.mItemWidth) / 2;
            this.mDisplayOffset = this.mPaddingWidth;
        }
    }

    public void setPresetWidth(int i) {
        this.mPresetWidth = i;
    }

    private synchronized void initView() {
        WindowManager windowManager = (WindowManager) getContext().getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        this.mPresetWidth = displayMetrics.widthPixels;
        this.mLeftViewIndex = -1;
        this.mRightViewIndex = 0;
        this.mCurrentX = 0;
        this.mNextX = 0;
        this.mMaxX = Integer.MAX_VALUE;
        if (this.mSelectCenter) {
            this.mPaddingWidth = (this.mPresetWidth - this.mItemWidth) / 2;
            this.mDisplayOffset = this.mPaddingWidth;
        } else {
            this.mDisplayOffset = 0;
        }
        this.mScroller = new Scroller(getContext());
        this.mGesture = new GestureDetector(getContext(), this.mOnGesture);
        if (this.mLastSelectImageListItem != null) {
            this.mLastSelectImageListItem.setActivated(false);
            this.mLastSelectImageListItem = null;
        }
        ((ActivityBase) getContext()).loadCameraSound(6);
    }

    public void setOnItemSelectedListener(OnItemSelectedListener onItemSelectedListener) {
        this.mOnItemSelected = onItemSelectedListener;
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mOnItemClicked = onItemClickListener;
    }

    public void setOnItemLongClickListener(OnItemLongClickListener onItemLongClickListener) {
        this.mOnItemLongClicked = onItemLongClickListener;
    }

    public void setOnItemSingleTapDownListener(OnSingleTapDownListener onSingleTapDownListener) {
        this.mOnItemSingleTapDowned = onSingleTapDownListener;
    }

    public ListAdapter getAdapter() {
        return this.mAdapter;
    }

    public View getSelectedView() {
        return null;
    }

    public void setAdapter(ListAdapter listAdapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mDataObserver);
            this.mRemovedViewQueue.clear();
        }
        this.mAdapter = listAdapter;
        this.mAdapter.registerDataSetObserver(this.mDataObserver);
        reset();
    }

    private synchronized void reset() {
        initView();
        removeAllViewsInLayout();
        requestLayout();
    }

    public void setSelection(int i) {
        i = toViewIndex(i);
        if (this.mSelectViewIndex != i) {
            this.mPreviousSelectViewIndex = this.mSelectViewIndex;
            this.mSelectViewIndex = i;
            if (isShown()) {
                ((ActivityBase) getContext()).playCameraSound(6);
            }
            if (i > this.mLeftViewIndex && i < this.mRightViewIndex) {
                View childAt = getChildAt((i - this.mLeftViewIndex) - 1);
                i = toDataIndex(i);
                notifyItemSelect(childAt, i, this.mAdapter.getItemId(i));
            }
            if (!this.mIsScrollingPerformed) {
                justify();
            }
        }
    }

    private void justify() {
        int i = 1;
        if (this.mSelectViewIndex > this.mLeftViewIndex && this.mSelectViewIndex < this.mRightViewIndex && Math.abs((getChildAt((this.mSelectViewIndex - this.mLeftViewIndex) - 1).getLeft() + (this.mItemWidth / 2)) - (this.mPresetWidth / 2)) <= 10) {
            i = 0;
        }
        if (i != 0) {
            int i2 = ((this.mPaddingWidth + (this.mItemWidth * this.mSelectViewIndex)) + (this.mItemWidth / 2)) - (this.mPresetWidth / 2);
            this.mMaxX = ((this.mPaddingWidth * 2) + (this.mItemWidth * this.mAdapter.getCount())) - this.mPresetWidth;
            if (i2 > this.mMaxX) {
                i2 = this.mMaxX;
            }
            if (i2 != this.mCurrentX) {
                if (isShown()) {
                    scrollTo(i2);
                } else {
                    this.mNextX = i2;
                    requestLayout();
                }
            }
        }
    }

    private void addAndMeasureChild(View view, int i) {
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new LayoutParams(-1, -1);
        }
        addViewInLayout(view, i, layoutParams, true);
        view.measure(MeasureSpec.makeMeasureSpec(getWidth(), Integer.MIN_VALUE), MeasureSpec.makeMeasureSpec(getHeight(), Integer.MIN_VALUE));
    }

    /* JADX WARNING: Missing block: B:40:0x00be, code:
            return;
     */
    protected synchronized void onLayout(boolean r1, int r2, int r3, int r4, int r5) {
        /*
        r0 = this;
        monitor-enter(r0);
        super.onLayout(r1, r2, r3, r4, r5);	 Catch:{ all -> 0x00bf }
        r1 = r0.mAdapter;	 Catch:{ all -> 0x00bf }
        if (r1 != 0) goto L_0x000a;
    L_0x0008:
        monitor-exit(r0);
        return;
        r1 = r0.mDataChanged;	 Catch:{ all -> 0x00bf }
        r2 = 1;
        r3 = 0;
        if (r1 == 0) goto L_0x0020;
    L_0x0011:
        r1 = r0.mCurrentX;	 Catch:{ all -> 0x00bf }
        r0.initView();	 Catch:{ all -> 0x00bf }
        r0.removeAllViewsInLayout();	 Catch:{ all -> 0x00bf }
        r0.mNextX = r1;	 Catch:{ all -> 0x00bf }
        r0.mDataChanged = r3;	 Catch:{ all -> 0x00bf }
        r1 = r2;
        goto L_0x0021;
    L_0x0020:
        r1 = r3;
    L_0x0021:
        r4 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r4 = r4.computeScrollOffset();	 Catch:{ all -> 0x00bf }
        if (r4 == 0) goto L_0x0031;
    L_0x0029:
        r4 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r4 = r4.getCurrX();	 Catch:{ all -> 0x00bf }
        r0.mNextX = r4;	 Catch:{ all -> 0x00bf }
    L_0x0031:
        r4 = r0.mNextX;	 Catch:{ all -> 0x00bf }
        if (r4 > 0) goto L_0x003c;
    L_0x0035:
        r0.mNextX = r3;	 Catch:{ all -> 0x00bf }
        r4 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r4.forceFinished(r2);	 Catch:{ all -> 0x00bf }
    L_0x003c:
        r4 = r0.mNextX;	 Catch:{ all -> 0x00bf }
        r5 = r0.mMaxX;	 Catch:{ all -> 0x00bf }
        if (r4 < r5) goto L_0x004b;
    L_0x0042:
        r4 = r0.mMaxX;	 Catch:{ all -> 0x00bf }
        r0.mNextX = r4;	 Catch:{ all -> 0x00bf }
        r4 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r4.forceFinished(r2);	 Catch:{ all -> 0x00bf }
    L_0x004b:
        r4 = r0.mCurrentX;	 Catch:{ all -> 0x00bf }
        r5 = r0.mNextX;	 Catch:{ all -> 0x00bf }
        r4 = r4 - r5;
        r5 = r0.mNextX;	 Catch:{ all -> 0x00bf }
        r0.mCurrentX = r5;	 Catch:{ all -> 0x00bf }
        r0.removeNonVisibleItems(r4);	 Catch:{ all -> 0x00bf }
        r0.fillList(r4);	 Catch:{ all -> 0x00bf }
        r0.positionItems(r4);	 Catch:{ all -> 0x00bf }
        r4 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r4 = r4.isFinished();	 Catch:{ all -> 0x00bf }
        if (r4 == 0) goto L_0x00b5;
    L_0x0065:
        if (r1 == 0) goto L_0x0068;
    L_0x0067:
        goto L_0x00b5;
    L_0x0068:
        r0.loadItems();	 Catch:{ all -> 0x00bf }
        r1 = r0.mScroller;	 Catch:{ all -> 0x00bf }
        r1 = r1.isFinished();	 Catch:{ all -> 0x00bf }
        if (r1 == 0) goto L_0x00bd;
    L_0x0073:
        r1 = r0.mTouchDown;	 Catch:{ all -> 0x00bf }
        if (r1 != 0) goto L_0x00bd;
    L_0x0077:
        r0.mIsScrollingPerformed = r3;	 Catch:{ all -> 0x00bf }
        r1 = r0.mSelectCenter;	 Catch:{ all -> 0x00bf }
        if (r1 == 0) goto L_0x0085;
    L_0x007d:
        r1 = new com.android.camera.ui.HorizontalListView$3;	 Catch:{ all -> 0x00bf }
        r1.<init>();	 Catch:{ all -> 0x00bf }
        r0.post(r1);	 Catch:{ all -> 0x00bf }
    L_0x0085:
        r1 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r3 = r0.mPreviousSelectViewIndex;	 Catch:{ all -> 0x00bf }
        if (r1 == r3) goto L_0x00bd;
    L_0x008b:
        r1 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r3 = r0.mLeftViewIndex;	 Catch:{ all -> 0x00bf }
        if (r1 <= r3) goto L_0x00b0;
    L_0x0091:
        r1 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r3 = r0.mRightViewIndex;	 Catch:{ all -> 0x00bf }
        if (r1 > r3) goto L_0x00b0;
    L_0x0097:
        r1 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r1 = r0.toDataIndex(r1);	 Catch:{ all -> 0x00bf }
        r3 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r4 = r0.mLeftViewIndex;	 Catch:{ all -> 0x00bf }
        r3 = r3 - r4;
        r3 = r3 - r2;
        r2 = r0.getChildAt(r3);	 Catch:{ all -> 0x00bf }
        r3 = r0.mAdapter;	 Catch:{ all -> 0x00bf }
        r3 = r3.getItemId(r1);	 Catch:{ all -> 0x00bf }
        r0.notifyItemSelect(r2, r1, r3);	 Catch:{ all -> 0x00bf }
    L_0x00b0:
        r1 = r0.mSelectViewIndex;	 Catch:{ all -> 0x00bf }
        r0.mPreviousSelectViewIndex = r1;	 Catch:{ all -> 0x00bf }
        goto L_0x00bd;
    L_0x00b5:
        r1 = new com.android.camera.ui.HorizontalListView$2;	 Catch:{ all -> 0x00bf }
        r1.<init>();	 Catch:{ all -> 0x00bf }
        r0.post(r1);	 Catch:{ all -> 0x00bf }
    L_0x00bd:
        monitor-exit(r0);
        return;
    L_0x00bf:
        r1 = move-exception;
        monitor-exit(r0);
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ui.HorizontalListView.onLayout(boolean, int, int, int, int):void");
    }

    private void fillList(int i) {
        int right;
        View childAt = getChildAt(getChildCount() - 1);
        int i2 = 0;
        if (childAt != null) {
            right = childAt.getRight();
        } else {
            right = 0;
        }
        fillListRight(right, i);
        childAt = getChildAt(0);
        if (childAt != null) {
            i2 = childAt.getLeft();
        }
        fillListLeft(i2, i);
    }

    private void fillListRight(int i, int i2) {
        while (i + i2 < getWidth() && this.mRightViewIndex < this.mAdapter.getCount()) {
            View view = this.mAdapter.getView(toDataIndex(this.mRightViewIndex), (View) this.mRemovedViewQueue.poll(), this);
            if (this.mSelectCenter || this.mRightViewIndex != this.mSelectViewIndex) {
                view.setActivated(false);
            } else {
                this.mLastSelectImageListItem = view;
                view.setActivated(true);
            }
            addAndMeasureChild(view, -1);
            i += getChildWidth();
            if (this.mRightViewIndex == this.mAdapter.getCount() - 1) {
                this.mMaxX = ((this.mPaddingWidth * 2) + (getChildWidth() * this.mAdapter.getCount())) - getWidth();
            }
            if (this.mMaxX < 0) {
                this.mMaxX = 0;
            }
            this.mRightViewIndex++;
        }
    }

    private int toDataIndex(int i) {
        if (Util.isLayoutRTL(getContext())) {
            return (this.mAdapter.getCount() - 1) - i;
        }
        return i;
    }

    private int toViewIndex(int i) {
        if (Util.isLayoutRTL(getContext())) {
            return (this.mAdapter.getCount() - 1) - i;
        }
        return i;
    }

    private void fillListLeft(int i, int i2) {
        while (i + i2 > 0 && this.mLeftViewIndex >= 0) {
            View view = this.mAdapter.getView(toDataIndex(this.mLeftViewIndex), (View) this.mRemovedViewQueue.poll(), this);
            if (this.mSelectCenter || this.mLeftViewIndex != this.mSelectViewIndex) {
                view.setActivated(false);
            } else {
                this.mLastSelectImageListItem = view;
                view.setActivated(true);
            }
            addAndMeasureChild(view, 0);
            i -= getChildWidth();
            this.mLeftViewIndex--;
            this.mDisplayOffset -= getChildWidth();
        }
    }

    private void removeNonVisibleItems(int i) {
        View childAt = getChildAt(0);
        int i2 = 0;
        while (childAt != null && childAt.getRight() + i <= 0) {
            this.mDisplayOffset += getChildWidth();
            cacheChildItem(childAt);
            this.mLeftViewIndex++;
            i2++;
            childAt = getChildAt(i2);
        }
        if (i2 > 0) {
            removeViewsInLayout(0, i2 - 0);
        }
        int childCount = getChildCount() - 1;
        childAt = getChildAt(getChildCount() - 1);
        i2 = childCount;
        while (childAt != null && childAt.getLeft() + i >= getWidth()) {
            cacheChildItem(childAt);
            this.mRightViewIndex--;
            i2--;
            childAt = getChildAt(i2);
        }
        if (childCount > i2) {
            removeViewsInLayout(i2 + 1, childCount - i2);
        }
    }

    private void cacheChildItem(View view) {
        if (this.mRemovedViewQueue.size() < 10) {
            this.mRemovedViewQueue.offer(view);
        }
    }

    private void positionItems(int i) {
        if (getChildCount() > 0) {
            this.mDisplayOffset += i;
            i = this.mDisplayOffset;
            int childWidth = getChildWidth();
            int height = getHeight();
            int i2 = this.mPresetWidth / 2;
            int i3 = this.mLeftViewIndex + 1;
            int i4 = i;
            i = 0;
            while (i < getChildCount()) {
                View childAt = getChildAt(i);
                int i5 = (childAt.getLeft() >= i2 || childAt.getRight() <= i2) ? 0 : 1;
                int i6 = i4 + childWidth;
                childAt.layout(i4, 0, i6, height);
                boolean z = i4 < i2 && i6 > i2;
                childAt.setActivated(z);
                if (this.mSelectCenter && z && i5 == 0) {
                    i4 = toDataIndex(i3);
                    notifyItemSelect(childAt, i4, this.mAdapter.getItemId(i4));
                }
                i3++;
                i++;
                i4 = i6;
            }
        }
    }

    private void loadItems() {
        for (int i = 0; i < getChildCount(); i++) {
            getChildAt(i);
        }
    }

    public synchronized void scrollTo(int i) {
        this.mIsScrollingPerformed = true;
        this.mScroller.startScroll(this.mNextX, 0, i - this.mNextX, 0);
        requestLayout();
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (!isEnabled()) {
            return false;
        }
        boolean dispatchTouchEvent = super.dispatchTouchEvent(motionEvent) | this.mGesture.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action != 3) {
            switch (action) {
                case 0:
                    this.mTouchDown = true;
                    this.mBlockNotification = false;
                    break;
                case 1:
                    break;
            }
        }
        if (this.mScroller.isFinished()) {
            this.mIsScrollingPerformed = false;
            justify();
        }
        this.mTouchDown = false;
        return dispatchTouchEvent;
    }

    protected boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        synchronized (this) {
            this.mScroller.fling(this.mNextX, 0, (int) (-f), 0, 0, this.mMaxX, 0, 0);
        }
        requestLayout();
        return true;
    }

    protected boolean onDown(MotionEvent motionEvent) {
        this.mScroller.forceFinished(true);
        return true;
    }

    public boolean isScrolling() {
        return this.mIsScrollingPerformed;
    }

    private void notifyItemSelect(View view, int i, long j) {
        if (view != null) {
            if (!this.mBlockNotification) {
                if (this.mOnItemClicked != null) {
                    this.mOnItemClicked.onItemClick(this, view, i, j);
                }
                if (this.mOnItemSelected != null) {
                    this.mOnItemSelected.onItemSelected(this, view, i, j);
                }
                if (this.mLastSelectImageListItem != null) {
                    this.mLastSelectImageListItem.setActivated(false);
                }
                this.mLastSelectImageListItem = view;
                view.setActivated(true);
            } else if (i == toDataIndex(this.mSelectViewIndex)) {
                if (this.mLastSelectImageListItem != null) {
                    this.mLastSelectImageListItem.setActivated(false);
                }
                this.mLastSelectImageListItem = view;
                view.setActivated(true);
            }
        }
    }

    private int getChildWidth() {
        return this.mItemWidth;
    }

    public boolean isTouchMoveEnable() {
        return this.mTouchMoveEnable;
    }

    public void setTouchMoveEnable(boolean z) {
        this.mTouchMoveEnable = z;
    }
}

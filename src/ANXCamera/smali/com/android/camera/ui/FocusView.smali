.class public Lcom/android/camera/ui/FocusView;
.super Landroid/view/View;
.source "FocusView.java"

# interfaces
.implements Lcom/android/camera/ui/FocusIndicator;
.implements Lcom/android/camera/ui/Rotatable;
.implements Lcom/android/camera/ui/V6FunctionUI;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/FocusView$ExposureViewListener;,
        Lcom/android/camera/ui/FocusView$SetPositionType;,
        Lcom/android/camera/ui/FocusView$CenterFlag;,
        Lcom/android/camera/ui/FocusView$CursorState;,
        Lcom/android/camera/ui/FocusView$ViewState;
    }
.end annotation


# static fields
.field public static final CENTER_CAPTURE:I = 0x2

.field public static final CENTER_CIRCLE:I = 0x1

.field public static final CENTER_LOCK:I = 0x5

.field public static final CENTER_MOON:I = 0x4

.field public static final CENTER_NONE:I = 0x0

.field public static final CENTER_SUN:I = 0x3

.field public static final CURSOR_GATHER:I = 0x1

.field public static final CURSOR_NORMAL:I = 0x0

.field public static final CURSOR_SLIDE_BACK:I = 0x2

.field private static final DISAPPEAR_TIME:I = 0x5dc

.field private static final END_DISAPPEAR_TIMEOUT:I = 0x320

.field private static final GAP_NUM:F

.field public static final MAX_SLIDE_DISTANCE:I

.field private static final MSG_ANIMATE_EV_CENTER:I = 0x7

.field private static final MSG_FINISH_DISAPPEAR:I = 0x5

.field private static final MSG_RESET_CENTER:I = 0x6

.field private static final MSG_START_DISAPPEAR:I = 0x4

.field public static final NORMAL_CAPTURE:I = 0x0

.field public static final NORMAL_EV:I = 0x1

.field public static final SET_BY_AUTO_DISAPPEAR:I = 0x6

.field public static final SET_BY_AUTO_FOCUS_MOVING:I = 0x3

.field public static final SET_BY_CANCEL_PREVIOUS_FOCUS:I = 0x2

.field public static final SET_BY_CLEAR_VIEW:I = 0x7

.field public static final SET_BY_DEVICE_KEEP_MOVING:I = 0x4

.field public static final SET_BY_INITIALIZE:I = 0x8

.field public static final SET_BY_RESET_CENTER:I = 0x5

.field public static final SET_BY_RESET_TO_FACE_AREA:I = 0x9

.field public static final SET_BY_TOUCH_DOWN:I = 0x1

.field private static final START_DISAPPEAR_TIMEOUT:I = 0x1388

.field private static final STATE_CHANGE_TIME:I = 0x1f4

.field private static final STATE_FAIL:I = 0x3

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_START:I = 0x1

.field private static final STATE_SUCCESS:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static final TRIANGLE_BASE_DIS:I

.field public static final ZERO_MINUS:I = 0x3

.field public static final ZERO_PLUS:I = 0x4


# instance fields
.field private mActivity:Lcom/android/camera/Camera;

.field private mAdapter:Lcom/android/camera/ui/RollAdapter;

.field private mAdjustedDoneTime:J

.field private mBeingEvAdjusted:Z

.field private mBottomRelative:I

.field private mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

.field private mCaptureBitmap:Landroid/graphics/Bitmap;

.field private mCenterFlag:I

.field private mCenterX:I

.field private mCenterY:I

.field private mCurrentDistanceY:I

.field private mCurrentItem:I

.field private mCurrentMinusCircleCenter:I

.field private mCurrentMinusCircleRadius:F

.field private mCurrentMode:I

.field private mCurrentRadius:I

.field private mCurrentRayBottom:I

.field private mCurrentRayHeight:I

.field private mCurrentRayWidth:I

.field private mCurrentViewState:I

.field private mCursorState:I

.field private mDisplayRect:Landroid/graphics/Rect;

.field private mEVAnimationRatio:F

.field private mEVAnimationStartTime:J

.field private mEVCaptureRatio:F

.field private mEvValue:F

.field private mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

.field private mFailTime:J

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHandler:Landroid/os/Handler;

.field private mHeight:I

.field private mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsDown:Z

.field private mIsDraw:Z

.field private mIsEvAdjustable:Z

.field private mIsTouchFocus:Z

.field private mLastItem:I

.field private mLockBodyBitmap:Landroid/graphics/Bitmap;

.field private mLockHeadBitmap:Landroid/graphics/Bitmap;

.field private mRotation:I

.field private mScrollDistanceY:I

.field private mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private mStartTime:J

.field private mState:I

.field private mSuccessTime:J

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 49
    const-class v0, Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    .line 72
    const-string v0, "camera_exposure_compensation_steps_num"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    .line 74
    const v0, 0x42dc999a    # 110.3f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    .line 75
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->TRIANGLE_BASE_DIS:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 250
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 88
    const/4 p2, 0x0

    iput p2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 102
    iput p2, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    .line 119
    iput p2, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 166
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 208
    new-instance v0, Lcom/android/camera/ui/FocusView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/FocusView$1;-><init>(Lcom/android/camera/ui/FocusView;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    .line 745
    new-instance v0, Lcom/android/camera/ui/FocusView$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/FocusView$2;-><init>(Lcom/android/camera/ui/FocusView;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 251
    move-object v0, p1

    check-cast v0, Lcom/android/camera/Camera;

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mActivity:Lcom/android/camera/Camera;

    .line 253
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 255
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 256
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 258
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 p2, 0x7f020000

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mCaptureBitmap:Landroid/graphics/Bitmap;

    .line 260
    new-instance p1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    invoke-direct {p1}, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    .line 261
    new-instance p1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .line 262
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget-object p2, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCaptureBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V

    .line 264
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f020150

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mLockHeadBitmap:Landroid/graphics/Bitmap;

    .line 265
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f02014f

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mLockBodyBitmap:Landroid/graphics/Bitmap;

    .line 266
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget-object p2, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mLockHeadBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setLockIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 267
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {p1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 268
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 48
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/camera/ui/FocusView;I)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/android/camera/ui/FocusView;->reset(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/FocusView$ExposureViewListener;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/ui/FocusView;)Landroid/graphics/Rect;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/ui/FocusView;FFF)Z
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/ui/FocusView;->isInCircle(FFF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1600(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->removeMessages()V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->setTouchDown()V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/camera/ui/FocusView;)Z
    .locals 0

    .line 48
    iget-boolean p0, p0, Lcom/android/camera/ui/FocusView;->mIsEvAdjustable:Z

    return p0
.end method

.method static synthetic access$1900(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/Camera;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/ui/FocusView;->mActivity:Lcom/android/camera/Camera;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/ui/FocusView;)J
    .locals 2

    .line 48
    iget-wide v0, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationStartTime:J

    return-wide v0
.end method

.method static synthetic access$2000(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    return p0
.end method

.method static synthetic access$2100(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    return p0
.end method

.method static synthetic access$2102(Lcom/android/camera/ui/FocusView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    return p1
.end method

.method static synthetic access$2200(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    return p0
.end method

.method static synthetic access$2202(Lcom/android/camera/ui/FocusView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    return p1
.end method

.method static synthetic access$2300()I
    .locals 1

    .line 48
    sget v0, Lcom/android/camera/ui/FocusView;->TRIANGLE_BASE_DIS:I

    return v0
.end method

.method static synthetic access$2402(Lcom/android/camera/ui/FocusView;Z)Z
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    return p1
.end method

.method static synthetic access$2500(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->getItemByCoordinate()I

    move-result p0

    return p0
.end method

.method static synthetic access$2600(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    return p0
.end method

.method static synthetic access$2700(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->startAnimation()V

    return-void
.end method

.method static synthetic access$2802(Lcom/android/camera/ui/FocusView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mLastItem:I

    return p1
.end method

.method static synthetic access$2900(Lcom/android/camera/ui/FocusView;IZ)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/FocusView;->setCurrentItem(IZ)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/ui/FocusView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    return p0
.end method

.method static synthetic access$3000(Lcom/android/camera/ui/FocusView;)F
    .locals 0

    .line 48
    iget p0, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    return p0
.end method

.method static synthetic access$302(Lcom/android/camera/ui/FocusView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    return p1
.end method

.method static synthetic access$3100(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/ui/FocusView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    return p1
.end method

.method static synthetic access$502(Lcom/android/camera/ui/FocusView;F)F
    .locals 0

    .line 48
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->calculateAttribute()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/ui/FocusView;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetCenter()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/ui/FocusView;)Z
    .locals 0

    .line 48
    iget-boolean p0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/ui/FocusView;)Z
    .locals 0

    .line 48
    iget-boolean p0, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    return p0
.end method

.method static synthetic access$902(Lcom/android/camera/ui/FocusView;Z)Z
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    return p1
.end method

.method private calculateAttribute()V
    .locals 18

    .line 890
    move-object/from16 v0, p0

    .line 891
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    invoke-direct {v0, v1}, Lcom/android/camera/ui/FocusView;->getItemRatio(I)F

    move-result v1

    .line 892
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mLastItem:I

    invoke-direct {v0, v2}, Lcom/android/camera/ui/FocusView;->getItemRatio(I)F

    move-result v2

    .line 894
    iget v3, v0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const v4, 0x3e4ccccd    # 0.2f

    const v5, 0x3f69fbe7    # 0.914f

    const/high16 v6, 0x40c00000    # 6.0f

    const/4 v7, 0x1

    const/4 v8, 0x3

    const/high16 v9, 0x40f00000    # 7.5f

    const/high16 v10, 0x3fc00000    # 1.5f

    const/4 v11, 0x4

    const v12, 0x3f4ccccd    # 0.8f

    const/high16 v13, 0x40400000    # 3.0f

    const/high16 v14, 0x40a00000    # 5.0f

    const/high16 v15, 0x3f800000    # 1.0f

    const/high16 v16, 0x3f000000    # 0.5f

    const/high16 v17, 0x40000000    # 2.0f

    packed-switch v3, :pswitch_data_0

    .line 948
    :pswitch_0
    iput v7, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 896
    :pswitch_1
    iget v3, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    cmpg-float v3, v3, v16

    if-gez v3, :cond_0

    .line 897
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float v1, v1, v17

    .line 898
    sub-float/2addr v15, v2

    mul-float/2addr v15, v1

    add-float/2addr v2, v15

    mul-float v17, v17, v2

    add-float v6, v6, v17

    invoke-static {v6}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    iput v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 899
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v2, v2

    mul-float/2addr v5, v1

    add-float v16, v16, v5

    mul-float v2, v2, v16

    float-to-int v2, v2

    iput v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 900
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v2, v2

    mul-float/2addr v4, v1

    add-float/2addr v12, v4

    mul-float/2addr v2, v12

    iput v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 901
    iput v11, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 903
    :cond_0
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    sub-float v2, v2, v16

    mul-float v2, v2, v17

    .line 904
    invoke-static {v10}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 905
    mul-float v3, v1, v2

    sub-float/2addr v15, v2

    sub-float/2addr v3, v15

    mul-float v4, v17, v3

    add-float/2addr v4, v14

    invoke-static {v4}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    iput v4, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 906
    mul-float/2addr v3, v13

    add-float/2addr v9, v3

    invoke-static {v9}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 907
    mul-float/2addr v13, v15

    add-float/2addr v14, v13

    mul-float v17, v17, v1

    mul-float v17, v17, v2

    add-float v14, v14, v17

    invoke-static {v14}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 908
    iput v8, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 910
    goto/16 :goto_0

    .line 912
    :pswitch_2
    iget v3, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    cmpg-float v3, v3, v16

    if-gtz v3, :cond_1

    .line 913
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float v1, v1, v17

    .line 914
    invoke-static {v10}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 915
    sub-float/2addr v15, v1

    mul-float v3, v2, v15

    sub-float/2addr v3, v1

    mul-float v4, v17, v3

    add-float/2addr v4, v14

    invoke-static {v4}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    iput v4, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 916
    mul-float/2addr v3, v13

    add-float/2addr v9, v3

    invoke-static {v9}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 917
    mul-float/2addr v13, v1

    add-float/2addr v14, v13

    mul-float v17, v17, v2

    mul-float v17, v17, v15

    add-float v14, v14, v17

    invoke-static {v14}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 918
    iput v8, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 920
    :cond_1
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    sub-float v2, v2, v16

    mul-float v2, v2, v17

    .line 921
    const/high16 v3, 0x41000000    # 8.0f

    sub-float v1, v15, v1

    mul-float/2addr v1, v2

    mul-float v17, v17, v1

    sub-float v3, v3, v17

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 922
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v1, v1

    sub-float/2addr v15, v2

    mul-float/2addr v5, v15

    add-float v16, v16, v5

    mul-float v1, v1, v16

    float-to-int v1, v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 923
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v1, v1

    mul-float/2addr v4, v15

    add-float/2addr v12, v4

    mul-float/2addr v1, v12

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 924
    iput v11, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 926
    goto :goto_0

    .line 928
    :pswitch_3
    nop

    .line 929
    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v3, v0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v3}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 930
    mul-float v17, v17, v1

    add-float v6, v6, v17

    invoke-static {v6}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 931
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v1, v1

    mul-float v1, v1, v16

    float-to-int v1, v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 932
    iget v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v1, v1

    mul-float/2addr v1, v12

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 933
    iput v11, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0

    .line 935
    :cond_2
    invoke-static {v10}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    iput v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 936
    mul-float v17, v17, v1

    add-float v14, v14, v17

    invoke-static {v14}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    iput v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 937
    mul-float/2addr v13, v1

    add-float/2addr v9, v13

    invoke-static {v9}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 938
    invoke-static {v14}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    iput v1, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 939
    iput v8, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 941
    goto :goto_0

    .line 943
    :pswitch_4
    nop

    .line 944
    iget-boolean v1, v0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v1}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 945
    invoke-interface {v1}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v7, 0x2

    nop

    :cond_3
    iput v7, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 946
    nop

    .line 953
    :goto_0
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelResetCenter()V

    .line 955
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 956
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    .line 959
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/FocusView;->getCurrentAngle()I

    move-result v2

    int-to-float v2, v2

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentAngle:F

    .line 960
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    .line 961
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    .line 962
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    .line 965
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    .line 966
    iget-object v1, v0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    iput v0, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleRadius:F

    .line 967
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private clearMessages()V
    .locals 2

    .line 673
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 674
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 675
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 676
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 677
    return-void
.end method

.method private getCurrentAngle()I
    .locals 7

    .line 970
    nop

    .line 971
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/16 v4, 0x168

    const/4 v5, 0x0

    if-ne v0, v3, :cond_1

    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    if-eq v0, v1, :cond_1

    .line 973
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 974
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v1

    sub-int/2addr v0, v1

    mul-int/2addr v0, v4

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v1

    div-int/2addr v0, v1

    goto :goto_0

    .line 976
    :cond_0
    move v0, v5

    :goto_0
    invoke-static {v0, v5, v4}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    rsub-int v5, v0, 0x168

    goto :goto_2

    .line 977
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const/4 v6, 0x1

    if-ne v0, v6, :cond_3

    .line 978
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    sub-int/2addr v0, v1

    .line 979
    sget v1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    invoke-static {v0, v5, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    .line 980
    sget v1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/2addr v1, v3

    if-lt v0, v1, :cond_2

    .line 981
    sget v1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/2addr v1, v3

    sub-int/2addr v0, v1

    mul-int/2addr v0, v4

    sget v1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/2addr v1, v3

    div-int/2addr v0, v1

    goto :goto_1

    .line 983
    :cond_2
    move v0, v5

    :goto_1
    invoke-static {v0, v5, v4}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    rsub-int v5, v0, 0x168

    .line 984
    goto :goto_2

    :cond_3
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const/16 v3, 0x87

    const/high16 v4, 0x40000000    # 2.0f

    const/high16 v6, 0x43070000    # 135.0f

    if-ne v0, v2, :cond_4

    .line 985
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float/2addr v0, v4

    mul-float/2addr v6, v0

    float-to-int v0, v6

    .line 986
    invoke-static {v0, v5, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result v5

    goto :goto_2

    .line 987
    :cond_4
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    if-ne v0, v1, :cond_5

    .line 988
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    mul-float/2addr v1, v4

    sub-float/2addr v0, v1

    mul-float/2addr v6, v0

    float-to-int v0, v6

    .line 989
    invoke-static {v0, v5, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result v5

    .line 991
    :cond_5
    :goto_2
    return v5
.end method

.method private getInterpolation(F)F
    .locals 4

    .line 665
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 666
    float-to-double v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 667
    const/high16 p1, 0x3f800000    # 1.0f

    .line 669
    :cond_0
    return p1
.end method

.method private getItemByCoordinate()I
    .locals 3

    .line 711
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v0}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v0

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    sub-int/2addr v1, v2

    mul-int/2addr v0, v1

    sget v1, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/2addr v0, v1

    .line 712
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    .line 713
    return v0
.end method

.method private getItemRatio(I)F
    .locals 3

    .line 884
    int-to-float p1, p1

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v0}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    .line 885
    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float v1, p1, v0

    const/high16 v2, 0x40000000    # 2.0f

    if-ltz v1, :cond_0

    sub-float/2addr p1, v0

    :goto_0
    mul-float/2addr v2, p1

    goto :goto_1

    :cond_0
    goto :goto_0

    .line 886
    :goto_1
    return v2
.end method

.method private initRect()V
    .locals 3

    .line 531
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    .line 533
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    .line 534
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    .line 536
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    .line 537
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    .line 539
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/FocusView;->setPivotX(F)V

    .line 540
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/FocusView;->setPivotY(F)V

    .line 542
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .line 543
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v2, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    .line 542
    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setRtlAndDisplayRect(ZLandroid/graphics/Rect;)V

    .line 545
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCenter(II)V

    .line 546
    return-void
.end method

.method private isInCircle(FFF)Z
    .locals 2

    .line 995
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 996
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    int-to-float v0, v0

    sub-float/2addr p2, v0

    .line 997
    mul-float/2addr p1, p1

    mul-float/2addr p2, p2

    add-float/2addr p1, p2

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    .line 998
    float-to-double v0, p3

    cmpg-double p1, p1, v0

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isStableStart()Z
    .locals 2

    .line 654
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 655
    return v1

    .line 657
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_1

    .line 658
    return v1

    .line 661
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isMeteringAreaOnly()Z

    move-result v0

    return v0
.end method

.method private processParameterIfNeeded(F)V
    .locals 1

    .line 321
    iget-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz p1, :cond_0

    .line 322
    iget p1, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    if-nez p1, :cond_0

    .line 323
    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 326
    :cond_0
    return-void
.end method

.method private reload()V
    .locals 2

    .line 680
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-static {}, Lcom/android/camera/CameraSettings;->readExposure()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/ui/RollAdapter;->getItemIndexByValue(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 682
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 684
    :cond_0
    return-void
.end method

.method private removeMessages()V
    .locals 0

    .line 695
    return-void
.end method

.method private reset(I)V
    .locals 4

    .line 512
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    const/4 v1, 0x2

    if-nez v0, :cond_0

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    if-eq p1, v1, :cond_0

    .line 513
    return-void

    .line 516
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 517
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 519
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    div-int/2addr v2, v1

    iget v3, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    div-int/2addr v3, v1

    invoke-virtual {p0, p1, v2, v3}, Lcom/android/camera/ui/FocusView;->setPosition(III)V

    .line 520
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 521
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 523
    iput-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 524
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->stopEvAdjust()V

    .line 526
    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 527
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 528
    return-void
.end method

.method private resetCenter()V
    .locals 2

    .line 549
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 550
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    .line 552
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_0

    .line 553
    return-void

    .line 557
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowAeAfLockIndicator()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 558
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 559
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 560
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    goto :goto_0

    .line 561
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 562
    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 563
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 564
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 565
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 567
    :cond_2
    :goto_0
    return-void
.end method

.method private resetEvValue()V
    .locals 2

    .line 702
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    .line 703
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    .line 704
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 705
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    .line 706
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    .line 707
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->reset()V

    .line 708
    return-void
.end method

.method private setCurrentItem(IZ)V
    .locals 1

    .line 717
    iget p2, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    if-eq p1, p2, :cond_2

    .line 718
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 719
    iget-object p2, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz p2, :cond_1

    .line 721
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xa9

    .line 722
    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 723
    if-nez p2, :cond_0

    .line 724
    sget-object p1, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string p2, "needEvPresenter"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 726
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v0, p1}, Lcom/android/camera/ui/RollAdapter;->getItemValue(I)I

    move-result p1

    const/4 v0, 0x1

    invoke-interface {p2, p1, v0}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->onEvChanged(II)V

    .line 729
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 731
    :cond_2
    return-void
.end method

.method private setDraw(Z)V
    .locals 1

    .line 687
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eq v0, p1, :cond_0

    .line 688
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->reload()V

    .line 690
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    .line 691
    return-void
.end method

.method private setTouchDown()V
    .locals 2

    .line 698
    sget v0, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    .line 699
    return-void
.end method

.method private showTipMessage(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 1014
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1015
    if-nez v0, :cond_0

    .line 1016
    return-void

    .line 1018
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->isPortraitHintVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1019
    const/16 v1, 0x8

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->setPortraitHintVisible(I)V

    .line 1021
    :cond_1
    const/4 v1, 0x2

    invoke-interface {v0, p1, p2, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 1022
    return-void
.end method

.method private startAnimation()V
    .locals 2

    .line 878
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationStartTime:J

    .line 879
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 880
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 881
    return-void
.end method

.method private stopEvAdjust()V
    .locals 3

    .line 734
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-eqz v0, :cond_0

    .line 735
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    .line 737
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa9

    .line 738
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 739
    if-eqz v1, :cond_0

    .line 740
    const/4 v2, 0x2

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->onEvChanged(II)V

    .line 743
    :cond_0
    return-void
.end method

.method private updateEV()V
    .locals 3

    .line 581
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    .line 582
    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRational()Landroid/util/Rational;

    move-result-object v0

    .line 583
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    invoke-interface {v1, v2}, Lcom/android/camera/ui/RollAdapter;->getItemValue(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    mul-float/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    goto :goto_0

    .line 586
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    .line 588
    :goto_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 500
    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 501
    return-void
.end method

.method public clear(I)V
    .locals 3

    .line 504
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clear: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz v0, :cond_0

    .line 506
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 508
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 509
    return-void
.end method

.method public enableControls(Z)V
    .locals 0

    .line 397
    return-void
.end method

.method public initialize(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V
    .locals 0

    .line 276
    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 277
    const/16 p1, 0x8

    invoke-direct {p0, p1}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 278
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 272
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 273
    return-void
.end method

.method public isEvAdjusted()Z
    .locals 1

    .line 614
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    return v0
.end method

.method public isEvAdjustedTime()Z
    .locals 7

    .line 618
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-nez v0, :cond_0

    .line 620
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    const-wide/16 v5, 0x5dc

    invoke-static/range {v1 .. v6}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 618
    :goto_0
    return v0
.end method

.method public isVisible()Z
    .locals 1

    .line 415
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    return v0
.end method

.method public onCameraOpen()V
    .locals 0

    .line 336
    return-void
.end method

.method public onCreate()V
    .locals 0

    .line 331
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1003
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 1004
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1005
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 1006
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 1008
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 1009
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1011
    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 571
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-nez v0, :cond_0

    .line 572
    return-void

    .line 575
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz v0, :cond_1

    .line 576
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 578
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 391
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 392
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 386
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 387
    return-void
.end method

.method public onViewTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 285
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->isStableStart()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 289
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 291
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 292
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_1

    .line 293
    iget-boolean v2, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    if-eqz v2, :cond_1

    .line 294
    iput-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 298
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    if-eq v3, v2, :cond_2

    const/4 v2, 0x3

    .line 299
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne v2, p1, :cond_4

    .line 300
    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-eqz p1, :cond_3

    .line 301
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackEvAdjusted()V

    .line 302
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->stopEvAdjust()V

    .line 303
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    .line 305
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x6

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 306
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x3e8

    invoke-virtual {p1, v2, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 312
    :cond_3
    iget-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eqz p1, :cond_4

    .line 313
    iput-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 317
    :cond_4
    if-nez v0, :cond_6

    iget-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    goto :goto_1

    :cond_6
    :goto_0
    move v1, v3

    :goto_1
    return v1

    .line 286
    :cond_7
    :goto_2
    return v1
.end method

.method public reInit()V
    .locals 5

    .line 339
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string v1, "onCameraOpen>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->initRect()V

    .line 344
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    .line 345
    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRange()Landroid/util/Range;

    move-result-object v0

    .line 347
    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 348
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 349
    if-eqz v0, :cond_5

    if-ne v0, v1, :cond_0

    goto/16 :goto_3

    .line 353
    :cond_0
    new-instance v2, Lcom/android/camera/ui/FloatSlideAdapter;

    sget v3, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-nez v3, :cond_1

    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_1
    sub-int v3, v0, v1

    int-to-float v3, v3

    sget v4, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    div-float/2addr v3, v4

    :goto_0
    invoke-direct {v2, v1, v0, v3}, Lcom/android/camera/ui/FloatSlideAdapter;-><init>(IIF)V

    iput-object v2, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    .line 354
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCameraOpen: adapter="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-nez v0, :cond_2

    .line 356
    return-void

    .line 359
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 361
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    .line 362
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_3

    .line 364
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    .line 365
    goto :goto_1

    .line 368
    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    .line 372
    :goto_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isEvAdjustable()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/FocusView;->setEvAdjustable(Z)V

    .line 374
    invoke-static {}, Lcom/android/camera/CameraSettings;->readExposure()I

    move-result v0

    .line 375
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/android/camera/ui/RollAdapter;->getItemIndexByValue(Ljava/lang/Object;)I

    move-result v0

    .line 376
    if-gez v0, :cond_4

    .line 377
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v0}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    goto :goto_2

    .line 379
    :cond_4
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 381
    :goto_2
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 382
    return-void

    .line 350
    :cond_5
    :goto_3
    return-void
.end method

.method public releaseListener()V
    .locals 1

    .line 281
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 282
    return-void
.end method

.method public setEvAdjustable(Z)V
    .locals 3

    .line 591
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-nez v0, :cond_0

    .line 592
    return-void

    .line 594
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsEvAdjustable:Z

    .line 595
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 596
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->calculateAttribute()V

    .line 606
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    const/16 v1, 0x8

    if-eqz p1, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    move v2, v1

    :goto_0
    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvAdjustVisible(I)V

    .line 607
    if-nez p1, :cond_2

    .line 608
    iget-object p1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    .line 610
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 611
    return-void
.end method

.method public setFocusType(Z)V
    .locals 0

    .line 411
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    .line 412
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 0

    .line 401
    iget p2, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    if-eq p2, p1, :cond_0

    .line 402
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    .line 403
    iget-object p2, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {p2, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setOrientation(I)V

    .line 404
    iget-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eqz p1, :cond_0

    .line 405
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 408
    :cond_0
    return-void
.end method

.method public setPosition(III)V
    .locals 1

    .line 624
    iput p2, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    .line 625
    iput p3, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    .line 627
    int-to-float v0, p2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/FocusView;->setPivotX(F)V

    .line 628
    int-to-float v0, p3

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/FocusView;->setPivotY(F)V

    .line 629
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, p2, p3}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCenter(II)V

    .line 630
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->removeMessages()V

    .line 632
    iget p2, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_1

    .line 633
    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 638
    :cond_0
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xa9

    .line 639
    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 640
    if-eqz p2, :cond_1

    .line 641
    invoke-interface {p2}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->resetEvValue()V

    .line 648
    :cond_1
    :goto_0
    iget p2, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    if-eqz p2, :cond_2

    const/4 p2, 0x7

    if-eq p1, p2, :cond_2

    .line 649
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 651
    :cond_2
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public showFail()V
    .locals 4

    .line 486
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusFailAnimation()V

    .line 487
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string v1, "showFail"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 489
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 490
    invoke-direct {p0, v1}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 491
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 492
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mFailTime:J

    .line 493
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 494
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 496
    :cond_0
    return-void
.end method

.method public showStart()V
    .locals 4

    .line 425
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string v1, "showStart"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 427
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 428
    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    .line 429
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/ui/FocusView;->mStartTime:J

    .line 431
    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 434
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startTouchDownAnimation()V

    .line 436
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->isStableStart()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 438
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->showSuccess()V

    goto :goto_0

    .line 440
    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 441
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 442
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->processParameterIfNeeded(F)V

    .line 444
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 446
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 447
    return-void
.end method

.method public showSuccess()V
    .locals 6

    .line 455
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string v1, "showSuccess"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    const/4 v1, 0x5

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    .line 458
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 459
    invoke-direct {p0, v3}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 460
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 461
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/FocusView;->mSuccessTime:J

    .line 462
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-nez v0, :cond_0

    .line 463
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x320

    invoke-virtual {v0, v1, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 467
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_1

    .line 468
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string v1, "needExposurePresenter"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    return-void

    .line 473
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowAeAfLockIndicator()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 474
    const/16 v0, 0x8

    const v2, 0x7f0b01b7

    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/FocusView;->showTipMessage(II)V

    .line 475
    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0

    .line 476
    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 477
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0

    .line 479
    :cond_3
    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 481
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iget-boolean v2, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusSuccessAnimation(IZ)V

    .line 482
    return-void
.end method

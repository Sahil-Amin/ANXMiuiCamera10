package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Process;
import android.support.annotation.NonNull;
import java.io.File;

public class ContextCompat {
    private static final String DIR_ANDROID = "Android";
    private static final String DIR_CACHE = "cache";
    private static final String DIR_DATA = "data";
    private static final String DIR_FILES = "files";
    private static final String DIR_OBB = "obb";
    private static final String TAG = "ContextCompat";

    public static boolean startActivities(Context context, Intent[] intents) {
        return startActivities(context, intents, null);
    }

    public static boolean startActivities(Context context, Intent[] intents, Bundle options) {
        int version = VERSION.SDK_INT;
        if (version >= 16) {
            ContextCompatJellybean.startActivities(context, intents, options);
            return true;
        } else if (version < 11) {
            return false;
        } else {
            ContextCompatHoneycomb.startActivities(context, intents);
            return true;
        }
    }

    public static File[] getObbDirs(Context context) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getObbDirs(context);
        }
        File single;
        if (version >= 11) {
            single = ContextCompatHoneycomb.getObbDir(context);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_OBB, context.getPackageName());
        }
        return new File[]{single};
    }

    public static File[] getExternalFilesDirs(Context context, String type) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalFilesDirs(context, type);
        }
        File single;
        if (version >= 8) {
            single = ContextCompatFroyo.getExternalFilesDir(context, type);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, "data", context.getPackageName(), DIR_FILES, type);
        }
        return new File[]{single};
    }

    public static File[] getExternalCacheDirs(Context context) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalCacheDirs(context);
        }
        File single;
        if (version >= 8) {
            single = ContextCompatFroyo.getExternalCacheDir(context);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, "data", context.getPackageName(), DIR_CACHE);
        }
        return new File[]{single};
    }

    private static File buildPath(File base, String... segments) {
        File cur = base;
        for (String segment : segments) {
            if (cur == null) {
                cur = new File(segment);
            } else if (segment != null) {
                cur = new File(cur, segment);
            }
        }
        return cur;
    }

    public static final Drawable getDrawable(Context context, int id) {
        if (VERSION.SDK_INT >= 21) {
            return ContextCompatApi21.getDrawable(context, id);
        }
        return context.getResources().getDrawable(id);
    }

    public static final ColorStateList getColorStateList(Context context, int id) {
        if (VERSION.SDK_INT >= 23) {
            return ContextCompatApi23.getColorStateList(context, id);
        }
        return context.getResources().getColorStateList(id);
    }

    public static final int getColor(Context context, int id) {
        if (VERSION.SDK_INT >= 23) {
            return ContextCompatApi23.getColor(context, id);
        }
        return context.getResources().getColor(id);
    }

    public static int checkSelfPermission(@NonNull Context context, @NonNull String permission) {
        if (permission != null) {
            return context.checkPermission(permission, Process.myPid(), Process.myUid());
        }
        throw new IllegalArgumentException("permission is null");
    }

    public final File getNoBackupFilesDir(Context context) {
        if (VERSION.SDK_INT >= 21) {
            return ContextCompatApi21.getNoBackupFilesDir(context);
        }
        return createFilesDir(new File(context.getApplicationInfo().dataDir, "no_backup"));
    }

    public final File getCodeCacheDir(Context context) {
        if (VERSION.SDK_INT >= 21) {
            return ContextCompatApi21.getCodeCacheDir(context);
        }
        return createFilesDir(new File(context.getApplicationInfo().dataDir, "code_cache"));
    }

    /* JADX WARNING: Missing block: B:17:0x0035, code:
            return r4;
     */
    private static synchronized java.io.File createFilesDir(java.io.File r4) {
        /*
        r0 = android.support.v4.content.ContextCompat.class;
        monitor-enter(r0);
        r1 = r4.exists();	 Catch:{ all -> 0x0036 }
        if (r1 != 0) goto L_0x0034;
    L_0x0009:
        r1 = r4.mkdirs();	 Catch:{ all -> 0x0036 }
        if (r1 != 0) goto L_0x0034;
    L_0x000f:
        r1 = r4.exists();	 Catch:{ all -> 0x0036 }
        if (r1 == 0) goto L_0x0017;
    L_0x0015:
        monitor-exit(r0);
        return r4;
    L_0x0017:
        r1 = "ContextCompat";
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0036 }
        r2.<init>();	 Catch:{ all -> 0x0036 }
        r3 = "Unable to create files subdir ";
        r2.append(r3);	 Catch:{ all -> 0x0036 }
        r3 = r4.getPath();	 Catch:{ all -> 0x0036 }
        r2.append(r3);	 Catch:{ all -> 0x0036 }
        r2 = r2.toString();	 Catch:{ all -> 0x0036 }
        android.util.Log.w(r1, r2);	 Catch:{ all -> 0x0036 }
        r1 = 0;
        monitor-exit(r0);
        return r1;
    L_0x0034:
        monitor-exit(r0);
        return r4;
    L_0x0036:
        r4 = move-exception;
        monitor-exit(r0);
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.ContextCompat.createFilesDir(java.io.File):java.io.File");
    }
}

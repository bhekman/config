package com.example.bradleyhekman.observe;

import android.util.Log;
import android.widget.Toast;

import com.parse.ParseException;

/**
 * Created by bradleyhekman on 3/5/15.
 */
public class Lazy {
    static void quickToast(android.content.Context ctxt, String msg) {
        Toast.makeText(ctxt, msg, Toast.LENGTH_SHORT).show();
    }

    static void dlog(String LOGTAG, String msg) {
        if (BuildConfig.DEBUG)
            Log.d(LOGTAG, msg);
    }

    static void ilog(String LOGTAG, String msg) {
        Log.i(LOGTAG, msg);
    }

    static void elog(String LOGTAG, ParseException e) {
        Log.e(LOGTAG, e.toString());
    }
}

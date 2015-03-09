package com.example.bradleyhekman.observe;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.parse.Parse;
import com.parse.ParseAnalytics;
import com.parse.ParseUser;

/**
 * Created by bradleyhekman on 3/5/15.
 */
public class MainActivity extends Activity {
    // Parse credentials
    public static final String PARSE_APPLICATION_ID = "QUNijmdTyw5nGWRcT3wG6eaj8LorK2r2phOpmSfe";
    public static final String PARSE_CLIENT_KEY = "wq5pggohIdgsOUY9J5nv8S0QD50tucSXZCV1QwGJ";
    private static final String LOGTAG = "MainActivity";
    static boolean parseIsInitialized = false;
    ParseUser user = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Parse setup
        Lazy.dlog(LOGTAG, "enabling Parse datastore");
        if (!parseIsInitialized) {
            Parse.enableLocalDatastore(this);
            Parse.initialize(this, PARSE_APPLICATION_ID, PARSE_CLIENT_KEY);
            parseIsInitialized = true;
        }
        ParseAnalytics.trackAppOpenedInBackground(getIntent());

        user = ParseUser.getCurrentUser();
        if (user != null) {
            Lazy.ilog(LOGTAG, "User is already logged in: " + user.getObjectId());
            Intent feedbackIntent = new Intent(this, CreateFeedbackActivity.class);
            startActivity(feedbackIntent);
        } else {
            Lazy.ilog(LOGTAG, "User needs to log in");
            Intent loginIntent = new Intent(this, LoginActivity.class);
            loginIntent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
            startActivity(loginIntent);
        }
    }

    @Override
    protected void onRestart() {
        Lazy.ilog(LOGTAG, "main restarted");
        finish();
        super.onRestart();
    }

    @Override
    protected void onStart() {
        Lazy.ilog(LOGTAG, "main started");
        super.onStart();
    }

    @Override
    protected void onResume() {
        Lazy.ilog(LOGTAG, "main resumed");
        super.onResume();
    }

    @Override
    protected void onPause() {
        Lazy.ilog(LOGTAG, "main paused");
        super.onPause();
    }

    @Override
    protected void onStop() {
        Lazy.ilog(LOGTAG, "main stopped");
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        Lazy.ilog(LOGTAG, "main destroyed");
        super.onDestroy();
    }
}

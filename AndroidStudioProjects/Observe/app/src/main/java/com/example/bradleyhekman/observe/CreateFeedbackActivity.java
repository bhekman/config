package com.example.bradleyhekman.observe;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.parse.ParseAnalytics;
import com.parse.ParseException;
import com.parse.ParseObject;
import com.parse.ParseUser;
import com.parse.SaveCallback;

/**
 * Created by bradleyhekman on 2/24/15.
 */
public class CreateFeedbackActivity extends Activity {
    private static final String LOGTAG = "CreateFeedbackActivity";

    private ParseUser user;
    private EditText mFeedbackEditText;
    private Button mFeedbackSubmitButton;
    private GPSTracker gps;
    private String submittedText = "";

    // TODO: Connection checking
    //ConnectionDetector cd;

    @Override
    protected void onRestart() {
        Lazy.ilog(LOGTAG, "create restarted");
        super.onRestart();
    }

    @Override
    protected void onStart() {
        Lazy.ilog(LOGTAG, "create started");
        super.onStart();
    }

    @Override
    protected void onResume() {
        Lazy.ilog(LOGTAG, "create resumed");
        if (!gps.canGetLocation()) {
            gps.showSettingsAlert();
        }
        super.onResume();
    }

    @Override
    protected void onPause() {
        Lazy.ilog(LOGTAG, "create paused");
        super.onPause();
    }

    @Override
    protected void onStop() {
        Lazy.ilog(LOGTAG, "create stopped");
        gps.stopUsingGPS();
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        Lazy.ilog(LOGTAG, "create destroyed");
        super.onDestroy();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.create_feedback);

        //cd = new ConnectionDetector(getApplicationContext());
        gps = new GPSTracker(this);
        if (!gps.canGetLocation()) {
            gps.showSettingsAlert();
        }

        user = ParseUser.getCurrentUser();
        if (user != null) {
            Lazy.dlog(LOGTAG, "User is logged in as " + user.getUsername());
            Lazy.dlog(LOGTAG, "User obj id is: " + user.getObjectId());
        } else {
            finish();
        }

        mFeedbackEditText = (EditText) findViewById(R.id.mFeedbackEditText);
        mFeedbackSubmitButton = (Button) findViewById(R.id.mFeedbackSubmitButton);
        mFeedbackSubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                sendFeedback();
            }
        });
    }

    private void sendFeedback() {
        // TODO: add in progress dialog

        // Check for empty text first
        if (mFeedbackEditText.getText().toString() == "") return;

        // check if GPS enabled
        double latitude = 0;
        double longitude = 0;
        if (gps.canGetLocation()) {

            latitude = gps.getLatitude();
            longitude = gps.getLongitude();

            // \n is for new line
            Toast.makeText(getApplicationContext(),
                    "Your Location is - \nLat: " + latitude + "\nLong: " + longitude,
                    Toast.LENGTH_LONG).show();

        } else {
            // can't get location, ask for location
            gps.showSettingsAlert();
            return;
        }

        // get and clear text
        // text is still saved in submittedText in case submit fails.
        String feedbackText = mFeedbackEditText.getText().toString();
        if (feedbackText == "") return;
        mFeedbackEditText.setText("");
        submittedText = feedbackText;

        // set up for save
        ParseObject feedbackObj = new ParseObject("Feedback");
        feedbackObj.put("text", feedbackText);
        feedbackObj.put("creator", user);
        feedbackObj.put("latitude", latitude);
        feedbackObj.put("longitude", longitude);

        // Do save
        feedbackObj.saveInBackground(new SaveCallback() {
            public void done(ParseException e) {

                // Saved successfully
                if (e == null) {
                    // Track event
                    ParseAnalytics.trackEventInBackground("Android-FeedbackSubmitted");
                    // build alert dialog
                    // to ask if user wants to submit more feedback.
                    AlertDialog.Builder adb = new AlertDialog.Builder(
                            CreateFeedbackActivity.this, AlertDialog.THEME_HOLO_LIGHT);
                    adb.setTitle("Thanks for the feedback");
                    adb
                            .setMessage("Feel free to write some more!")
                            .setCancelable(true)
                            .setPositiveButton("Okay", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int id) {
                                }
                            /*})
                            .setNegativeButton("No",new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog,int id) {
                                    doneSubmittingFeedback();
                                }
                            })
                            .setOnCancelListener(new DialogInterface.OnCancelListener() {
                                public void onCancel(DialogInterface dialog) {
                                    doneSubmittingFeedback();
                                }*/
                            });
                    // create alert dialog
                    AlertDialog alertDialog = adb.create();
                    alertDialog.show();

                    // Save feedbackObj had an error
                } else {
                    Lazy.quickToast(getApplicationContext(), "FEEDBACK FAILED TO SAVE! RAGEEEE! ");
                    mFeedbackEditText.setText(submittedText);
                    Lazy.elog(LOGTAG, e);
                    //myObjectSaveDidNotSucceed();
                }
            }
        });
    }
    /*private void doneSubmittingFeedback() {
        System.exit(0);
    }*/
}

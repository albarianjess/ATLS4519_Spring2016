package jessie.jessie_albarian_final;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;

public class SignupActivitiy extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup_activitiy);
        //get reference to action bar
        ActionBar actionBar = getActionBar();
        //enable the up button
        actionBar.setDisplayHomeAsUpEnabled(true);
    }
}

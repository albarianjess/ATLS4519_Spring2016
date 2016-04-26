package jessie.project3;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.firebase.client.Firebase;

public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {


    public void doStuff(){
        //-------------------
        // LOCATION FUNCTIONS
        //-------------------
        GPSTracker tracker = new GPSTracker(MainActivity.this);
        double latitude = 0;
        double longitude = 0;

        if (tracker.canGetLocation()) {
            latitude = tracker.getLatitude();
            longitude = tracker.getLongitude();
            Toast.makeText(getApplicationContext(), "Your Location is - \nLat: " + latitude + "\nLong: " + longitude, Toast.LENGTH_LONG).show();
        } else {
            tracker.showSettingsAlert();
        }


        //----------
        // FIREBASE
        //----------
        Firebase.setAndroidContext(MainActivity.this);
        Firebase ref = new Firebase("https://bluelightapp.firebaseio.com/");

        Firebase lat = ref.child("location").child("latitude");
        lat.setValue(latitude);

        Firebase lon = ref.child("location").child("longitude");
        lon.setValue(longitude);

//        Firebase lat = ref.child("location");
//        lat.child("latitude").setValue(latitude);
//        lat.child("longitude").setValue(longitude);
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        //------------------------------------
        // ACCESS LOCATION AND ADD TO FIREBASE
        //------------------------------------
        doStuff();



        //-----------------------
        // MAIN CALL BTN FUNCTION
        //-----------------------
        ImageButton button = (ImageButton) findViewById(R.id.callBtn);
        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                // Do something in response to button click

                // ADD ALERT
                AlertDialog.Builder builder1 = new AlertDialog.Builder(MainActivity.this);
                //                alertDialog.setTitle("Warning");
                builder1.setMessage("Is this an emergency?");
                builder1.setCancelable(true);

                builder1.setPositiveButton(
                        "Yes",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                Toast.makeText(getApplicationContext(), "You are calling an emergency number.", Toast.LENGTH_LONG).show();
                                String phoneNum = "7206207466";
                                Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + phoneNum));
                                startActivity(intent);
                            }
                        });

                builder1.setNegativeButton(
                        "No",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                Toast.makeText(getApplicationContext(), "You are calling a non-emergency number.", Toast.LENGTH_LONG).show();
                                String phoneNum = "7206207466";
                                Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + phoneNum));
                                startActivity(intent);
                                dialog.cancel();
                            }
                        });

                AlertDialog alert11 = builder1.create();
                alert11.show();



            }
        });



        //----------
        // ANIMATION
        //----------
        // Custom repeat animation on button image
        ImageView myView = (ImageView) findViewById(R.id.fadeButton);

        // Fade out
        ObjectAnimator fadeOut = ObjectAnimator.ofFloat(myView, "alpha", 0f, 0.4f);
        fadeOut.setDuration(2000);
        // Fade in
        ObjectAnimator fadeIn = ObjectAnimator.ofFloat(myView, "alpha", 0.4f, 0f);
        fadeIn.setDuration(2000);

        final AnimatorSet mAnimationSet = new AnimatorSet();

        mAnimationSet.play(fadeIn).after(fadeOut);

        mAnimationSet.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);
                mAnimationSet.start();
            }
        });
        mAnimationSet.start();




        //------------------------------------------
        // MAIN TEXT VIEW FOR WHAT SCHOOL USER IS AT
        //------------------------------------------
        String schoolNameData = "University of Colorado Boulder"; // hardcoded for testing

        TextView schoolTxt = (TextView) findViewById(R.id.schoolText);
        assert schoolTxt != null;
        schoolTxt.setTextSize(20);
        schoolTxt.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
        schoolTxt.setPadding(10, 0, 10, 10);

        schoolTxt.setText("You are at the \n" + schoolNameData);




        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        assert drawer != null;
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        assert navigationView != null;
        navigationView.setNavigationItemSelectedListener(this);
    }




    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        assert drawer != null;
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
//        if (id == R.id.action_settings) {
//            return true;
//        }

        return super.onOptionsItemSelected(item);
    }



    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

//        if (id == R.id.nav_camera) {
//            // Handle the camera action
//        } else if (id == R.id.nav_gallery) {
//
//        } else if (id == R.id.nav_slideshow) {
//
//        } else if (id == R.id.nav_manage) {
//
//        }


        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        assert drawer != null;
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

}

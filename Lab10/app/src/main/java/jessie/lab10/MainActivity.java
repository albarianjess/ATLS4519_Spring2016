package jessie.lab10;

import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity implements DisneyListFragment.UniverseListListener, DisneyDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }



    @Override public void itemClicked(long id) {
        //get a reference to the frame layout that contains HeroDetailFragment
        View fragmentContainer = findViewById(R.id.fragment_container);

        //large layout device
        if (fragmentContainer != null) {

            //create new fragment instance
            DisneyDetailFragment frag = new DisneyDetailFragment();

            //create new fragment transaction
            FragmentTransaction ft = getFragmentManager().beginTransaction();

            //set the id of the universe selected
            frag.setDisney(id);

            //replace the fragment in the fragment container
            ft.replace(R.id.fragment_container, frag);

            //add fragment to the back stack
            ft.addToBackStack(null);

            //set the transition animation-optional
            ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);

            //commit the transaction
            ft.commit();
        }else{ //app is running on a device with a smaller screen
            Intent intent = new Intent(this, DetailActivity.class);
            intent.putExtra("id", (int) id);
            startActivity(intent);
        }
    }

    @Override public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0 ){
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }

    @Override public void adddisneyclicked(View view){
        DisneyDetailFragment fragment = (DisneyDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addDisney();
    }
}

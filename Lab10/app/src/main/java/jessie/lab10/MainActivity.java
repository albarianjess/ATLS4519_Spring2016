package jessie.lab10;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

//    @Override public void itemClicked(long id){
//        //create new fragment instance
//        DetailFragment frag = new DetailFragment();
//        //create new fragment transaction
//        FragmentTransaction ft = getFragmentManager().beginTransaction();
//        //set the id of the universe selected
//        frag.setUniverse(id);
//        //replace the fragment in the fragment container
//        ft.replace(R.id.fragment_container, frag);
//        //add fragment to the back stack
//        ft.addToBackStack(null);
//        //set the transition animation-optional
//        ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
//        //commit the transaction
//        ft.commit();
//    }

    @Override public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0 ){
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }

//    @Override
//    public void itemClicked(long id) {
////        create new fragment instance
//        DetailFragment frag = new DetailFragment();
//        //create new fragment transaction
//        FragmentTransaction ft = getFragmentManager().beginTransaction();
//        //set the id of the universe selected
//        frag.setUniverse(id);
//        //replace the fragment in the fragment container
//        ft.replace(R.id.fragment_container, frag);
//        //add fragment to the back stack
//        ft.addToBackStack(null);
//        //set the transition animation-optional
//        ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
//        //commit the transaction
//        ft.commit();
//    }
}

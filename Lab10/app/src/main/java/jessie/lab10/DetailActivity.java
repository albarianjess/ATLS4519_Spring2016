package jessie.lab10;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class DetailActivity extends AppCompatActivity implements DisneyDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        //get reference to the hero detail fragment
        DisneyDetailFragment disneyDetailFragment = (DisneyDetailFragment) getFragmentManager().findFragmentById(R.id.fragment_container);
        //get the id passed in the intent
        int disneyid = (int) getIntent().getExtras().get("id");
        //pass the universe id to the fragment
        disneyDetailFragment.setDisney(disneyid);
    }

    @Override public void adddisneyclicked(View view){
        DisneyDetailFragment fragment = (DisneyDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addDisney();
    }
}
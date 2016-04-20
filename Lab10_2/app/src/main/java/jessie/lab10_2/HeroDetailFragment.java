package jessie.lab10_2;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class HeroDetailFragment extends Fragment {


    public HeroDetailFragment() {
        // Required empty public constructor
    }

    private long universeId; //id of the universe chosen
    //set the universe id
    public void setUniverse(long id){
        this.universeId = id;
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_hero_detail, container, false);
    }


    //create array adapter
    private ArrayAdapter<String> adapter;
    @Override public void onStart(){
        super.onStart();
        View view = getView();
        ListView listHeroes = (ListView) view.findViewById(R.id.herolistView);

        // get hero data
        ArrayList<String> herolist = new ArrayList<String>();
        herolist = Hero.heroes[0].getSuperheroes();
        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, herolist);
        //bind array adapter to the list view
        listHeroes.setAdapter(adapter);
    }
}

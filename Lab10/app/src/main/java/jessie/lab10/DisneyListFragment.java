package jessie.lab10;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


public class DisneyListFragment extends Fragment implements AdapterView.OnItemClickListener{

    public DisneyListFragment() {
        // Required empty public constructor
    }

    //create interface
    interface UniverseListListener{
        void itemClicked(long id);
    }

    //create listener
    private UniverseListListener listener;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_disney_list, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();
        View view = getView();
        if (view != null){
            //load data into fragment
            //get the list view
            ListView listdisney = (ListView) view.findViewById(R.id.listView);
            //define an array adapter
            ArrayAdapter<Disney> listAdapter = new ArrayAdapter<Disney>(getContext(), android.R.layout.simple_list_item_1, Disney.chars);
            //set the array adapter on the list view
            listdisney.setAdapter(listAdapter);
            //attach the listener to the listview
            listdisney.setOnItemClickListener(this);
        }
    }


    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (UniverseListListener) context;
    }

    @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id){
        if (listener != null){
            //tells the listener an item was clicked
            listener.itemClicked(id);
        }
    }

}
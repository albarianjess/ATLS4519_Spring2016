package jessie.lab10;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;


public class DisneyDetailFragment extends android.app.Fragment implements View.OnClickListener{
// implements View.OnClickListener

    public DisneyDetailFragment() {
        // Required empty public constructor
    }

    private long universeId; //id of the universe chosen

    //set the universe id
    public void setDisney(long id){
        this.universeId = id;
    }

    //create array adapter
    private ArrayAdapter<String> adapter;

    //create interface
    public interface ButtonClickListener{
        public void adddisneyclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (savedInstanceState !=null){
            universeId = savedInstanceState.getLong("universeId");
        }
        //if the hero list is empty, load heroes
        if (Disney.chars[0].getCharacters().size() == 0 ) {
            Disney.chars[0].loadCharacter(getActivity(), 0);
        }
        if (Disney.chars[1].getCharacters().size() == 0 ) {
            Disney.chars[1].loadCharacter(getActivity(), 1);
        }
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_disney_detail, container, false);
    }

    @Override public void onStart(){
        super.onStart();

        View view = getView();
        assert view != null;
        ListView listCharacters = (ListView) view.findViewById(R.id.disneylistView);

        // get hero data
        ArrayList<String> disneylist = new ArrayList<String>();
        disneylist = Disney.chars[(int) universeId].getCharacters();

        //set the array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, disneylist);

        //bind array adapter to the list view
        listCharacters.setAdapter(adapter);

        Button addButton = (Button) view.findViewById(R.id.addButton);
        addButton.setOnClickListener(this);

        //register contextmenu
        registerForContextMenu(listCharacters);
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("universeId", universeId);
    }

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        if (context instanceof ButtonClickListener) {
            listener = (ButtonClickListener) context; //causes crash
        }
    }

    @Override public void onClick(View view){
        if (listener !=null){
            listener.adddisneyclicked(view);
        }
    }

    public void addDisney(){
        final Dialog dialog = new Dialog(getActivity());
        dialog.setContentView(R.layout.dialog);
        dialog.setTitle("Add Character");
        dialog.setCancelable(true);
        final EditText editText = (EditText) dialog.findViewById(R.id.editTextCharacter);
        Button button = (Button) dialog.findViewById(R.id.addButton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String charName = editText.getText().toString();
                // add hero
                Disney.chars[(int) universeId].getCharacters().add(charName);
                //refresh the list view
                DisneyDetailFragment.this.adapter.notifyDataSetChanged();
                Disney.chars[(int) universeId].storeCharacter(getActivity(), universeId);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    //create a context menu on long press
    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;

        //get character name that was pressed
        String charName = adapter.getItem(adapterContextMenuInfo.position);

        //set the menu title
        menu.setHeaderTitle("Delete " + charName);

        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    //handle context menu item selection
    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed

            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();

            //remove the character
            Disney.chars[(int) universeId].getCharacters().remove(info.position);

            //refresh the list view
            DisneyDetailFragment.this.adapter.notifyDataSetChanged();
            Disney.chars[(int) universeId].storeCharacter(getActivity(), universeId);
        }
        return true;
    }

}
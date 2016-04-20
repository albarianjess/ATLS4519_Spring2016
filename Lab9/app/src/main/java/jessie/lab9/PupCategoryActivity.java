package jessie.lab9;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class PupCategoryActivity extends ListActivity {

    private String animaltype;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        String animaltype = i.getStringExtra("animaltype");
        //get the list view
        ListView listBulbs = getListView();
        //define an array adapter
        ArrayAdapter<Dog> listAdapter;
        //initialize the array adapter with the right list of bulbs
        switch (animaltype){
            case "Dogs":
                listAdapter = new ArrayAdapter<Dog>(this, android.R.layout.simple_list_item_1, Dog.pups);
                break;
            default: listAdapter = new ArrayAdapter<Dog>(this, android.R.layout.simple_list_item_1,
                    Dog.pups);
        }
        //set the array adapter on the list view
        listBulbs.setAdapter(listAdapter);
    }


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(PupCategoryActivity.this, PupActivity.class);
        intent.putExtra("animalid", (int) id);
        intent.putExtra("animaltype", animaltype);
        startActivity(intent);
    }
}

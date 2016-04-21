package jessie.lab9;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class CatCategoryActivity extends ListActivity {

    private String animaltype;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        String animaltype = i.getStringExtra("animaltype");
        //get the list view
        ListView listCats = getListView();
        //define an array adapter
        ArrayAdapter<Cat> listAdapter;

        //initialize the array adapter with the right list of animals
        switch (animaltype){
            case "Cats":
                listAdapter = new ArrayAdapter<Cat>(this, android.R.layout.simple_list_item_1, Cat.kitties);
                break;
            default: listAdapter = new ArrayAdapter<Cat>(this, android.R.layout.simple_list_item_1,
                    Cat.kitties);
        }
        //set the array adapter on the list view
        listCats.setAdapter(listAdapter);
    }


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(CatCategoryActivity.this, CatActivity.class);
        intent.putExtra("animalid", (int) id);
        intent.putExtra("animaltype", animaltype);
        startActivity(intent);
    }
}

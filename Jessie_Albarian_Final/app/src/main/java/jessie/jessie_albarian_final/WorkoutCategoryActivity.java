package jessie.jessie_albarian_final;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class WorkoutCategoryActivity extends ListActivity {


    private String workout;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        Intent i = getIntent();
        workout = i.getStringExtra("workout");
        //get the list view
        ListView myList = getListView();
        //define an array adapter
        ArrayAdapter<Sports> listAdapter;
        //initialize the array adapter with the right list
        switch (workout){
            case "Cardio":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Sports.cardio);
                break;
            case "Strength":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Sports.strength);
                break;
            case "Flexibility":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Sports.flex);
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Sports.cardio);
        }
        //set the array adapter on the list view
        myList.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(WorkoutCategoryActivity.this, WorkoutActivity.class);
        intent.putExtra("myid", (int) id);
        intent.putExtra("workout", workout);
        startActivity(intent);
    }
}

package jessie.lab9;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class Main2Activity extends ListActivity {

    private String meal;


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(Main2Activity.this, RecipeActivity.class);
        intent.putExtra("mealid", (int) id);
        intent.putExtra("meal", meal);
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main2);



        Intent i = getIntent();
        String meal = i.getStringExtra("meal");
        //get the list view
        ListView listMeals = getListView();
        //define an array adapter
        ArrayAdapter<Meals> listAdapter;
        //initialize the array adapter with the right list of bulbs
        switch (this.meal){
            case "Breakfast":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Meals.breakfast);
                break;
            case "Lunch":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Meals.lunch);
                break;
            case "Dinner":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Meals.dinner);
                break;
            case "Snack":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, Meals.snack);
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1,
                    Meals.snack);
        }
        //set the array adapter on the list view
        listMeals.setAdapter(listAdapter);
    }
}

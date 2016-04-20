package jessie.lab9;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){

            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                String animaltype = (String) listView.getItemAtPosition(position);


                if(animaltype.equals("Dogs")) {
                    //create new intent
                    Intent intent = new Intent(MainActivity.this, PupCategoryActivity.class);
                    //add animaltype to intent
                    intent.putExtra("animaltype", animaltype);
                    //start intent
                    startActivity(intent);
                } else {
                    Intent intent = new Intent(MainActivity.this, CatCategoryActivity.class);
                    //add animaltype to intent
                    intent.putExtra("animaltype", animaltype);
                    //start intent
                    startActivity(intent);
                }

            }
        };
        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);
        //add listener to the list view
        assert listview != null;
        listview.setOnItemClickListener(itemClickListener);
    }






}

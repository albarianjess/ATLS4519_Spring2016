package jessie.jessie_albarian_final;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class MainActivity extends Activity {


    public boolean onCreateOptionsMenu(Menu menu){
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.create_order:
                //start order activity
                Intent intent = new Intent(this, SignupActivitiy.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){

            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                String workout = (String) listView.getItemAtPosition(position);


                    Intent intent = new Intent(MainActivity.this, WorkoutCategoryActivity.class);

                    intent.putExtra("workout", workout);
                    //start intent
                    startActivity(intent);

            }
        };
        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);
        //add listener to the list view
        assert listview != null;
        listview.setOnItemClickListener(itemClickListener);
    }
}

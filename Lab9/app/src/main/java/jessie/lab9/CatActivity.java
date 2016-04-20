package jessie.lab9;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class CatActivity extends Activity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_cat);

        //get cat data from the intent
        int catnum = (Integer)getIntent().getExtras().get("animalid");
        String type = (String)getIntent().getExtras().get("animaltype");
        Cat cat = Cat.kitties[catnum];

        //populate image
        ImageView catImage = (ImageView)findViewById(R.id.catView);
        catImage.setImageResource(cat.getImageResourceID());

        //populate name
        TextView catName = (TextView)findViewById(R.id.cat_name);
        catName.setText(cat.getName());
    }
}

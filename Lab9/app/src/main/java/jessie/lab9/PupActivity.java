package jessie.lab9;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class PupActivity extends Activity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_pup);

        //get pup data from the intent
        int pupnum = (Integer)getIntent().getExtras().get("animalid");
        String type = (String)getIntent().getExtras().get("animaltype");
        Dog dog = Dog.pups[pupnum];

        //populate image
        ImageView pupImage = (ImageView)findViewById(R.id.pupView);
        pupImage.setImageResource(dog.getImageResourceID());

        //populate name
        TextView pupName = (TextView)findViewById(R.id.pup_name);
        pupName.setText(dog.getName());
    }
}

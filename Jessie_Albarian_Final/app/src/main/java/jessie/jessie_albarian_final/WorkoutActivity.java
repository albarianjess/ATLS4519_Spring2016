package jessie.jessie_albarian_final;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class WorkoutActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_workout);

        int num = (Integer)getIntent().getExtras().get("myid");

        String type = (String)getIntent().getExtras().get("workout");

//        Sports sport = Sports.cardio[num];
        Sports sport;
        assert type != null;
        switch (type){
            case "Cardio":
                sport = Sports.cardio[num];
                break;
            case "Strength":
                sport = Sports.strength[num];
                break;
            case "Flexibility":
                sport = Sports.flex[num];
                break;
            default: sport = Sports.cardio[num];
        }


        //populate image
        ImageView myImage = (ImageView)findViewById(R.id.myImage);
        myImage.setImageResource(sport.getImageResourceID());

        //populate name
        TextView name = (TextView)findViewById(R.id.workout_name);
        name.setText(sport.getName());
    }
}

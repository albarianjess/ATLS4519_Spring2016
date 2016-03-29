package jessie.lab9;

/**
 * Created by ashes on 3/29/16.
 */
public class Meals {
    private String name;
    private int imageResourceID;
    //constructor
    private Meals(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }
    public static final Meals[] breakfast = {
            new Meals("Rice and Avocado", R.drawable.biking),
            new Meals("Fruit Smoothie", R.drawable.leg),
            new Meals("Rice and Chicken", R.drawable.eliptical),
            new Meals("PB&J", R.drawable.shoulder),
    };
    public static final Meals[] lunch = {
            new Meals("Chipotle Salad", R.drawable.biking),
            new Meals("Fruit Smoothie", R.drawable.leg),
            new Meals("Rice and Chicken", R.drawable.eliptical),
    };
    public static final Meals[] dinner = {
            new Meals("Chipotle Salad", R.drawable.biking),
            new Meals("Salmon and Green Beans", R.drawable.leg),
            new Meals("Rice, Chicken, and Broccoli", R.drawable.eliptical),
    };
    public static final Meals[] snack = {
            new Meals("PB&J", R.drawable.biking),
            new Meals("Fruit Smoothie", R.drawable.leg),
            new Meals("Whole Fruit", R.drawable.eliptical),
            new Meals("Hummus and Carrots/Cucumbers", R.drawable.eliptical),
    };

    public String getName(){
        return name;
    }
    public int getImageResourceID(){
        return imageResourceID;
    }
    //the string representation of a workout is its name
    public String toString(){
        return this.name;
    }
}

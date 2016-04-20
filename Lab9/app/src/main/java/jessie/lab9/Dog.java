package jessie.lab9;

/**
 * Created by ashes on 4/20/16.
 */
public class Dog {
    private String name;
    private int imageResourceID;
//constructor
private Dog(String newname, int newID){
    this.name = newname;
    this.imageResourceID = newID;
}
    public static final Dog[] pups = {
            new Dog("Lab Puppy", R.drawable.lab),
            new Dog("Husky Puppy", R.drawable.husky),
            new Dog("German Shepherd Puppy", R.drawable.german)

    };
    public String getName(){
        return name;
    }
    public int getImageResourceID(){
        return imageResourceID;
    }
    //the string representation of a dog is its name
    public String toString(){
        return this.name;
    }
}
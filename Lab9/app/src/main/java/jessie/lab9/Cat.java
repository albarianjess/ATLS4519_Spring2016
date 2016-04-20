package jessie.lab9;

/**
 * Created by ashes on 4/20/16.
 */
public class Cat {
    private String name;
    private int imageResourceID;
    //constructor
    private Cat(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }
    public static final Cat[] kitties = {
            new Cat("Siamese", R.drawable.siamese),
            new Cat("Tabby", R.drawable.tabby)

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
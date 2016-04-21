package jessie.lab10;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by ashes on 4/21/16.
 */
public class Disney {
    private String disney;
    private ArrayList<String> characters = new ArrayList<>();

    //constructor
    private Disney(String dis, ArrayList<String> characters) {
        this.disney = dis;
        this.characters = new ArrayList<String>(characters);
    }

    public static final Disney[] chars = {
            new Disney("Winnie the Pooh", new ArrayList<String>()),
            new Disney("The Lion King", new ArrayList<String>())
    };

    public String getDisney() {
        return disney;
    }

    public ArrayList<String> getCharacters() {
        return characters;
    }

    public String toString() {
        return this.disney;
    }

    public void storeCharacter(Context context, long disneyID) {
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Disney", Context.MODE_PRIVATE);

        //create an editor to write to the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();

        //create a set
        Set<String> set = new HashSet<String>();

        //add characters to the set
        set.addAll(chars[(int) disneyID].getCharacters());

        //pass the key/value pair to the shared preference file
        editor.putStringSet(chars[(int) disneyID].getDisney(), set);

        //save changes
        editor.commit();
    }

    public void loadCharacter(Context context, int disneyID) {
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Disney", Context.MODE_PRIVATE);

        //create an editor to read from the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();

        //create a set with the char list
        Set<String> set = sharedPrefs.getStringSet(chars[disneyID].getDisney(), null);
        //if there was a saved list add it to the character array
        if (set != null) {
            Disney.chars[disneyID].characters.addAll(set);
        }
        //if no character list was saved, use the defaults
        else {
            switch (disneyID) {
                case 0:
                    Disney.chars[0].characters.addAll(Arrays.asList("Tigger", "Pooh", "Piglet", "Rabbit", "Owl", "Christopher", "Eeyore"));
                    break;
                case 1:
                    Disney.chars[1].characters.addAll(Arrays.asList("Simba", "Mufasa", "Scar", "Nala", "Rafiki", "Zazu"));
                    break;
                default:
                    break;
            }
        }
    }
}
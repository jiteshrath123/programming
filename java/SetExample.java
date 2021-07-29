import java.util.*;
public class SetExample {
    public static void main(String[] args)
    {
        // Set demonstration using HashSet
        Set<String> hash_Set1 = new HashSet<String>();
  
        hash_Set1.add("Geeks");
        hash_Set1.add("For");
        hash_Set1.add("Geeks");
        hash_Set1.add("Example");
        hash_Set1.add("Set");

        Set<String> hash_Set2 = new HashSet<String>();

        hash_Set2.add("asd");
        hash_Set2.add("Forcasdc");
        hash_Set2.add("GeekssD");
        hash_Set2.add("Geek");
        hash_Set2.add("Set");

  
        System.out.println(hash_Set1.addAll(hash_Set2));
        System.out.println(hash_Set2.retainAll(hash_Set1));
        System.out.println(hash_Set1);
    }
}
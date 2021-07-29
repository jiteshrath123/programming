// Java program to demonstrate the
// working of ArrayList in Java

import java.io.*;
import java.util.*;

class ArrayListExample {
	public static void main(String[] args)
	{
		// Size of the
		// ArrayList
		int n = 10;

		// Declaring the ArrayList with
		// initial size n
		ArrayList<Integer> arrli = new ArrayList<Integer>(n);

		// Appending new elements at
		// the end of the list
		for (int i = 1; i <= n; i++)
			arrli.add(i);
      arrli.add(5);
      arrli.add(6);
      arrli.add(7);
      arrli.add(8);
      arrli.add(0, 8);
      arrli.set(1, 5);
		// Printing elements
		System.out.println(arrli);

		// Remove element at index 3
		arrli.remove(3);
    arrli.removeAll(Arrays.asList(5));
    arrli.remove((Integer) 8);
		// Displaying the ArrayList
		// after deletion
		System.out.println(arrli);
    System.out.println("size " + arrli.size());
    System.out.println("is empty " + arrli.isEmpty());
    System.out.println("contains " + arrli.contains(9));
    System.out.println(arrli);
    System.out.println(arrli);

		// Printing elements one by one
		for (int i = 0; i < arrli.size(); i++)
			System.out.print(arrli.get(i) + " ");
	}
}

// Java program to demonstrate a Queue

import java.util.*;
import java.io.*;

public class QueueExample {

	public static void main(String[] args)
	{
		Queue<Integer> q
			= new LinkedList<>();

		// Adds elements {0, 1, 2, 3, 4} to
		// the queue
		for (int i = 0; i < 5; i++)
			q.add(i);

		// Display contents of the queue.
		System.out.println("Elements of queue "+ q);

		// To remove the head of queue.
		int removedele = q.remove();
		System.out.println("removed element-"+ removedele);

		System.out.println(q);

		// To view the head of queue
		int head = q.peek();
		System.out.println("head of queue-"+ head);

		// Rest all methods of collection
		// interface like size and contains
		// can be used with this
		// implementation.
		int size = q.size();
		System.out.println("Size of queue-"
						+ size);

    Queue<Integer> pqueue = new PriorityQueue<Integer>();
    pqueue.add(15);
    pqueue.add(5);
    pqueue.add(3);
    pqueue.add(30);
    pqueue.add(40);
    pqueue.add(4);
    pqueue.add(25);

    System.out.println(pqueue);
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
    pqueue.remove();
    System.out.println(pqueue.peek());
	}
}

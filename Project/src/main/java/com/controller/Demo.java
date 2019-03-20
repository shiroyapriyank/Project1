package com.controller;

import java.util.Scanner;

public class Demo {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String a = scan.nextLine();
		String s = "Hello World";
		int count = 0;
		for (int i = 0; i < a.length(); i++) {
			if(! Character.isSpace(a.charAt(i))) {
				count++;
			}
		}
		System.out.println(count);
	}

}

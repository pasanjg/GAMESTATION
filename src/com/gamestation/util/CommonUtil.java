package com.gamestation.util;

import java.util.ArrayList;


public class CommonUtil {

	public static String generateUserIDs(ArrayList<String> arrayList) {
		
		String id;
		int next = arrayList.size();
		next++;
		id = "P100" + next;
		if (arrayList.contains(id)) {
			next++;
			id = "P100" + next;
		}
		return id;
	}
	
	public static String generateGameIDs(ArrayList<String> arrayList) {
		
		String gid;
		int next = arrayList.size();
		next++;
		gid = "G0" + next;
		if (arrayList.contains(gid)) {
			next++;
			gid = "G0" + next;
		}
		return gid;
	}
	
	public static String generateMessageIDs(ArrayList<String> arrayList) {
		
		String mid;
		int next = arrayList.size();
		next++;
		mid = "M100" + next;
		if (arrayList.contains(mid)) {
			next++;
			mid = "M100" + next;
		}
		return mid;
	}
	
}

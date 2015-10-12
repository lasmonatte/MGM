package com.mgm.mgm01;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Gameresult2 {
	public static void main(String[] args) throws MalformedURLException, IOException {

		String result;
		int count = 0;
		boolean flag = false;
		Map<String, Object> info = null;

		/* set up */
		URL url = new URL("http://www.scoregame.co.kr/?mod=analysPday&iframe=Y");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);
		// urlConn.setRequestMethod("POST");

		/* read */
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		while((inputLine=br.readLine()) != null){

			if(inputLine.contains("data=\"") && !inputLine.contains("+data.")) {
				info = new HashMap<String, Object>();
				flag = true;
			}
			
			if(flag==true && count<20) {
				switch (count) {
				case 0:
					result = inputLine.substring(inputLine.indexOf("a=\"")+3, inputLine.lastIndexOf("\" "));
					info.put("orderNum", result);
					break;
				case 3:
					result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
					break;
				case 2:
				case 4:
					result = inputLine.substring(inputLine.indexOf("\"")+1, inputLine.lastIndexOf("\""));
					break;
				case 19:
					result = inputLine.substring(inputLine.indexOf("n>")+2, inputLine.lastIndexOf("</s"));
					info.put("time", result);
					break;
				default:
					result="";	
					break;
				}
					
				
				switch (result) {
				case "odd":
					info.put("OE", "홀");
					break;
				case "oven":
					info.put("OE", "짝");
					break;
				case "좌":
					info.put("LR", "좌");
					break;
				case "우":
					info.put("LR", "우");
					break;
				case "n3":
					info.put("Line", 3);
					break;
				case "n4":
					info.put("Line", 4);
					break;
				}
				
				if(count==19) {
					count = 0;
					flag = false;
					list.add(info);
				} else
					count++;
			}
		}
		br.close();
		conn.disconnect();
		
		for(Map<String, Object> ar : list)
			System.out.println(ar);
	}
}

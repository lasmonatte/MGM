package com.mgm.mgm01;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class Gameresult2 {
	public static void main(String[] args) throws MalformedURLException, IOException {

		String result;
		int count = 0;
		boolean flag = false;
		Map<String, Object> info = new HashMap<String, Object>();

		/* set up */
		URL url = new URL("http://www.scoregame.co.kr/?mod=analysPday&iframe=Y");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);
		// urlConn.setRequestMethod("POST");

		/* read */
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;

		while((inputLine=br.readLine()) != null){
			int start = 0;
			int end = 0;
			//			날짜
			//			if(inputLine.contains("\"date\"")) {
			//				result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
			//				info.put("date", result");
			//			}

			//회차정보
			if(inputLine.contains("\"OrderNum\""))
				flag = true;
			
			if(flag==true && count<5) {
				if(count==0) {
					start = inputLine.indexOf("-</span>");
					end = inputLine.lastIndexOf("<span>");
					result = inputLine.substring(start+8, end);
					System.out.println(result);
				}
				else if(count==2)
					result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
				else
					result = inputLine.substring(inputLine.indexOf("\"")+1, inputLine.lastIndexOf("\""));
				
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
				
				if(count==4) {
					count = 0;
					flag = false;
				} else
					count++;
				
				
			}
			//게임정보
			if(inputLine.contains("OrderNum"))
				count++;
		}
		
		br.close();
		conn.disconnect();

		System.out.println(info);
	}
}

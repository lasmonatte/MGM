package com.mgm.mgm01;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class GameResult {
	String result;
	int count = 0;
	Map<String, Object> info = new HashMap<String, Object>();

	public Map<String, Object> makeGameResult() throws MalformedURLException, IOException {
		/* set up */
		URL url = new URL("http://www.scoregame.co.kr/?mod=analysPday&iframe=Y");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);
		// urlConn.setRequestMethod("POST");

		/* read */
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;

		while((inputLine=br.readLine()) != null){
			//			//날짜
			//			if(inputLine.contains("\"date\"")) {
			//				result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
			//				info.put("date", result");
			//			}

			//회차정보
			if(inputLine.contains("\"ordernum\"")){
				result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
				info.put("curOrder", Integer.parseInt(result));
				info.put("lastOrder", Integer.parseInt(result)-1);
			}

			if(count>0 && count<4) {
				if(count==2)
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

				count++;
			}
			//게임정보
			if(inputLine.contains("OrderNum"))
				count++;
		}

		br.close();
		conn.disconnect();

		return info;
	}
}

package com.mgm.mgm01.gameresult.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MakeGameResults {

	String addr = "http://www.scoregame.co.kr/?mod=analysPday&iframe=Y";
	String result;
	int count = 0;
	GameResultDto dto;
	public MakeGameResults() throws MalformedURLException, IOException {
		// TODO Auto-generated constructor stub
		HttpURLConnection conn = setup(addr);
		dto = readRecentlyResult(conn);
		
	}
	
	public HttpURLConnection setup(String addr) throws MalformedURLException, IOException {
		URL url = new URL(addr);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);
		// urlConn.setRequestMethod("POST");	
		return conn;
	}
	/* set up */

	public GameResultDto readRecentlyResult(HttpURLConnection conn){
		BufferedReader br;
		GameResultDto dto = new GameResultDto();
		try {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String inputLine;

			while((inputLine=br.readLine()) != null){
				//회차정보
				if(inputLine.contains("\"ordernum\"")){
					result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
					dto.setOrdernum(Integer.parseInt(result)-1);
				}

				if(count>0 && count<4) {
					result="";
					if(count==2)
						result = inputLine.substring(inputLine.indexOf(">")+1, inputLine.lastIndexOf("<"));
					else
						result = inputLine.substring(inputLine.indexOf("\"")+1, inputLine.lastIndexOf("\""));

					switch (count) {
					case 1:
					case 3:
						break;
					case 2:
						break;

					default:
						break;
					}

					/* Make Result */
					switch (result) {
					case "odd":
						dto.setOe("홀");
						break;
					case "oven":
						dto.setOe("짝");
						break;
					case "좌":
						dto.setLr("좌");
						break;
					case "우":
						dto.setLr("우");
						break;
					case "n3":
						dto.setLine("3");
						break;
					case "n4":
						dto.setLine("4");
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
}

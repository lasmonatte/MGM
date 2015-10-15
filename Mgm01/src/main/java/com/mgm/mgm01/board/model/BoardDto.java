package com.mgm.mgm01.board.model;

import java.sql.Timestamp;

public class BoardDto {

	private int board_num;
	private String title;
	private String nickname;
	private String content;
	private Timestamp date;
	private int replyCount;
	private String Type;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	@Override
	public String toString() {
		return "BoardDto [board_num=" + board_num + ", title=" + title + ", nickname=" + nickname + ", content="
				+ content + ", date=" + date + ", replyCount=" + replyCount + ", Type=" + Type + "]";
	}
	
}

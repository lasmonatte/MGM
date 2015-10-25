package com.mgm.mgm01.reply.model;

import java.sql.Timestamp;

public class ReplyDto {

	public int reply_num;
	public int board_num;
	public String nickname;
	public String content;
	public Timestamp date;

	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
	
	@Override
	public String toString() {
		return "ReplyDto [reply_num=" + reply_num + ", board_num=" + board_num + ", nickname=" + nickname + ", content="
				+ content + ", date=" + date + "]";
	}
}

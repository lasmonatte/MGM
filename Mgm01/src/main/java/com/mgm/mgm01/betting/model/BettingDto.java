package com.mgm.mgm01.betting.model;

import java.sql.Timestamp;

import com.mgm.mgm01.gameresult.model.GameResultDto;

public class BettingDto {

	private int betting_num;
	private int game_num;
	private Timestamp date;
	private int betting_money;
	private int expect_money;
	private int prize_money;
	private float dividend;		// 배당
	private String betting_oe;
	private String betting_lr;
	private String betting_line;
	private boolean result_oe;
	private boolean result_lr;
	private boolean result_line;
}

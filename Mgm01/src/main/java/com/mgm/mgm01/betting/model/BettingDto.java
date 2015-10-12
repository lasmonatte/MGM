package com.mgm.mgm01.betting.model;

import java.sql.Timestamp;

import com.mgm.mgm01.game.model.GameDto;

public class BettingDto {

	private int betting_num;
	private int game_num;
	private Timestamp date;
	private int betting_money;
	private int expect_money;
	private int prize_money;
	private float dividend;		// 배당
	private GameDto gameDto;
	private boolean result;
}

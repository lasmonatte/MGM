package com.mgm.mgm01.gameresult.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mgm.mgm01.betting.model.BettingDto;
import com.mgm.mgm01.betting.model.BettingService;

@Component
public class GameResultServiceImpl implements GameResultService{

	@Autowired GameResultDao dao;
	@Autowired BettingService bettingService;

	@Scheduled(cron="10 0/5 * * * *")
	@Transactional
	@Override
	public void createGameResultService() throws MalformedURLException, IOException {
		// TODO Auto-generated method stub
		MakeGameResults mgr = new MakeGameResults();
		dao.createGameResult(mgr.dto);
		List<BettingDto> bettingDtoList = bettingService.readBettingListToUpdateService();

		for(BettingDto dto : bettingDtoList) {
			int toCorrect = 0;
			int correct = 0;
			
			 if(!dto.getBetting_oe().equals("null")) {
				toCorrect++;
				if(dto.getBetting_oe().equals(mgr.dto.getOe())) {
					correct++;
					dto.setResult_oe(true);
				}
				else
					dto.setResult_oe(false);
			}

			if(!dto.getBetting_lr().equals("null")) {
				toCorrect++;
				if(dto.getBetting_lr().equals(mgr.dto.getLr())) {
					correct++;
					dto.setResult_lr(true);
				}
				else
					dto.setResult_lr(false);
			}
			
			if(!dto.getBetting_line().equals("null")) {
				toCorrect++;
				if(dto.getBetting_line().equals(mgr.dto.getLine())) {
					correct++;
					dto.setResult_line(true);
				}
				else
					dto.setResult_line(false);
			}
			
			if(toCorrect==correct) {
				dto.setPrize_money(dto.getExpect_money());
				dto.setReceived("N");
			}
			else
				dto.setPrize_money(0);
			
			dto.setOrdernum(mgr.dto.getOrdernum());
			bettingService.updateBettingService(dto);
		}
		
		
	}

	@Override
	public GameResultDto readGameResultOneService(int game_num) {
		// TODO Auto-generated method stub
		return dao.readGameResultOne(game_num);
	}

	@Override
	public List<GameResultDto> readGameResultListService(int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Integer> info = new HashMap<String, Integer>();
		info.put("start", start);
		info.put("end", end);

		return dao.readGameResultList(info);
	}

	@Override
	public int updateGameResultService(GameResultDto dto) {
		// TODO Auto-generated method stub
		return dao.updateGameResult(dto);
	}
}

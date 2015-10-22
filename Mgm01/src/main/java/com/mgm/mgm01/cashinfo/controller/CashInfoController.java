package com.mgm.mgm01.cashinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mgm.mgm01.cashinfo.model.CashInfoService;

@Controller
public class CashInfoController {
	
	@Autowired CashInfoService cashInfoService;
	
	
}

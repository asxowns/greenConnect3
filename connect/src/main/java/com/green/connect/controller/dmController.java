package com.green.connect.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.DmDao;
import com.green.connect.dto.DM;

@Controller
public class dmController {

	@Autowired
	private DmDao dao;

	@RequestMapping("/dmWindow")
	public String dmWindow() {

		return "dm/dmWindow";
	}

	@RequestMapping("/dmForm")
	public String dmForm() {

		return "dm/dmForm";
	}

	@RequestMapping("/sendDm")
	public String sendDm(DM dm) {

		dm.setDate(new Date());
		dm.setState(1);
		
		dm.setSendUser("user1");

		dao.sendDm(dm);

		return "dm/dmWindow";
	}
	
	
	@GetMapping("/myReciveDm")
	@ResponseBody
	public List<DM> myReciveDm(@RequestParam("reciveUser") String reciveUser) {
		
		return dao.myReciveDm(reciveUser);
	}
	
	@GetMapping("/mySendDm")
	@ResponseBody
	public List<DM> mySendDm(@RequestParam("sendUser") String sendUser){
		
		return dao.mySendDm(sendUser);
	}

	@GetMapping("/dmDetail")
	public String dmDetail() {
		
		return "";
	}
	
	
	
}

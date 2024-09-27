package com.green.connect.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		dm.setSendUser("qwe");

		dao.sendDm(dm);

		return "dm/dmWindow";
	}

}

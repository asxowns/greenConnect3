package com.green.connect.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String dmWindow(Model model) {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		
		model.addAttribute("username", username);

		return "dm/dmWindow";
	}

	@RequestMapping("/dmForm")
	public String dmForm() {

		return "dm/dmForm";
	}

	@RequestMapping("/sendDm")
	public String sendDm(DM dm) {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		dm.setDate(new Date());
		dm.setSendUser(username);

		dao.sendDm(dm);

		return "redirect:/dmWindow";
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
	public String dmDetail(@RequestParam("dno") int dno, Model model) {
		
		DM dm = dao.dmDetail(dno);
		
		model.addAttribute("dm", dm);
		
		return "dm/dmDetail";
	}

	
	
}

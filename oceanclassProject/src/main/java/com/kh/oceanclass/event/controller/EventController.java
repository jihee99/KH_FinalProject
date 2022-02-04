package com.kh.oceanclass.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

	@RequestMapping(value="eventMain.ev")
	public String eventMain() {
		return "event/eventMain";
	}
}

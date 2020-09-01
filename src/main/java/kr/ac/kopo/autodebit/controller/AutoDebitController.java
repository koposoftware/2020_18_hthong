package kr.ac.kopo.autodebit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.ac.kopo.autodebit.service.AutoDebitService;

@Controller
public class AutoDebitController {

	@Autowired
	private AutoDebitService autoDebitService;

	//자동이체 Execute
	public void AutoDebitTest() {
		autoDebitService.autoDebitExecute();
	}
	
}

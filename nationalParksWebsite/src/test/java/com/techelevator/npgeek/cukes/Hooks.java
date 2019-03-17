package com.techelevator.npgeek.cukes;


import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;

import cucumber.api.java.Before;

public class Hooks {

	private @Autowired WebDriver webDriver;
	
	@Before
	public void setup() {
		webDriver.manage().deleteAllCookies();
		webDriver.get("http://localhost:8080/m3-java-capstone/");
	}
}

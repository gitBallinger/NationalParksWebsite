package com.techelevator.npgeek.model;

public class DayOfWeather {
	
	private String parkCode;
	private Integer fiveDayForecastValue;
	private Integer lowInF;
	private Integer highInF;
	private Integer lowInC;
	private Integer highInC;
	private String forecast;
	
	public Integer getLowInC() {
		return lowInC;
	}
	public void setLowInC(Integer lowInF) {
		this.lowInC = (((lowInF - 32) * 5) / 9);
	}
	public Integer getHighInC() {
		return highInC;
	}
	public void setHighInC(Integer highInF) {
		this.highInC = (((highInF - 32) * 5) / 9);
	}
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public Integer getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	public void setFiveDayForecastValue(Integer fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	public Integer getLowInF() {
		return lowInF;
	}
	public void setLowInF(Integer lowInF) {
		this.lowInF = lowInF;
	}
	public Integer getHighInF() {
		return highInF;
	}
	public void setHighInF(Integer highInF) {
		this.highInF = highInF;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
	

}

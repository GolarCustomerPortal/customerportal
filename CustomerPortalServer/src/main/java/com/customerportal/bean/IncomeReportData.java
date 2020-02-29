package com.customerportal.bean;

public class IncomeReportData {

	private double gasAmount;
	private double insideSalesAmount;
	private double lotteryAmount;
	private double cigaretteSalesAmount;
	private double scratchOffSold;
	private String month;
	private String label;

	public double getGasAmount() {
		return gasAmount;
	}

	public void setGasAmount(double gasAmount) {
		this.gasAmount = gasAmount;
	}

	public double getInsideSalesAmount() {
		return insideSalesAmount;
	}

	public void setInsideSalesAmount(double insideSalesAmount) {
		this.insideSalesAmount = insideSalesAmount;
	}

	public double getLotteryAmount() {
		return lotteryAmount;
	}

	public void setLotteryAmount(double lotteryAmount) {
		this.lotteryAmount = lotteryAmount;
	}

	public double getScratchOffSold() {
		return scratchOffSold;
	}

	public void setScratchOffSold(double scratchOffSold) {
		this.scratchOffSold = scratchOffSold;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public void setCigaretteSalesAmount(double cigaretteSalesAmount) {
		this.cigaretteSalesAmount = cigaretteSalesAmount;
	}

	public double getCigaretteSalesAmount() {
		return cigaretteSalesAmount;
	}

}

package com.customerportal.bean;

import java.math.BigDecimal;

public class ExpensesReport {

	private BigDecimal amount;
	private String month;

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getAmount() {
		return amount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
}

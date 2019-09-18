package com.btl.findjob.model;

import lombok.Data;

@Data
public class PersonInfoGraphDTO {
	private String ci_companyName;
	private String cp_month;
	private int cp_totalcnt;
	private int cp_incnt;
	private int cp_outcnt;
	private int cp_avgpay;
}

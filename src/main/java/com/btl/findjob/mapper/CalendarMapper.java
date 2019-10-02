package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CalendarDTO;

public interface CalendarMapper {
	public void insertCalendar(List<CalendarDTO> userData);
	
	public void deleteTable(@Param(value="useremail") String useremail,@Param(value = "companyname") String companyname);
	
	public List<CalendarDTO> selectTable(String userEmail);
}

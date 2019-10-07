package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CalendarDTO;

public interface CalendarService {
    public List<CalendarDTO> JData(String ci_companyName);
}

package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.PersonInfoGraphDTO;

public interface PersonGraphMapper {
	public List<PersonInfoGraphDTO>personGetGraph(String ci_companyName);
}

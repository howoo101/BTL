package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.PersonInfoGraphDTO;

public interface PersonGraphService {
    public List<PersonInfoGraphDTO> personGetGraph(String ciName);
}

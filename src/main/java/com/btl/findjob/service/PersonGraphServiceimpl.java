package com.btl.findjob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.PersonGraphMapper;
import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.PersonInfoGraphDTO;

@Service
public class PersonGraphServiceimpl implements PersonGraphService {

    @Inject
    PersonGraphMapper personGrpah;

    public List<PersonInfoGraphDTO> personGetGraph(String ciName) {
        return personGrpah.personGetGraph(ciName);
    }

}

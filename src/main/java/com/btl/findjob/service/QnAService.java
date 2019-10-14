package com.btl.findjob.service;

import com.btl.findjob.mapper.QnAMapper;
import com.btl.findjob.model.QnADTO;

import java.util.List;

public interface QnAService {

    List<QnADTO> list(String qnA_user_id);

    void register(QnADTO qnADTO);

    QnADTO getQnA(String qnA_id);

}

package com.btl.findjob.mapper;

import com.btl.findjob.model.QnADTO;

import java.util.List;

public interface QnAMapper {

    List<QnADTO> list(String qnA_user_id);

    void register(QnADTO qnADTO);

    QnADTO getQnA(String qnA_id);

}

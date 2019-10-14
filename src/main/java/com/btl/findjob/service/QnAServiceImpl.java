package com.btl.findjob.service;


import com.btl.findjob.mapper.QnAMapper;
import com.btl.findjob.model.QnADTO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class QnAServiceImpl implements QnAService {

    QnAMapper qnAMapper;

    @Override
    public List<QnADTO> list(String qnA_user_id) {
        return qnAMapper.list(qnA_user_id);
    }

    @Override
    public void register(QnADTO qnADTO) {
        qnAMapper.register(qnADTO);
    }

    @Override
    public QnADTO getQnA(String qnA_id) {
        return qnAMapper.getQnA(qnA_id);
    }
}

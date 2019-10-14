package com.btl.findjob.model;

import lombok.Data;

@Data
public class QnADTO {
    private int qnA_id;
    private String qnA_title;
    private String qnA_content;
    private boolean qnA_state;
    private int qnA_user_id;
    private String qnA_answer;
    private String user_email;

}

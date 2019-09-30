package com.btl.findjob.model;

import lombok.Data;

@Data
public class BoardAttachDTO {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
    
    private int board_id;
}

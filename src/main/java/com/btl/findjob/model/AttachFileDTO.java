package com.btl.findjob.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class AttachFileDTO {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;

}

package com.seu.toolboxtalk.model.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectForm {
    private Integer memberId;
    private String externalKey;
    private String title;
    private String content;
}

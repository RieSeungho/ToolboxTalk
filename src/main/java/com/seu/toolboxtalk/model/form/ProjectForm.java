package com.seu.toolboxtalk.model.form;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectForm {
    private Integer memberId;
    private String externalKey;

    @NotBlank
    private String title;

    @NotBlank
    private String content;
}

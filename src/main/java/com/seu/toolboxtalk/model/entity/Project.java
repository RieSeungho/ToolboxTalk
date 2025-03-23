package com.seu.toolboxtalk.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class Project {
    private Integer id;
    private Integer memberId;
    private String externalKey;
    private String title;
    private String content;
    private Boolean status;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
}

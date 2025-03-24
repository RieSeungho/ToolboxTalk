package com.seu.toolboxtalk.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Alias("Project")
@Getter
@Setter
@NoArgsConstructor
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

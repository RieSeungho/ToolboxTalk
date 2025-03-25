package com.seu.toolboxtalk.model.dto;

import com.seu.toolboxtalk.model.entity.Member;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;
import java.util.List;

@Alias("ProjectDTO")
@Getter
@Setter
@ToString
public class ProjectDTO {
    private Integer id;
    private String externalKey;
    private String title;
    private String content;
    private String permission;
    private Boolean status;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
    private Member member;
}

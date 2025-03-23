package com.seu.toolboxtalk.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Alias("Member")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String email;
    private String authority;
    private Boolean status;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
}

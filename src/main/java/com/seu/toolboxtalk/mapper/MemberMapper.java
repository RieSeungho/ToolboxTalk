package com.seu.toolboxtalk.mapper;

import com.seu.toolboxtalk.model.entity.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface MemberMapper {

    /**
     *
     * @param username
     * @return
     */
    boolean isUsernameNotExist(String username);

    /**
     *
     * @param member
     * @return
     */
    int insertMember(Member member);

    /**
     *
     * @param username
     * @return
     */
    Optional<Member> getMemberByUsername(String username);

    /**
     *
     * @param id
     * @return
     */
    Optional<Member> getMemberById(Integer id);

    /**
     * |
     * @param member
     * @return
     */
    int updateMember(Member member);
}

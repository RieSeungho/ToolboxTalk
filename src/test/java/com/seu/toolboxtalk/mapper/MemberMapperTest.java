package com.seu.toolboxtalk.mapper;

import com.seu.toolboxtalk.exception.MemberDoesNotExistException;
import com.seu.toolboxtalk.model.entity.Member;
import org.junit.jupiter.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class MemberMapperTest {

    @Autowired
    MemberMapper memberMapper;

    private static final Logger logger = LoggerFactory.getLogger(MemberMapperTest.class);

    private static Member sampleMember;

    @BeforeEach
    public void setUp() {
        sampleMember = new Member();
        sampleMember.setUsername("sampleUsername");
        sampleMember.setPassword("samplePass");
        sampleMember.setNickname("sampleNickname");
        sampleMember.setEmail("sample@seu.com");
        sampleMember.setAuthority("COM");
        sampleMember.setStatus(true);

        insertMemberTest();
    }

    @AfterEach
    public void tearDown() {
        sampleMember = null;
    }

    @Test
    void insertMemberTest() {
        int effectedRow = memberMapper.insertMember(sampleMember);
        Assertions.assertEquals(1, effectedRow);
        logger.info("INSERT_MEMBER_EFFECTED_ROW={}", effectedRow);

        Integer identifier = sampleMember.getId();
        Assertions.assertNotNull(identifier);
        logger.info("INSERT_MEMBER_IDENTIFIER={}", identifier);
    }

    @Test
    void isUsernameNotExistTest() {
        final String existUsername = sampleMember.getUsername();
        final String notExistUsername = "notExistUsername";

        boolean existUsernameResult = memberMapper.isUsernameNotExist(existUsername);
        boolean notExistUsernameResult = memberMapper.isUsernameNotExist(notExistUsername);

        Assertions.assertTrue(existUsernameResult);
        logger.info("IS_USERNAME_EXIST_RESULT={}", existUsernameResult);

        Assertions.assertFalse(notExistUsernameResult);
        logger.info("IS_USERNAME_NOT_EXIST_RESULT={}", notExistUsernameResult);
    }

    @Test
    void getMemberByUsernameTest() {
        String username = sampleMember.getUsername();
        Optional<Member> memberOptional = memberMapper.getMemberByUsername(username);

        Assertions.assertTrue(memberOptional.isPresent());
        Member member = memberOptional.get();

        Assertions.assertEquals(username, member.getUsername());
        logger.info("SAMPLE_USERNAME={}", username);
    }

    @Test
    void getMemberByIdTest() {
        Integer id = sampleMember.getId();
        Optional<Member> memberOptional = memberMapper.getMemberById(id);

        Assertions.assertTrue(memberOptional.isPresent());
        Member member = memberOptional.get();

        Assertions.assertEquals(id, member.getId());
        logger.info("SAMPLE_ID={}", id);
    }

    @Test
    void updateMemberTest() {
        String temporaryEmail = "temporaryEmail@seu.com";
        String temporaryNickname = "temporaryUsername";

        sampleMember.setEmail(temporaryEmail);
        sampleMember.setNickname(temporaryNickname);
        int effectedRow = memberMapper.updateMember(sampleMember);

        Assertions.assertEquals(1, effectedRow);
        logger.info("UPDATE_MEMBER_EFFECTED_ROW={}", effectedRow);

        Member member = memberMapper.getMemberById(sampleMember.getId())
                .orElseThrow(() -> new MemberDoesNotExistException(("登録されていないユーザーです")));

        Assertions.assertEquals(temporaryEmail, member.getEmail());
        Assertions.assertEquals(temporaryNickname, member.getNickname());
    }

    @Test
    void updateNullValueMemberTest() {


        sampleMember.setNickname(null);

        sampleMember.setEmail(null);


    }

}

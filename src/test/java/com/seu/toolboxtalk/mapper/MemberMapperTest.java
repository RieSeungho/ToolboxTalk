package com.seu.toolboxtalk.mapper;

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
        insertMemberTest();

        final String existUsername = sampleMember.getUsername();
        final String notExistUsername = "notExistUsername";

        boolean existUsernameResult = memberMapper.isUsernameNotExist(existUsername);
        boolean notExistUsernameResult = memberMapper.isUsernameNotExist(notExistUsername);

        Assertions.assertTrue(existUsernameResult);
        Assertions.assertFalse(notExistUsernameResult);
    }

    @Test
    void getMemberByUsernameTest() {

    }

    @Test
    void getMemberByIdTest() {

    }

    @Test
    void updateMemberTest() {

    }

}

package com.seu.toolboxtalk.controller;

import com.seu.toolboxtalk.mapper.MemberMapper;
import com.seu.toolboxtalk.model.form.LoginForm;
import com.seu.toolboxtalk.model.form.MemberForm;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/*
    MEMBER CONTROLLER
    ユーザーの登録、ログイン、会員情報閲覧、認証機能を行う
*/

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberMapper memberMapper;

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @GetMapping("/join")
    public String joinPage(Model model) {

        model.addAttribute("memberForm", new MemberForm());

        return "member/join";
    }

    @PostMapping("/join")
    public String memberJoin(@ModelAttribute @Valid MemberForm memberForm, Model model) {

        logger.info("MEMBER_FORM={}", memberForm);

        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {

        model.addAttribute("loginForm", new LoginForm());

        return "member/login";
    }
}

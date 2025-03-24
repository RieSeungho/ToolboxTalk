package com.seu.toolboxtalk.controller;

import com.seu.toolboxtalk.model.form.LoginForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
    MEMBER CONTROLLER
    ユーザーの登録、ログイン、会員情報閲覧、認証機能を行う
*/

@Controller
@RequestMapping("/member")
public class MemberController {

    @GetMapping("/join")
    public String joinPage() {

        return "member/join";
    }

    @PostMapping("/join")
    public String memberJoin() {

        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {

        model.addAttribute("loginForm", new LoginForm());

        return "member/login";
    }
}

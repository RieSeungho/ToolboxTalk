package com.seu.toolboxtalk.configuration;

import com.seu.toolboxtalk.mapper.MemberMapper;
import com.seu.toolboxtalk.model.entity.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberMapper.getMemberByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("ユーザIDまたはパスワードに誤りがあるか、登録されていません。"));

        return CustomUserDetail
                .builder()
                .id(member.getId())
                .username(member.getUsername())
                .password(member.getPassword())
                .role(member.getAuthority())
                .status(member.getStatus())
                .nickname(member.getNickname())
                .build();
    }
}

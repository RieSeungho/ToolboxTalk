package com.seu.toolboxtalk.controller;

import com.seu.toolboxtalk.mapper.ProjectMapper;
import com.seu.toolboxtalk.model.dto.ProjectDTO;
import com.seu.toolboxtalk.model.entity.Project;
import com.seu.toolboxtalk.model.form.ProjectForm;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/project")
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectMapper projectMapper;

    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    private String ramen;

    @GetMapping
    public String projectList(Model model) {

        model.addAttribute("projectList", projectMapper.getAllProjectList());

        return "project/project_list";
    }

    @GetMapping("/detail/{identifier}")
    public String projectDetail(@PathVariable Optional<String> identifier,
                                Model model,
                                RedirectAttributes redirectAttributes) {
        try {
            if (identifier.isPresent()) {
                String externalKey = identifier.get();
                ProjectDTO projectDetail = projectMapper.getProjectByExternalKey(externalKey)
                        .orElseThrow(() -> new RuntimeException("リクエストのページがありません"));

                model.addAttribute("projectDetail", projectDetail);
                return "project/project_detail";
            } else {
                throw new RuntimeException("リクエストのページがありません");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
            return "redirect:/project";
        }
    }

    @GetMapping("/form")
    public String projectForm(Model model) {

        model.addAttribute("projectForm", new ProjectForm());

        return "project/project_form";
    }
}

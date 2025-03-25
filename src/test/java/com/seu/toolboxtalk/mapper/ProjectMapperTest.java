package com.seu.toolboxtalk.mapper;

import com.seu.toolboxtalk.model.dto.ProjectDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class ProjectMapperTest {

    private static final Logger logger = LoggerFactory.getLogger(ProjectMapperTest.class);

    @Autowired
    ProjectMapper projectMapper;

    @Test
    void getAllProjectListTest() {
        List<ProjectDTO> projectList = projectMapper.getAllProjectList();

        Assertions.assertNotEquals(0, projectList.size());

        int i = 0;

        for (ProjectDTO projectDTO : projectList) {
            i += 1;
            logger.info("{}\'ST_PROJECT_DTO={}", i, projectDTO);
        }
    }

}

package com.seu.toolboxtalk.mapper;

import com.seu.toolboxtalk.model.dto.ProjectDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface ProjectMapper {

    List<ProjectDTO> getAllProjectList();
    List<ProjectDTO> getProjectListByTitle(String title);
    List<ProjectDTO> getProjectListByExternalKey(String externalKey);
    Optional<ProjectDTO> getProjectByExternalKey(String externalKey);
}

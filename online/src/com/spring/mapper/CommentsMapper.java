package com.spring.mapper;

import java.util.List;
import java.util.Map;

public interface CommentsMapper {


	List<Map<String, Object>> getCommentsByDishId(Map<String, Object> dishidmap);

	void addComment(Map<String, Object> map);

	void deleteCommentById(Map<String, Object> map);

}

package com.spring.service;

import java.util.List;
import java.util.Map;

public interface CommentsService {


	List<Map<String, Object>> getCommentsByDishId(Map<String, Object> dishidmap);

	void addComment(Map<String, Object> map);

	void deleteCommentById(Map<String, Object> map);

}

package com.spring.serivceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommentsMapper;
import com.spring.service.CommentsService;

@Service("CommentsService")
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	CommentsMapper commentsDao;

	@Override
	public List<Map<String, Object>> getCommentsByDishId(Map<String, Object> dishidmap) {
		// TODO Auto-generated method stub
		return commentsDao.getCommentsByDishId(dishidmap);
	}

	@Override
	public void addComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		commentsDao.addComment(map);
	}

	@Override
	public void deleteCommentById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		commentsDao.deleteCommentById(map);
	}
	
	
}

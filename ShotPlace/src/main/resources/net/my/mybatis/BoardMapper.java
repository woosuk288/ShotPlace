package net.my.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import net.my.board.Article;

public interface BoardMapper {
	/*
	 * 게시판 목록
	 */
	public ArrayList<Article> getArticleList(HashMap<String, String> hashmap);
	/* 
	 * 새로운 게시글 추가
	 */
	public int insert(Article article);
	/*
	 * 게시글 수정
	 */
	public void update(Article article);	
	
	/* 
	 * 게시글 삭제
	 */
	public void delete(int articleNo);
	
	/*
	 * 게시판 이름(종류)
	 */
	public String getBoardNm(String boardCd);
	
	/*
	 * 게시판 조회수 증가
	 */
	public void increaseHit(int articleNo);

	/*
	 * 게시판 객체 가져오기
	 */
	public Article getArticle(int articleNo);
}

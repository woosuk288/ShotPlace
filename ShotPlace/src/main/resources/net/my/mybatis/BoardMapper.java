package net.my.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import net.my.board.Article;
import net.my.board.AttachFile;
import net.my.board.Comment;

public interface BoardMapper {
	/*
	 * 게시판 목록
	 */
	public ArrayList<Article> getArticleList(HashMap<String, String> hashmap);
	
	/*
	 * 특정 게시판의 총 게시물 갯수 구하기
	 */
	public int getTotalRecord(HashMap<String, String> hashmap);
	
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
	
	/*
	 * 이전글 보기
	 */
	public Article getPrevArticle(HashMap<String, String> hashmap);

	/*
	 * 다음글 보기
	 */
	public Article getNextArticle(HashMap<String, String> hashmap);

	/*
	 * 가장 최근 게시물 가져오기
	 */
	public Article getNewArticle();
	
	/*
	 * 첨부파일 추가
	 */
	public void insertAttachFile(AttachFile attachFile);

	/*
	 *  게시글의 첨부파일 리스트
	 */
	public ArrayList<AttachFile> getAttachFileList(int articleNo);

	/*
	 * 첨부 파일 삭제 
	 */
	public void deleteFile(Integer attachFileNo);
	
	/*
	 * 덧글쓰기
	 */
	public void insertComment(Comment comment);	
	
	/*
	 * 덧글수정
	 */
	public void updateComment(Comment comment);
	
	/*
	 * 덧글삭제
	 */
	public void deleteComment(int commentNo);
	
	/*
	 * 덧글 가져오기
	 */
	public Comment getComment(int commentNo);
	
	/*
	 * 게시글의 덧글리스트 구하기
	 */
	public ArrayList<Comment> getCommentList(int articleNo);
}

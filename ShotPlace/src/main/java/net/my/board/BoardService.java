package net.my.board;

import java.util.ArrayList;

import net.my.commons.PagingHelper;

public interface BoardService {

	/*
	 * 게시판 목록
	 */
	public ArrayList<Article> getArticleList(String boardCd, int start, int end);
	
	/*
	 * 특정 게시판의 총 게시물 갯수 구하기
	 */
	public int getTotalRecord(String boardCd);
	
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
	public Article getPrevArticle(int articleNo, String boardCd);

	/*
	 * 다음글 보기
	 */
	public Article getNextArticle(int articleNo, String boardCd);
	
	/*
	 * paging
	 */
	public int getListNo();
	
	public int getPrevLink();
	
	public int getFirstPage();
	
	public int getLastPage();
	
	public int getNextLink();

	public int[] getPageLinks();

	public void setPagingHelper(PagingHelper pagingHelper);

}

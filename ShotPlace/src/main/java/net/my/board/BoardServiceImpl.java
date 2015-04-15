package net.my.board;

import java.util.*;

import net.my.commons.PagingHelper;
import net.my.mybatis.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	private PagingHelper pagingHelper; //페이징 처리 유틸리티 클래스
	
	/*
	 * 게시판 목록
	 */
	public ArrayList<Article> getArticleList(String boardCd, String searchWord, int start, int end) {
		Integer startRownum = start;
		Integer endRownum = end;
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		hashmap.put("start", startRownum.toString());
		hashmap.put("end", endRownum.toString());
		
		return boardMapper.getArticleList(hashmap);
	}
	
	/*
	 * 특정 게시판의 총 게시물 갯수 구하기
	 */
	public int getTotalRecord(String boardCd, String searchWord) {
		HashMap<String,String> hashmap = new HashMap<String,String>();
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);

		return boardMapper.getTotalRecord(hashmap);
	}
	
	/*
	 * 새로운 게시글  추가
	 */
	public int insert(Article article) {
		return boardMapper.insert(article);
	}
	
	/*
	 * 게시글 수정
	 */
	public void update(Article article) {
		boardMapper.update(article);
	}
	
	/*
	 * 게시글 삭제
	 */
	public void delete(int articleNo) {
		boardMapper.delete(articleNo);
	}
	
	/*
	 * 게시판 이름(종류)
	 */
	public String getBoardNm(String boardCd){
		return boardMapper.getBoardNm(boardCd);
	}
	
	/*
	 * 게시판 조회수 증가
	 */
	public void increaseHit(int articleNo){
		boardMapper.increaseHit(articleNo);
	}

	/*
	 * 게시판 객체 가져오기
	 */
	public Article getArticle(int articleNo){
		return boardMapper.getArticle(articleNo);
	}
	
	/*
	 * 이전글 보기
	 */
	public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		Integer no = articleNo;
		hashmap.put("articleNo", no.toString());
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		
		return boardMapper.getPrevArticle(hashmap);
	}

	/*
	 * 다음글 보기
	 */
	public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		Integer no = articleNo;
		hashmap.put("articleNo", no.toString());
		hashmap.put("boardCd", boardCd);
		hashmap.put("searchWord", searchWord);
		
		return boardMapper.getNextArticle(hashmap);
	}
	
	/*
	 * paging
	 */
	public int getListNo() {
		return pagingHelper.getListNo(); 
	}
	
	public int getPrevLink() {
		return pagingHelper.getPrevLink();
	}
	
	public int getFirstPage() {
		return pagingHelper.getFirstPage();
	}
	
	public int getLastPage() {
		return pagingHelper.getLastPage();
	}
	
	public int getNextLink() {
		return pagingHelper.getNextLink();
	}

	public int[] getPageLinks() {
		return pagingHelper.getPageLinks();
	}

	public PagingHelper getPagingHelper() {
		return pagingHelper;
	}

	public void setPagingHelper(PagingHelper pagingHelper) {
		this.pagingHelper = pagingHelper;
	}
}

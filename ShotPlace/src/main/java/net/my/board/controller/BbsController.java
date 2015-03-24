package net.my.board.controller;

import java.util.ArrayList;

import net.my.board.Article;
import net.my.board.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/bbs")
public class BbsController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(String boardCd, Model model) throws Exception{
				
		if (boardCd == null) boardCd = "free";
		
		ArrayList<Article> list = boardService.getArticleList(boardCd);
		String boardNm = boardService.getBoardNm(boardCd);
		
		model.addAttribute("list", list);
		model.addAttribute("boardNm", boardNm);
		model.addAttribute("boardCd", boardCd);
		
		
		return "bbs/list";	
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(String boardCd, Model model) throws Exception {
		
		//게시판 이름
		String boardNm = boardService.getBoardNm(boardCd);
		model.addAttribute("boardNm", boardNm);
		
		return "bbs/writeform";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Article article) throws Exception {
		article.setEmail("비회원"); //임시
		boardService.insert(article);
		return "redirect:/bbs/list?boardCd=" + article.getBoardCd();
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(int articleNo, String boardCd, Model model) throws Exception {
		
		boardService.increaseHit(articleNo);
		
		//상세보기
		Article thisArticle = boardService.getArticle(articleNo);
		Article prevArticle = boardService.getPrevArticle(articleNo, boardCd);
		Article nextArticle = boardService.getNextArticle(articleNo, boardCd);

		ArrayList<Article> list = boardService.getArticleList(boardCd);
		String boardNm = boardService.getBoardNm(boardCd);

		model.addAttribute("thisArticle", thisArticle);
		model.addAttribute("prevArticle", prevArticle);
		model.addAttribute("nextArticle", nextArticle);
		
		model.addAttribute("list", list);
		model.addAttribute("boardNm", boardNm);
		model.addAttribute("boardCd", boardCd);

		
		
		return "bbs/view";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int articleNo, 
			String boardCd) throws Exception {
		
		boardService.delete(articleNo);
		
		return "redirect:/bbs/list?boardCd=" + boardCd;

	}	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String update(int articleNo,
			String boardCd,
			Model model) throws Exception {
		
		Article thisArticle = boardService.getArticle(articleNo);
		String boardNm = boardService.getBoardNm(boardCd);
	     
	    //수정페이지에서 보일 게시글 정보
	    model.addAttribute("thisArticle", thisArticle);
		model.addAttribute("boardNm", boardNm);
		
		return "bbs/modifyForm";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String update(Article article,
			String boardCd,
			Model model) throws Exception {
		
		boardService.update(article);
		
		return "redirect:/bbs/view?articleNo=" + article.getArticleNo() + 
				"&boardCd=" + article.getBoardCd();
	}
}

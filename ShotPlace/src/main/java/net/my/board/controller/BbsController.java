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
	public String write(Article article) {
		article.setEmail("비회원"); //임시
		boardService.insert(article);
		return "redirect:/bbs/list?boardCd=" + article.getBoardCd();
	}
}

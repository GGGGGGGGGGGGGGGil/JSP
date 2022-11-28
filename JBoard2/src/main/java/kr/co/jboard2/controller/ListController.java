package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.vo.ArticleVO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/list.do")
public class ListController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg	  = req.getParameter("pg");
		String search = req.getParameter("search");
		
		int currentPage = service.getCurrentPage(pg);
		int total = 0;
		if(search == null) {
			total = service.selectCountTotal();
		}else {
			total = service.selectCountTotalForSearch(search);
		}
		
		int lastPageNum = service.getLastPageNum(total);
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		int pageStartNum = service.getPageStartNum(total, currentPage);
		int start = service.getStartNum(currentPage);
		
		//글 가져오기
		List<ArticleVO> articles = null;
		if(search == null) {
			articles = service.selectArticles(start);
		}else {
			articles = service.selectArticleByKeyword(search, start);
		}
		
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("search", search);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}

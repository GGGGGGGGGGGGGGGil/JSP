package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.BookVO;

public class BookDAO extends DBHelper {
	
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	
	private BookDAO() {}
	
	public void insertBook(BookVO bv) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `book` VALUES (?,?,?,?)");
			psmt.setInt(1, bv.getBookId());
			psmt.setString(2, bv.getBookName());
			psmt.setString(3, bv.getPublisher());
			psmt.setInt(4, bv.getPrice());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public BookVO selectBook(String bookId) {
		
		BookVO bv = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				bv = new BookVO();
				bv.setBookId(rs.getInt(1));
				bv.setBookName(rs.getString(2));
				bv.setPublisher(rs.getString(3));
				bv.setPrice(rs.getInt(4));
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bv;
	}
	public List<BookVO> selectBooks() {
		
		List<BookVO> books = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `book`");
			
			while(rs.next()) {
				BookVO bv = new BookVO();
				
				bv.setBookId(rs.getInt(1));
				bv.setBookName(rs.getString(2));
				bv.setPublisher(rs.getString(3));
				bv.setPrice(rs.getInt(4));
				
				books.add(bv);
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return books;
	}
	public void updateBook(BookVO bv) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `book` set `booName`=?, `publisher`=?, `price`=? where `bookId`=?");
			
			psmt.setInt(1, bv.getBookId());
			psmt.setString(2, bv.getBookName());
			psmt.setString(3, bv.getPublisher());
			psmt.setInt(4, bv.getPrice());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteBook() {}
	
}

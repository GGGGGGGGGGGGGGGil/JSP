package kr.co.jboard1.db;

public class Sql {
	
	//user - 복합 대입연산자 사용못함
	public static final String INSERT_USER = "insert into `board_user` set " //set 뒤에 한칸 공백
										   + "`uid`  =?,"
										   + "`pass` =SHA2(?, 256),"
										   + "`name` =?,"
										   + "`nick` =?,"
										   + "`email`=?,"
										   + "`hp`   =?,"
										   + "`zip`  =?,"
										   + "`addr1`=?,"
										   + "`addr2`=?,"
										   + "`regip`=?,"
										   + "`rdate`=NOW()";
	
	public static final String SELECT_USER = "select * from `board_user` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String SELECT_COUNT_UID = "select count(`uid`) from `board_user` where `uid`=?";
	public static final String SELECT_COUNT_NICK = "select count(`nick`) from `board_user` where `nick`=?";
	public static final String SELECT_TERMS = "select * from `board_terms`";
	
	//board
	public static final String INSERT_ARTICLE = "insert into `board_article` set "
			                                  + "`title`  =?,"
			                                  + "`content`=?,"
			                                  + "`file`   =?,"
			                                  + "`uid`    =?,"
			                                  + "`regip`  =?,"
			                                  + "`rdate`=NOW()";
	public static final String INSERT_FILE = "insert into `board_file` set "
										   + "`parent`=?,"
										   + "`newName`=?,"
										   + "`oriName`=?,"
										   + "`rdate`=NOW()";
	public static final String SELECT_MAX_NO = "select max(`no`) from `board_article`";
}
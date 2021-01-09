package Day13.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	// 싱글톤
	
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstatnce() {
		return instance;
	}
	
	private static Connection getConnection() {
		String myDriver = "oracle.jdbc.driver.OracleDriver";
		String myUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String myId = "jslhrd46";
		String myPass = "1234";
		Connection conn = null;
		try {
			Class.forName(myDriver);
			conn = DriverManager.getConnection(myUrl, myId, myPass);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}	
	
//	게시판 총 글수 카운트
	
	public int boardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0; 
		
		String sql = "select count(*) from tbl_board";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				row = rs.getInt(1);
//				row = rs.getInt("counter");
			}
		}catch(Exception e) {
			row=-1;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				row=-2;
			}
		}
		
		return row;
	}
	
	// 등록 메소드
	public int boardWrite(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0; 
		
		String sql = "insert into tbl_board(idx, name, pass, subject, contents, email, ip)"
				+ " values(board_seq_idx.nextval,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getContents());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getIp());
			row = pstmt.executeUpdate();
			

		}catch(Exception e) {
			row=-1;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				row=-2;
			}
		}
		return row;
	}
	// 전체 목록 메소드
		public List<BoardVO> boardList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "select * from tbl_board order by idx desc";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVO vo = new BoardVO();
					vo.setIdx(rs.getInt("idx")); // 고유번호
					vo.setName(rs.getString("name")); // 작성자
					vo.setSubject(rs.getString("subject")); // 제목
					vo.setRegdate(rs.getString("regdate")); // 등록일자
					vo.setReadcnt(rs.getInt("readcnt")); // 조회수
					
					list.add(vo);
					
				}
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
			
			return list;
		}
		
		// 페이지 처리 기능 추가 (검색조건 x )
		public List<BoardVO> boardList(int startpage, int endpage) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "select X.* from (select rownum as rnum, A.* from ("
					+ " select * from tbl_board order by idx desc) A "
					+ "where rownum <= ? ) X where X.rnum >= ?";
			
//			String sql = "select * from (select rownum rnum, idx, name, subject from tbl_board where rnum <= ?\r\n" + 
//					" order by idx desc) where rnum>=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endpage);
				pstmt.setInt(2, startpage);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVO vo = new BoardVO();
					vo.setIdx(rs.getInt("idx")); // 고유번호
					vo.setName(rs.getString("name")); // 작성자
					vo.setSubject(rs.getString("subject")); // 제목
					vo.setRegdate(rs.getString("regdate")); // 등록일자
					vo.setReadcnt(rs.getInt("readcnt")); // 조회수
					
					list.add(vo);
					
				}
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
			
			return list;
		}
		
		// 페이지 처리 기능 추가 (검색조건  포함 )
		public List<BoardVO> boardList(String search, String key, int startpage, int endpage) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "select X.* from (select rownum as rnum, A.* from ("
					+ " select * from tbl_board order by idx desc) A "
					+ "where "+search +" like '%"+key+"%' and rownum <= ? ) X where "+search +" like '%"+key+"%' and X.rnum >= ?";
			
//			String sql = "select * from (select rownum rnum, idx, name, subject from tbl_board where rnum <= ?\r\n" + 
//					" order by idx desc) where rnum>=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endpage);
				pstmt.setInt(2, startpage);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVO vo = new BoardVO();
					vo.setIdx(rs.getInt("idx")); // 고유번호
					vo.setName(rs.getString("name")); // 작성자
					vo.setSubject(rs.getString("subject")); // 제목
					vo.setRegdate(rs.getString("regdate")); // 등록일자
					vo.setReadcnt(rs.getInt("readcnt")); // 조회수
					list.add(vo);
					
				}
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
			
			return list;
		}
		
		
		// 특정 게시글 검색 (view)
		public BoardVO boardSelect(int idx) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardVO vo = new BoardVO();
			
			String sql = "select * from tbl_board where idx=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx")); // 고유번호
					vo.setName(rs.getString("name")); // 작성자
					vo.setEmail(rs.getString("email")); // 작성자
					vo.setSubject(rs.getString("subject")); // 제목
					vo.setRegdate(rs.getString("regdate")); // 등록일자
					vo.setReadcnt(rs.getInt("readcnt")); // 조회수
					vo.setContents(rs.getString("contents")); // 내용
					
				}
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
			
			return vo;
		}
	

	public int boardEdit(BoardVO vo) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int row = 0;
			
			String sql = "update tbl_board set email = ?, subject = ?, contents = ? where idx = ? and pass=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getEmail());
				pstmt.setString(2, vo.getSubject());
				pstmt.setString(3, vo.getContents());
				pstmt.setInt(4, vo.getIdx());
				pstmt.setString(5, vo.getPass());
				pstmt.executeUpdate();
				
				row = 1;
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
				return row;
		}

		
		
//				// 삭제
		public int boardDelete( int idx , String pass) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int row = 0;
			
			String sql = "delete from tbl_board where idx = ? and pass=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, pass);
				
				row = pstmt.executeUpdate();
				
				
			}catch(Exception e) {
				
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					
				}
			}
				return row;
		}	


	
	// 조회수 증가
	public void boardHits(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update tbl_board set readcnt = readcnt + 1 where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				
			}
		}

	}
	
	public List<BoardVO> boardSearch(String search, String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		String sql = "select * from tbl_board where "+search+" like '%"+key+"%' order by idx desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx")); // 고유번호
				vo.setName(rs.getString("name")); // 작성자
				vo.setEmail(rs.getString("email")); // 작성자
				vo.setSubject(rs.getString("subject")); // 제목
				vo.setRegdate(rs.getString("regdate")); // 등록일자
				vo.setReadcnt(rs.getInt("readcnt")); // 조회수
				vo.setContents(rs.getString("contents")); // 내용
				list.add(vo);
				
			}
		}catch(Exception e) {
			
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return list;
	}
	
	public int boardCountSearch(String search, String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0; 
		
		String sql = "select count(*) from tbl_board where "+search+" like '%"+key+"%' order by idx desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				row = rs.getInt(1);
//				row = rs.getInt("counter");
			}
		}catch(Exception e) {
			row=-1;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				row=-2;
			}
		}
		
		return row;
	}

	
}

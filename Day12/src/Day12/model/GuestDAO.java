package Day12.model;
import java.sql.*;
import java.util.*;
// DAO (Data Access Object)
// 1. 드라이버 로딩 - 커넥션 - CRUD
public class GuestDAO {
	
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
	
//	메소드 정의
	
	public int guestCount() {
	
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0; 
		
		String sql = "select count(*) from tbl_guest";
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
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				row=-2;
			}
		}
		
		return row;
	}
	
	// 등록 메소드
	public int guestWrite(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0; 
		
		String sql = "insert into tbl_guest(idx, name, pass, subject, contents)"
				+ " values(tbl_guest_seq_idx.nextval,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getContents());
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
	public List<BoardVO> guestList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from tbl_guest order by idx desc";
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
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return list;
	}
	
	
	
	// 특정 게시글 검색 (view)
		public BoardVO guestSelect(int idx) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardVO vo = new BoardVO();
			
			String sql = "select * from tbl_guest where idx=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx")); // 고유번호
					vo.setName(rs.getString("name")); // 작성자
					vo.setSubject(rs.getString("subject")); // 제목
					vo.setRegdate(rs.getString("regdate")); // 등록일자
					vo.setReadcnt(rs.getInt("readcnt")); // 조회수
					vo.setContents(rs.getString("contents")); // 내용
					
				}
			}catch(Exception e) {
				
			}finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}catch(Exception e) {
					
				}
			}
			
			return vo;
		}
		
		// 조회수 증가 메소드
		public void guestHits(int idx) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			String sql = "update tbl_guest set readcnt = readcnt + 1 where idx = ?";
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
		
		// 조회수 증가 메소드
				public int guestEdit(BoardVO vo) {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int row = 0;
					
					String sql = "update tbl_guest set subject = ?, contents = ?,  where idx = ? and pass=?";
					try {
						conn = getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, vo.getSubject());
						pstmt.setString(2, vo.getContents());
						pstmt.setInt(3, vo.getIdx());
						pstmt.setString(4, vo.getPass());
						
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
				
				
				// 삭제
				public int guestDelete( int idx , String pass) {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int row = 0;
					
					String sql = "delete from tbl_guest where idx = ? and pass=?";
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
}


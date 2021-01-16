package src.Day14.model;

import java.sql.*;
import java.util.*;

import src.Day14.util.DBManager;


public class GuestDAO {
	private GuestDAO() {}
	private static GuestDAO instance = new GuestDAO();
	public static GuestDAO getInstance() {
		return instance;
	}
	
	public int guestCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		String query = "select count(*) from tbl_guest";
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				row = rs.getInt(1);
			}

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	// 검색 조건을 통한 게시글 총수를 구하는 메소드
	public int guestCount(String s_query) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int row = 0;
		String query = "select count(*) from tbl_guest where "+s_query;
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				row = rs.getInt(1);
			}

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	
	// 전체 게시글 목록 구하는 메소드 (페이지 처리 없음, 검색 가능 없음 )
		public List<GuestDTO> guestList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<GuestDTO> list = new ArrayList<GuestDTO>();

			String query = "select * from tbl_guest order by idx desc";
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				System.out.println("쿼리");
				while(rs.next()) {
					GuestDTO dto = new GuestDTO();
					dto.setIdx(rs.getInt("idx"));
					dto.setName(rs.getString("name"));
					dto.setSubject(rs.getString("subject"));
					dto.setRegdate(rs.getString("Regdate"));
					dto.setReadcnt(rs.getInt("readcnt"));
					System.out.println(dto.getIdx());
					list.add(dto);
				}

			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			
			return list;
		}
		
		

		// 전체 게시글 목록 구하는 메소드 (페이지 처리, 검색기능은 없음. )
			public List<GuestDTO> guestList(int startpage, int endpage) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<GuestDTO> list = new ArrayList<GuestDTO>();

				String query = "select X.* from (select rownum as rnum, A.* from "
						+ "(select * from tbl_guest order by idx desc) A "
						+ "where rownum <= ?) X where X.rnum >= ?";
				try {
					conn = DBManager.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, endpage);
					pstmt.setInt(2, startpage);
					rs = pstmt.executeQuery();
					System.out.println("쿼리");
					while(rs.next()) {
						GuestDTO dto = new GuestDTO();
						dto.setIdx(rs.getInt("idx"));
						dto.setName(rs.getString("name"));
						dto.setSubject(rs.getString("subject"));
						dto.setRegdate(rs.getString("Regdate"));
						dto.setReadcnt(rs.getInt("readcnt"));
						list.add(dto);
					}

				}catch (Exception e) {
					// TODO: handle exception
				}finally {
					DBManager.close(conn, pstmt, rs);
				}
				
				return list;
			}
			
			// 전체 게시글 목록 구하는 메소드 (페이지 처리, 검색기능 )
			public List<GuestDTO> guestList(int startpage, int endpage, String s_query) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<GuestDTO> list = new ArrayList<GuestDTO>();

				String query = "select X.* from (select rownum as rnum, A.* from "
						+ "(select * from tbl_guest order by idx desc) A "
						+ "where "+s_query+" rownum <= ?) X where "+ s_query+" and X.rnum >= ?";
				try {
					conn = DBManager.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, endpage);
					pstmt.setInt(2, startpage);
					rs = pstmt.executeQuery();
					System.out.println("쿼리");
					while(rs.next()) {
						GuestDTO dto = new GuestDTO();
						dto.setIdx(rs.getInt("idx"));
						dto.setName(rs.getString("name"));
						dto.setSubject(rs.getString("subject"));
						dto.setRegdate(rs.getString("Regdate"));
						dto.setReadcnt(rs.getInt("readcnt"));
						System.out.println(dto.getIdx());
						list.add(dto);
					}

				}catch (Exception e) {
					// TODO: handle exception
				}finally {
					DBManager.close(conn, pstmt, rs);
				}
				
				return list;
			}
			
	// 특정글 조회수 증가
	public void guestHits(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "update tbl_guest set readcnt = readcnt+1 where idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
	}
	
	
	public GuestDTO guestSelect(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuestDTO dto = new GuestDTO();
		
		String query = "select * from tbl_guest where idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContents(rs.getString("contents"));
				dto.setRegdate(rs.getString("Regdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	// 등록 메소드
	public int guestWrite(GuestDTO guest) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query = "insert into tbl_guest(idx, name, pass, subject, contents)"
				+ " values (tbl_guest_seq_idx.nextval, ?,?,?,?)";
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, guest.getName());
			pstmt.setString(2, guest.getPass());
			pstmt.setString(3, guest.getSubject());
			pstmt.setString(4, guest.getContents());
			row = pstmt.executeUpdate();
			

		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	
	public int guestModify(GuestDTO guest) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("안!"+guest.getIdx());
		int row = 0;
		String query = "update tbl_guest set subject=?, contents=? where idx=? and pass =?";
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, guest.getSubject());
			pstmt.setString(2, guest.getContents());
			pstmt.setInt(3, guest.getIdx());
			pstmt.setString(4, guest.getPass());
			row = pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
	
	public int guestDelete(int idx, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query = "delete from tbl_guest where idx = ? and pass = ?";
		try {
			// conn = getConnection();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pass);
			row = pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return row;
	}
		
}


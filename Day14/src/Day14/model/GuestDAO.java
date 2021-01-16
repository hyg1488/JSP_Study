package Day14.model;

import java.sql.*;
import java.util.*;

import Day14.util.DBManager;


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
	
	
	// 전체 게시글 목록 구하는 메소드
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
				
				while(rs.next()) {
					GuestDTO dto = new GuestDTO();
					dto.setIdx(rs.getInt("idx"));
					list.add(dto);
				}

			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			
			return list;
		}
}


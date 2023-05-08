package jhLee.fileboard.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class FileboComDAO {
	
	private DataSource ds;

	public FileboComDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 :" + ex);
			return;
		}
	}

	public int filecommentsInsert(FileboComBean co) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = ds.getConnection();

			
			String sql = "insert into FILE_COMMENT "
					+ "values(filecom.nextval,?,?,sysdate,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,co.getF_C_ID() );
			pstmt.setString(2,co.getF_CONTENT());
			pstmt.setInt(3,co.getF_COMMENT_NUM() );
			pstmt.setInt(4,co.getF_COMMENT_RE_LEV() );
			pstmt.setInt(5,co.getF_COMMENT_RE_SEQ());
			pstmt.setInt(6,co.getF_COMMENT_RE_REF());

			result = pstmt.executeUpdate();


			if(result ==1) {
				System.out.println("데이터 삽입이 모두완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("filecommentsInsert() 에러: " + ex);
			
			ex.printStackTrace();

		} finally {
			if (pstmt != null) {
			try {
					pstmt.close();// 꼭 닫아줘야함 ㅇㅇ
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			if (con != null)
			try {
					con.close();// 꼭 닫아줘야함 ㅇㅇ

			} catch (Exception e) {
				e.printStackTrace();
			}

			}
		}

		return result;

	}

	public int getfilecomListcount(int F_COMMENT_NUM) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql = "select count(*) from FILE_COMMENT "
				+ "where F_COMMENT_NUM =? ";
		System.out.println(sql);

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, F_COMMENT_NUM);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getfilecomListcount()에러: " + e);
			System.out.println(e.getMessage());
			e.getStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {

					System.out.println(e.getMessage());
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {

					System.out.println(e.getMessage());
				}

		}

		return x;

	}//getfilecomListcount()end

	public JsonArray getfileCommentList(int comment_board_num, int state) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sort ="asc";//등록순
		if(state ==2) {
			sort="desc";
		}
		String sql = "select F_C_NUM, FILE_COMMENT.F_C_ID, F_CONTENT, F_COMMENT_DATE, F_COMMENT_RE_LEV, "
				   + "F_COMMENT_RE_SEQ, F_COMMENT_RE_REF, member.memberfile "
				   + "from FILE_COMMENT join member "
				   + "on FILE_COMMENT.F_C_ID = member.empno "
				   + "where F_COMMENT_NUM = ? "
				   + "order by F_COMMENT_RE_REF " + sort + ", "
				   + "		 F_COMMENT_RE_SEQ asc";
		System.out.println(sql);
		
		JsonArray array = new JsonArray();
		

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_board_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				//json형태인 속성 값으로 채움
				JsonObject object = new JsonObject();
				object.addProperty("num", rs.getInt(1));
				object.addProperty("id", rs.getString(2));
				object.addProperty("content", rs.getString(3));
				object.addProperty("reg_date", rs.getString(4));
				object.addProperty("comment_re_lev", rs.getInt(5));
				object.addProperty("comment_re_seq", rs.getInt(6));
				object.addProperty("comment_re_ref", rs.getInt(7));
				object.addProperty("memberfile", rs.getString(8));
				array.add(object);
System.out.println("getfileCommentList"+object);
			}
			
		} catch (Exception e) {
			System.out.println("getfileCommentList()에러: " + e);
			System.out.println(e.getMessage());
			e.getStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {

					System.out.println(e.getMessage());
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {

					System.out.println(e.getMessage());
				}

		}

		return array;

	}//getCommentList(2)end

	public int filecommentsDelete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = ds.getConnection();

			
			String sql = "delete from FILE_COMMENT "
					+ "where F_C_NUM =?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1,num);

			result = pstmt.executeUpdate();


			if(result ==1) {
				System.out.println("데이터 삭제가 완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("filecommentsDelete() 에러: " + ex);
			
			ex.printStackTrace();

		} finally {
			if (pstmt != null) {
			try {
					pstmt.close();// 꼭 닫아줘야함 ㅇㅇ
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			if (con != null)
			try {
					con.close();// 꼭 닫아줘야함 ㅇㅇ

			} catch (Exception e) {
				e.printStackTrace();
			}

			}
		}

		return result;

	}

	public int filecommentsUpdate(FileboComBean co) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = ds.getConnection();

			
			String sql = "update FILE_COMMENT set F_CONTENT= ?"
					+ "where F_C_NUM =?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,co.getF_CONTENT());
			pstmt.setInt(2,co.getF_C_NUM() );

			result = pstmt.executeUpdate();


			if(result ==1) {
				System.out.println("데이터 수정이 완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("filecommentsUpdate() 에러: " + ex);
			
			ex.printStackTrace();

		} finally {
			if (pstmt != null) {
			try {
					pstmt.close();// 꼭 닫아줘야함 ㅇㅇ
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			if (con != null)
			try {
					con.close();// 꼭 닫아줘야함 ㅇㅇ

			} catch (Exception e) {
				e.printStackTrace();
			}

			}
		}

		return result;

	}

	public int filecommentsReply(FileboComBean co) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result =0;
		
		try {
			
			con= ds.getConnection();
			con.setAutoCommit(false);
			StringBuilder update_sql = new StringBuilder();
			update_sql.append("update FILE_COMMENT ");
			update_sql.append("set F_COMMENT_RE_SEQ = F_COMMENT_RE_SEQ+1 ");
			update_sql.append("where F_COMMENT_RE_SEQ = ? ");
			update_sql.append("and F_COMMENT_RE_SEQ > ? ");
			System.out.println(update_sql);
		pstmt = con.prepareStatement(update_sql.toString());
		pstmt.setInt(1, co.getF_COMMENT_RE_REF());
		pstmt.setInt(2, co.getF_COMMENT_RE_SEQ());
		pstmt.executeUpdate();
		pstmt.close();
		
		String sql = "insert into FILE_COMMENT values(filecom.nextval, ?,?,sysdate,?,?,?,?)";
		
			pstmt= con.prepareStatement(sql);
			
			
			pstmt.setString(1,co.getF_C_ID());
			pstmt.setString(2,co.getF_CONTENT());
			pstmt.setInt(3,co.getF_COMMENT_NUM());
			pstmt.setInt(4,co.getF_COMMENT_RE_LEV()+1);
			pstmt.setInt(5,co.getF_COMMENT_RE_SEQ()+1);
			pstmt.setInt(6,co.getF_COMMENT_RE_REF()+1);
			result = pstmt.executeUpdate();

					if(result==1) {
						System.out.println("reply 삽입 완료");
						con.commit();//commit합니다.
					}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("filecommentsReply()에러:"+ex);

			if(con!=null) {
				try {con.rollback();//rollback합니다.
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return result;
	}

}

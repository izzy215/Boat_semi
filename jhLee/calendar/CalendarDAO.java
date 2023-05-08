package jhLee.calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class CalendarDAO {
	
	private DataSource ds;


	public CalendarDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 :" + ex);
			return;
		}
		
	}
	public int insert(Calendarbean cal) {
		

		// TODO Auto-generated method stub
		return 0;
	}

	public int saveall(Calendarbean cal) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = ds.getConnection();

			
			String sql = "insert into boat_Calendar"
					+ "(schedule_code,event_name,start_date,end_date,allday,empno,color,dept) "
					+ "	values(cal_seq.nextval,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,cal.getEvent_name() );
			pstmt.setString(2,cal.getStart_date());
			pstmt.setString(3,cal.getEnd_date());
			pstmt.setString(4,cal.getAllday());
			pstmt.setString(5,cal.getEmpno());
			pstmt.setString(6,cal.getColor());
			pstmt.setString(7,cal.getDept());

			result = pstmt.executeUpdate();


			if(result ==1) {
				System.out.println("데이터 삽입이 모두완료되었습니다.");
			}
		} catch (Exception ex) {
			System.out.println("saveall() 에러: " + ex);
			
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
	
	
	public boolean caldelelte(String title, String empno) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from boat_Calendar where event_name = ? and empno = ? ";
		
		boolean result_check = false;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, empno);
			
			int count =pstmt.executeUpdate();
			System.out.println(count);
				if(count>=1) {
					result_check=true;//삭제가 안된 경우에는false반환
				}
			
		}catch(Exception ex) {
			System.out.println("caldelelte()에러:"+ex);
			
		}finally {
			if (pstmt!= null)
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
		return result_check;
	}
	
	
	public JsonArray getCalList() {
		//		public List<Calendarbean> getCalList(empno) {


		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from  boat_Calendar ";
		//String sql = "select * from  boat_Calendar where empno = ? ";
		
		JsonArray list = new JsonArray();
		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(sql);

			//pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();

			while (rs.next()) {// 더이상 읽을 데이터가 없을때까지 반복
				JsonObject json = new JsonObject();
				//json.addProperty("id", rs.getInt("schedule_code"));
				json.addProperty("title", rs.getString("event_name"));
				json.addProperty("start", rs.getString("start_date"));
				json.addProperty("end", rs.getString("end_date"));
				json.addProperty("allDay", rs.getString("allday"));
				json.addProperty("color", rs.getString("color"));
				
				
				list.add(json);
			}
			return list;

		} catch (Exception ex) {
			System.out.println("getCalList() 에러: " + ex);
			
			ex.printStackTrace();

		} finally {
			if (rs != null)
			try {
					rs.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
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

		return list;

	}
	public String getempno() {
		
		
		return null;
	}
	
	
	public int update(Calendarbean cal) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			con = ds.getConnection();

			
			String sql = "update boat_Calendar set start_date =? , end_date =? where empno =? and event_name = ? ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);

			System.out.println(cal.getEmpno());
			System.out.println(cal.getStart_date());
			System.out.println(cal.getEnd_date());
			System.out.println(cal.getEvent_name());
			
			pstmt.setString(1,cal.getStart_date());
			pstmt.setString(2,cal.getEnd_date());
			pstmt.setString(3,cal.getEmpno() );
			pstmt.setString(4,cal.getEvent_name() );

			result = pstmt.executeUpdate();


			if(result ==1) {
				System.out.println("데이터 삽입이 모두완료되었습니다.");
			}else {
				System.out.println("수정실패");
				result =-1;
			}
			System.out.println("update result = "+result);
		} catch (Exception ex) {
			System.out.println("update() 에러: " + ex);
			
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
	public JsonArray getCalList(String dept) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from  boat_Calendar where dept = ? ";
	
		JsonArray list = new JsonArray();
		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,dept);
			rs = pstmt.executeQuery();

			while (rs.next()) {// 더이상 읽을 데이터가 없을때까지 반복
				JsonObject json = new JsonObject();
				json.addProperty("id", rs.getInt("schedule_code"));
				json.addProperty("title", rs.getString("event_name"));
				json.addProperty("start", rs.getString("start_date"));
				json.addProperty("end", rs.getString("end_date"));
				json.addProperty("allDay", rs.getString("allday"));
				json.addProperty("color", rs.getString("color"));
				
				
				list.add(json);
			}
			System.out.println(list);
			return list;

		} catch (Exception ex) {
			System.out.println("getCalList() 에러: " + ex);
			
			ex.printStackTrace();

		} finally {
			if (rs != null)
			try {
					rs.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
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

		return list;

	}


}

package jhLee.calendar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calupdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendarbean cal = new Calendarbean();
		CalendarDAO caldao = new CalendarDAO();
		
		String empno = request.getParameter("empno");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String title = request.getParameter("title");
		System.out.println("시작");
		System.out.println(empno);
		System.out.println(start);
		System.out.println(end);
		System.out.println(title);
		System.out.println("끝");
		
		cal.setStart_date(start);
		cal.setEnd_date(end);
		cal.setEmpno(empno);
		cal.setEvent_name(title);;
		
		int update = caldao.update(cal);
		if(update ==1) {
			System.out.println("캘린더데이터 날짜수정 성공");
			return null;
		}else if(update ==-1){
			System.out.println("업데이트 실패");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(update);
			
			return null;   
		}
		return null;
	
	}

}

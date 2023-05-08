package jhLee.calendar;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhLee.fileboard.member.Member;


public class CalAllsaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);
		
		Calendarbean cal = new Calendarbean();
		CalendarDAO caldao = new CalendarDAO();
		
		//Member mem = new Member();
		  
		String id = request.getParameter("id");
		String empno = request.getParameter("empno");
		String color = request.getParameter("color");
		String dept = "";
		switch(color) {
		case "pink" :
			dept = "<홍보팀>";
			cal.setDept("홍보팀");
			break;
		case "orange" :
			dept = "<개발팀>";
			cal.setDept("개발팀");
			break;
		case "lightgreen" :
			dept = "<인사팀>";
			cal.setDept("인사팀");
			break;
		case "purple" :
			dept = "<기획팀>";
			cal.setDept("기획팀");
			break;
		case "" :
			dept = "<영업팀>";
			cal.setDept("영업팀");
			break;
		case "lightgray" :
			dept = "<개인일정>";
			cal.setDept("개인일정");
			break;
		case "red" :
			dept = "<전체>";
			cal.setDept("관리자");
			break;
		}
		String title = dept+request.getParameter("title");
		String allday = request.getParameter("allDay");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		System.out.println("calid : "+id);     
	    System.out.println(empno);     
		System.out.println(title);
		System.out.println(allday);
		System.out.println(start);
		System.out.println(end);
		System.out.println(color);
		System.out.println("확인");
		
	
		
		cal.setAllday(allday);
		
		cal.setEvent_name(title);
		cal.setStart_date(start);
		cal.setEnd_date(end);
		cal.setEmpno(empno);
		cal.setColor(color);
		
		int saveall = caldao.saveall(cal);
		if(saveall ==1) {
			System.out.println("캘린더데이터 삽입 성공");
		}
		
		//월간달력 전체 이벤트 추가합니다.
		
	return null;
	}

}

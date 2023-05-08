package jhLee.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;

public class CalShowAction implements Action {
///project_calendarshow.cal":
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//dept 선택시 보여줌
		ActionForward forward = new ActionForward();
	
		CalendarDAO caldao = new CalendarDAO();
		JsonArray callist = null;
		
		
		
		String dept =  request.getParameter("dept");
		//String empno =  request.getParameter("empno");
		
		
		callist = caldao.getCalList(dept);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(callist);
		
		request.setAttribute("callist",callist);
		System.out.println("calist1111111"+callist);
		
	//	request.setAttribute("id", id);
		forward.setRedirect(false);  //주소 변경없이 jsp페이지의 내용을 보여줍니다.
		forward.setPath("/jhLee/calendar.jsp");
		return forward;
	}

}

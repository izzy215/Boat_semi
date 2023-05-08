package jhLee.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;


public class CalAllshow implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//	/project_calendarstart.cal":
		
		CalendarDAO caldao = new CalendarDAO();
		ActionForward forward = new ActionForward();

		
		JsonArray callist = null;
		String info = request.getParameter("dept");
		
		System.out.println("info= "+info);
		HttpSession session = request.getSession();
		
	session.setAttribute("dept",info);//request객체에 저장합니다.
		callist = caldao.getCalList();
		
		System.out.println(callist);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(callist);
		
		request.setAttribute("callist",callist);

		
	//	request.setAttribute("id", id);
		forward.setRedirect(false);  //주소 변경없이 jsp페이지의 내용을 보여줍니다.
		forward.setPath("/jhLee/calendar2.jsp");
		return forward;
		
	}

}

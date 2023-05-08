package jhLee.calendar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CaldeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CalendarDAO caldao = new CalendarDAO();
		String title = request.getParameter("title");
		
		 System.out.println("title"+title);
		 String empno = request.getParameter("empno");
		 System.out.println(empno);
		boolean result =false;
		
		
		
		 result = caldao.caldelelte(title,empno);
		 System.out.println(result);
		 
		 if(result ==true) {
			 System.out.println("++삭제 완료");
			 response.setContentType("text/html;charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.print(result);
		 }else if(result ==false){
				System.out.println("삭제 실패");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(result);
				
				return null;   
			}
		
		return null;
	}

}

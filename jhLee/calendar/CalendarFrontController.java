package jhLee.calendar;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.cal")
public class CalendarFrontController extends javax.servlet.http.HttpServlet {


	private static final long serialVersionUID = 1L;
    
	protected void doProcess(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
	
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " +RequestURI);
		
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " +contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		int a = 1;
		System.out.println("======작업하나 완료했습니다.======="+a);
		a++;
		
		//초기화
		ActionForward forward = null;
		Action action = null;
				switch(command) {
				
				case "/map.cal":
					action = new mapshow();
					break;
					
				case "/project_calendarstart.cal":
					action = new CalAllshow();
					break;
					
				case "/project_calendarallSave.cal":
					action = new CalAllsaveAction();
					break;
					
				case "/project_calendardelete.cal":
					action = new CaldeleteAction();
					break;
				
					//dept 확인 후 
				case "/project_calendarshow.cal":
					action = new CalShowAction();
					break;
				case "/project_calupdate.cal":
					action = new Calupdate();
					break;
					
				
				}//switch end
				
		forward = action.execute(request,response);
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				
				System.out.println("1"+forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request,response);
			}
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			doProcess(request,response);
	}
}

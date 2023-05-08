package jhLee.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/project_calendar.cal")
public class calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Calendarbean vo = new Calendarbean();
		
		//json파일을 변환 후 vo 객체에 담아서 dao에서 db insert 예정
		//session id 추가해야함
		//2. 본인 아이디의 캘린더만 보일건지 3.admin의 캘린더도 보여줄건지 정해야함
		//3. calendar 내에서 색 변화가능한지 확인 필요
		/*vo.setSchedule_code();
		vo.setEvent_name();
		vo.setStart_date();
		vo.setEnd_date();
		vo.setAllday();*/
		
		CalendarDAO dao = new CalendarDAO();
		System.out.println("확인");
		
		int result = dao.insert(vo);
		System.out.println(result);
		if(result ==1) {
			System.out.println("삽입성공");
			
		}else {
			System.out.println("삽입실패");
		}
		doGet(request,response);
		}
		
	}


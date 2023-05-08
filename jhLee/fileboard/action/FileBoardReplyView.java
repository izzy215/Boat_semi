package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;
import jhLee.fileboard.member.Member;

public class FileBoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// File_bo_reply.jsp
		
		ActionForward forward = new ActionForward();
		FileboBean filebo = new FileboBean();
		FileDAO filedao = new FileDAO();
		
		Member m = new Member();
		HttpSession session = request.getSession();
		String empno = (String) session.getAttribute("empno");
		m = filedao.memberinfo(empno);
		
		
		int num = Integer.parseInt(request.getParameter("num"));  
		
		filebo=filedao.getDetail(num);
		
		if(filebo==null) {
			System.out.println("글이 존재하지 않습니다.");
			forward.setRedirect(false);
			request.setAttribute("message", "글이 존재하지 않습니다.");
			forward.setPath("jhLee/error/error.jsp");
			return forward;
		}
		System.out.println("답변 페이지 이동 완료");
		
		request.setAttribute("boarddata", filebo);
		request.setAttribute("member", m);
		forward.setRedirect(false);
		forward.setPath("jhLee/file_board/File_bo_reply.jsp");
		return forward;
	}
	
	

}

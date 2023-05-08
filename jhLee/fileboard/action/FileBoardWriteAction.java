package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.member.Member;

public class FileBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//File_bo_Write.jsp
		HttpSession session = request.getSession();
		String empno = (String) session.getAttribute("empno");
		FileDAO mdao = new FileDAO();
		Member m = new Member();
		m = mdao.memberinfo(empno);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		request.setAttribute("member", m);
		forward.setPath("jhLee/file_board/File_bo_Write.jsp");
		return forward;
	}

}

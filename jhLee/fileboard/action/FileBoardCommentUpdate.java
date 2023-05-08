package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhLee.fileboard.db.FileboComBean;
import jhLee.fileboard.db.FileboComDAO;

public class FileBoardCommentUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FileboComDAO dao = new FileboComDAO();
		FileboComBean co = new FileboComBean();
		co.setF_CONTENT(request.getParameter("content"));
		System.out.println("content="+co.getF_CONTENT());
		
		co.setF_C_NUM(Integer.parseInt(request.getParameter("num")));
		
		int ok = dao.filecommentsUpdate(co);
		response.getWriter().print(ok);
		return null;
	}

}

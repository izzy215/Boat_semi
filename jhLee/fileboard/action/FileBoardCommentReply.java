package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhLee.fileboard.db.FileboComBean;
import jhLee.fileboard.db.FileboComDAO;

public class FileBoardCommentReply implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FileboComDAO dao = new FileboComDAO();
		FileboComBean co = new FileboComBean();
		
		co.setF_C_ID(request.getParameter("id"));
		co.setF_CONTENT(request.getParameter("content"));
		co.setF_COMMENT_NUM(Integer.parseInt(request.getParameter("comment_board_num")));
		co.setF_COMMENT_RE_LEV(Integer.parseInt(request.getParameter("comment_re_lev")));
		co.setF_COMMENT_RE_SEQ(Integer.parseInt(request.getParameter("comment_re_seq")));
		co.setF_COMMENT_RE_REF(Integer.parseInt(request.getParameter("comment_re_ref")));
		
		int ok = dao.filecommentsReply(co);
		response.getWriter().print(ok);
		return null;
	}

}

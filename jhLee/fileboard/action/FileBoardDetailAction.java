package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;

public class FileBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//File_bo_view.jsp
		
		FileboBean Filedata = new FileboBean();
		FileboBean Fileprev = new FileboBean();
		FileboBean Filenext = new FileboBean();
		FileDAO filedao = new FileDAO();
		
		int num =Integer.parseInt(request.getParameter("num"));
		String empno = request.getParameter("empno");
		
		filedao.setReadCountUpdate(num);
		Filedata = filedao.getDetail(num);
		
	
		Fileprev = filedao.getPrevDetail(num);
		Filenext = filedao.getNextDetail(num);
		
		if(Filedata ==null) {
			System.out.println("상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "데이터를 읽지 못했습니다.");
			forward.setPath("jhLee/error/error.jsp");
			return forward;
			
		}
		System.out.println("상세보기 성공");
		request.setAttribute("boarddata",Filedata);
		request.setAttribute("Fileprev",Fileprev);
		request.setAttribute("Filenext",Filenext);
		//request.setAttribute("empno",empno);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("jhLee/file_board/File_bo_view.jsp");
		return forward;
			}

}

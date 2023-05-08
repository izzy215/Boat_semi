package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;

public class FileBoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// File_bo_Update.jsp
		FileDAO boarddao = new FileDAO();
		FileboBean boarddata = new FileboBean();
		
		int num = Integer.parseInt(request.getParameter("num"));//get방식 주소창에서 가져옴
		boarddao.setReadCountUpdate(num);
		
		boarddata = boarddao.getDetail(num);
		
		System.out.println(boarddata);
		
		//boarddata = null;//error테스트를 위한 값설정
		//DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		
		if(boarddata ==null) {
			System.out.println("상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "데이터를 읽지 못했습니다");
			forward.setPath("jhLee/error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		System.out.println((boarddata.getFILE_CONTENT()));
		
		request.setAttribute("boarddata",boarddata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("jhLee/file_board/File_bo_update2.jsp");
		return forward;
	
	}


}

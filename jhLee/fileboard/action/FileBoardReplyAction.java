package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;
import jhLee.fileboard.member.Member;

public class FileBoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// File_bo_reply.jsp dao저장
		//파일게시판도 답글필요? 댓글만? 
		
		ActionForward forward = new ActionForward();
		FileboBean filebo = new FileboBean();
		FileDAO filedao = new FileDAO();
		
	
		
		String realFolder="";
		String saveFolder ="fileupload";
		int fileSize = 5*1024*1024; 
		
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder ="+realFolder);
		try {
			MultipartRequest multi = new MultipartRequest(
					request,
					realFolder,
					fileSize,
					"utf-8",
					new DefaultFileRenamePolicy()
					);
			
		int result = 0;
		System.out.println(multi.getParameter("board_pass"));
		filebo.setFIlE_EMPNO(multi.getParameter("empno"));
		filebo.setFILE_NAME(multi.getParameter("board_name"));
		filebo.setFILE_PASS(Integer.parseInt(multi.getParameter("board_pass").trim()));
		filebo.setFILE_SUBJECT(multi.getParameter("board_subject"));
		filebo.setFILE_CONTENT(multi.getParameter("board_content"));
		
		String filename = multi.getFilesystemName("board_file");
		filebo.setFILE_FILE(filename);
		
		String filename2 = multi.getFilesystemName("board_file2");
		filebo.setFILE_FILE2(filename2);
		
		filebo.setFILE_RE_REF(Integer.parseInt(multi.getParameter("board_re_ref")));
		filebo.setFILE_RE_LEV(Integer.parseInt(multi.getParameter("board_re_lev")));
		filebo.setFILE_RE_SEQ(Integer.parseInt(multi.getParameter("board_re_seq")));
		filebo.setDEPT(multi.getParameter("dept"));
		
		result = filedao.fileboReply(filebo);
		
		if (result == 0) {
			System.out.println("답변 저장 실패");
			forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "답변 저장 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;

		}
		//답변 저장이 제대로 된 경우
		System.out.println("답장 완료");
		forward.setRedirect(true);
		// 글 답변 페이지 경로 지정합니다.
		forward.setPath("FileBoadDetailAction.filebo?num="+result);
		return forward;
		}catch(IOException ex) {
			ex.printStackTrace();
			forward.setPath("jhLee/error/error.jsp");
			request.setAttribute("message", "게시판 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}//catch end
	}

}

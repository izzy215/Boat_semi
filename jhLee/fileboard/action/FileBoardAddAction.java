package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;

public class FileBoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FileboBean Filedata = new FileboBean();
		FileDAO filedao = new FileDAO();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		String saveFolder ="fileupload";
		int fileSize = 5*1024*1024; 
		
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder ="+realFolder);
		boolean result = false;
		try {
			MultipartRequest multi = new MultipartRequest(
					request,
					realFolder,
					fileSize,
					"utf-8",
					new DefaultFileRenamePolicy()
					);
			Filedata.setFIlE_EMPNO(multi.getParameter("empno"));
			Filedata.setFILE_NAME(multi.getParameter("board_name"));
			Filedata.setFILE_PASS(Integer.parseInt(multi.getParameter("board_pass")));
			Filedata.setFILE_SUBJECT(multi.getParameter("board_subject"));
			Filedata.setFILE_CONTENT(multi.getParameter("board_content"));
			//시스템 상에 업로드된 실제 파일명
			String filename = multi.getFilesystemName("board_file");
			Filedata.setFILE_FILE(filename);
			
			String filename2 = multi.getFilesystemName("board_file2");
			Filedata.setFILE_FILE2(filename2);
			Filedata.setDEPT(multi.getParameter("dept"));
			//두개 넣을 수 있나요?
			
			result = filedao.fileboardInsert(Filedata);
			
			System.out.println(result);
			
			if(result ==false) {
				System.out.println("게시판 등록 실패");
				forward.setPath("jhLee/error/error.jsp");
				request.setAttribute("message", "게시판 등록 실패입니다.");
				forward.setRedirect(false);
				return forward;
				
			}
			System.out.println("게시판 등록 완료");
			
			//글 등록이 완료되면 글 목록을 보여주기 위해 "BoardList.bo로 이동
			//Redirect여부true설정
			forward.setRedirect(true);
			forward.setPath("FileBoardList.filebo");
			return forward;

		}catch(IOException ex) {
			ex.printStackTrace();
			forward.setPath("jhLee/error/error.jsp");
			request.setAttribute("message", "게시판 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}//catch end
	}//execute end

}

		// File_bo_Write.jsp
	
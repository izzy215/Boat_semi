package jhLee.fileboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;


public class FileBoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//  File_bo_Update.jsp 의 내용 저장 (file저장도 필요함)
		FileDAO boarddao = new FileDAO();
		FileboBean boarddata = new FileboBean();
		ActionForward forward = new ActionForward();
		String realFolder ="";
		
		String saveFolde="fileupload";
		
		int fileSize = 5 *1024 *1024;//업로드 할 파일의 최대 사이즈 입니다. 5MB
		//실제 저장 경로
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolde);
		System.out.println("realFolder="+realFolder);
		boolean result = false;
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(request,realFolder,fileSize,"utf-8",
							new DefaultFileRenamePolicy());
				
			int num = Integer.parseInt(multi.getParameter("board_num"));
			String pass = multi.getParameter("board_pass");
			System.out.println("수정한 페이지에서 입력한 비밀번호"+pass);
			
			boolean usercheck = boarddao.isBoardWriter(num,pass);
			
			if(usercheck ==false) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
			
			//비밀전호가 일치하는 경우 수정 내용을 설정합니다.
			//BOARDBEAN객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
			boarddata.setFILE_NUM(num);
			
			boarddata.setFIlE_EMPNO(multi.getParameter("empno"));
			boarddata.setFILE_SUBJECT(multi.getParameter("board_subject"));
			boarddata.setFILE_CONTENT(multi.getParameter("board_content"));
			boarddata.setDEPT(multi.getParameter("dept"));
			
			String check = multi.getParameter("check");
			System.out.println("check="+check);
			String check2 = multi.getParameter("check2");
			
			if(check !=null){
				boarddata.setFILE_FILE(check);
				}else {
					//업로드된 파일의 시스템상에 업로든된 실제 파일명을 얻어 옵니다.
					String filename =multi.getFilesystemName("board_file");
					boarddata.setFILE_FILE(filename);
				}
			
			if(check2 !=null){
				boarddata.setFILE_FILE2(check2);
			}else {
				//업로드된 파일의 시스템상에 업로든된 실제 파일명을 얻어 옵니다.
				String filename =multi.getFilesystemName("board_file2");
				boarddata.setFILE_FILE2(filename);
			}
			//DAO에서 수정 메서드 호출하여 수정합니다.
			result = boarddao.boardModify(boarddata);
		
			//수정에 실패한 경우
			if(result==false) {
				System.out.println("게시판 수정 실패");
				forward.setRedirect(false);
				request.setAttribute("message","게시판 수정이 되지 않았습니다.");
				forward.setPath("error/error.jsp");
				return forward;
			
			}
			//수정이 성공일 경우
			System.out.println("게시판 수정이 완료되었습니다.");
			
			forward.setRedirect(true);
			//수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
			forward.setPath("FileBoadDetailAction.filebo?num="+boarddata.getFILE_NUM());
			return forward;
			
		}catch(IOException e) {
			e.getStackTrace();
			forward.setPath("error/error.jsp");
			request.setAttribute("message","게시판 업로드 중 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
		

}
}
package jhLee.fileboard.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.filebo")
public class FileBoardFrontController extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);

		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);

		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		int a = 1;
		System.out.println("======작업하나 완료했습니다.=======" + a);
		a++;

		// 초기화
		ActionForward forward = null;
		Action action = null;
		switch (command) {
		
		case "/FileBoardList.filebo":
			action = new FileBoardListAction();
			break;
			
		case "/FileBoardWrite.filebo":
			action = new FileBoardWriteAction();
			break;
		
		case "/FileBoardAddAction.filebo":
			action = new FileBoardAddAction();
			break;
		
		case "/FileBoadDetailAction.filebo":
			action = new FileBoardDetailAction();
			break;
		
		case "/FileBoardModifyView.filebo":
			action = new FileBoardModifyView();
			break;
		case "/FileBoardModifyAction.filebo":
			action = new FileBoardModifyAction();
			break;
		
		case "/FileBoardDownAction.filebo":
			action = new FileBoardDownAction();
			break;
		
		case "/FileBoardReplyView.filebo":
			action = new FileBoardReplyView();
			break;
		
		case "/FileBoardReplyAction.filebo":
			action = new FileBoardReplyAction();
			break;
		
		case "/FileBoardDeleteAction.filebo":
			action = new FileBoardDeleteAction();
			break;

		
		case "/FileCommentAdd.filebo":
			action = new FileBoardCommentAdd();
			break;
		
		case "/FileCommentList.filebo":
			action = new FileBoardCommentList();
			break;
		
		case "/FileCommentDelete.filebo":
			action = new FileBoardCommentDelete();
			break;
		
		case "/FileCommentUpdate.filebo":
			action = new FileBoardCommentUpdate();
			break;
		
		case "/FileCommentReply.filebo":
			action = new FileBoardCommentReply();
			break;

		}// switch end
		System.out.println("1");
		forward = action.execute(request, response);

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("1" + forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}

}

//http://localhost:8088/Boat/FileBoardList.filebo
package jhLee.fileboard.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import jhLee.fileboard.db.FileDAO;
import jhLee.fileboard.db.FileboBean;

public class FileBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	FileDAO boarddao = new FileDAO();
	List<FileboBean> filebolist = new ArrayList<FileboBean>();
	int listcount = boarddao.getListcount();

	int page = 1;
	int limit = 10; 
	if(request.getParameter("page")!=null){
		page = Integer.parseInt(request.getParameter("page"));
	}
	if(request.getParameter("limit")!=null) {
		limit = Integer.parseInt(request.getParameter("limit"));
	}
	
	String state = request.getParameter("state");
	//state ="ajax";
	System.out.println("state="+state);
	
	
	System.out.println("글의 갯수는 = "+ listcount);

	filebolist = boarddao.getfileBoardList(page,limit);
	
	int maxpage = (listcount+limit -1)/limit;
	System.out.println("총페이지수 = "+ maxpage);
		
	int startpage = ((page-1)/10)*10+1;
	
	int endpage = startpage+10-1;
	System.out.println("endpage= "+maxpage);
	
	if(endpage>maxpage)
		endpage = maxpage;
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    cal.add(Calendar.DAY_OF_MONTH, -3); //3일간 보이도록 하기위해서.
    String nowday = format.format(cal.getTime());
       
    
	
	
	if(state ==null) {
	
		
		//System.out.println(limit);
		//System.out.println("state ==null");
		request.setAttribute("page", page);//현재 페이지 수 
		request.setAttribute("maxpage", maxpage);
		
		//현재 페이지에 표시할 첫 페이지 수 
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		//현제 페이지에 표시할 끝 페이지 수 
		request.setAttribute("listcount", listcount);
		
		//해당 페이지의 글 목록을 갖고 있는 리스트
		request.setAttribute("boardlist", filebolist);
		
		request.setAttribute("limit", limit);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
	
     
        //System.out.println("nowday=" + nowday);
        request.setAttribute("nowday",nowday);
        
		
		//글 목록 페이지로 이동하기 위해 경로 를 설정합니다.
		forward.setPath("/jhLee/file_board/File_bo_List.jsp");
		return forward;
	
	
		}else {
			
		System.out.println("state = ajax");
		
		JsonObject object = new JsonObject();
		
	
		
		String dept="";  
		String dept_ =request.getParameter("dept").trim();
		if(dept_.equals("")||dept_.equals("전체")) {
			 dept = "";
		}else {
			
			dept =" and dept = '"+dept_+ "' ";
		}
			object.addProperty("dept", dept);
			
		 String searchsel =request.getParameter("searchsel").trim();
		 System.out.println(searchsel);
			if(searchsel.equals("작성자")) {
				searchsel="FILE_NAME";
			}else {
				searchsel="FILE_SUBJECT";
			}
		object.addProperty("searchsel", searchsel);
	
		String searchinput = request.getParameter("searchinput");
	    String order = request.getParameter("order"); //최신순조회순댓글순 asc desc 쿼리
	    
	    if(order.equals("정렬")){
	    	order = " order by  FILE_RE_REF desc , FILE_RE_SEQ asc ";
	    }else if(order.equals("최신순")) {
	    	order = "order by  "
	    			+ "FILE_DATE desc ";
	    }else if(order.equals("조회순")) {
	    	
	    		order="order by FILE_READCOUNT desc ";
	    		
	    }else if(order.equals("댓글순")){
	    	
	    		order="order by CNT desc ";
	    				
	    		
	   	}
		object.addProperty("order", order);
		object.addProperty("searchinput", searchinput);
			
		System.out.println("dept :"+ dept);
		System.out.println("searchsel :"+ searchsel);
		System.out.println("searchinput"+ searchinput);
		System.out.println("order :"+ order);
		
	    listcount = boarddao.getListcount(dept,searchsel,searchinput);
	    System.out.println("ajax사용 후 listcount : "+listcount);
		filebolist = boarddao.getList(dept,searchsel,searchinput,order,page,limit);
		
		
		System.out.println("listcount :"+ listcount);


		 maxpage = (listcount+limit -1)/limit;
		 System.out.println("총페이지수 = "+ maxpage);
				
		 startpage = ((page-1)/10)*10+1;
			
		 endpage = startpage+10-1;
		 System.out.println("endpage= "+maxpage);
			
		if(endpage>maxpage)
			endpage = maxpage;
			

		
		
		object.addProperty("page", page);//{"page":변수page의 값}형식으로 저장
		object.addProperty("maxpage",maxpage);
		object.addProperty("startpage",startpage);
		object.addProperty("endpage", endpage);
		object.addProperty("listcount",listcount);
		object.addProperty("limit", limit);
		//System.out.println("11111111"+nowday);
		object.addProperty("nowday",nowday);
		
		//ㅣList => JsonElement
		JsonElement je = new Gson().toJsonTree(filebolist);
		System.out.println("boardlist = "+je.toString());
		object.add("boardlist", je);
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(object);
		System.out.println("ajax보내는것들"+object.toString());
	
		return null;
	}//else end
		
	
}//execute end

}//class end
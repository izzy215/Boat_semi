package jhLee.fileboard.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileBoardDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("filename");
		System.out.println("fileName=" +fileName);
		
		String savePath = "fileupload";
		
		//서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다.
		ServletContext context = request.getSession().getServletContext();
		String sDownloadPath = context.getRealPath(savePath);
		
		//String sFilePath = sDownloadPath+"\\"+fileName;
		//"\"추가하기 위해 "\\" 사용합니다.
		
		String sFilePath = sDownloadPath +"\\" +fileName;
		System.out.println(sFilePath);
		
		byte b[] = new byte[4096];
		
		//sFilePath에 있는 파일의 MimeType을 구해옵니다.
		String sMimeType = context.getMimeType(sFilePath);
		System.out.println("sMimeType >>>>" + sMimeType);
		
		
		
		/*
		 octet-stream 은 8비트로 된 데이터를 의미히며 지정되지 않은 팡일 형식을 의미합니다.
		 * */
		if(sMimeType ==null)
			sMimeType = "application/octet-stream";
		
		response.setContentType(sMimeType);
		
	
		
		String sEncoding = new String(fileName.getBytes("utf-8"),"ISO-8859-1");
		System.out.println(sEncoding);
		 
		
		response.setHeader("Content-Disposition","attachment; filename ="+ sEncoding);
//		response.setHeader("Content-Disposition","inline; filename ="+ sEncoding);
		//브라우저에 바로 뜸
	//=====================================================//
				
		try(
				//웹 브라우저로의 출력 스트림 생성합니다.
				BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());
				//sFilePath로 지정한 파일에 대한 입력 스트림을 생성합니다.
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(sFilePath));
				
				
				){
			
			int numRead;
			
			//read(b,0,b.length):바이트 배열 b의 0번부터 b.length 크기만큼 읽어옵니다.
			while((numRead = in.read(b,0,b.length))!= -1) {//읽을 데이터가 존재하는 경우
				out2.write(b,0,numRead);//바이트 배열 b의 0번부터 numRead 크기만큼 브라우저로 출력
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}		
		
		
		return null;
	}
}

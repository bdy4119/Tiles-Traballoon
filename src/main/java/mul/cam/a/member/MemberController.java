package mul.cam.a.member;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import mul.cam.a.dto.MemberDto;
import mul.cam.a.service.MemberService;

@Controller
public class MemberController {
	// service 접근(생성)
	@Autowired
	MemberService service;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		//	System.out.println("MemberController login " + new Date());

		return "login";
	}
	@GetMapping(value = "mypageReference.do")
	public String mypageReference(HttpSession session, Model model) {
		 System.out.println("MypageController mypageAf " + new Date());
		
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		
		return "mypageReference";
	}
	@GetMapping(value = "mypageAf.do")
	public MemberDto mypageAf(HttpSession session, Model model) {
		// System.out.println("MypageController mypageAf " + new Date());
		
		String id = (String) session.getAttribute("id");
		MemberDto info = service.info(id);
		

		model.addAttribute("info", info);
		model.addAttribute("id", id);
		return info;
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		//	System.out.println("MemberController regi " + new Date());

		return "regi";
	}

	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		//	System.out.println("MemberController idcheck " + new Date());

		boolean isS = service.idCheck(id);
		if(isS == true) {	// id가 있음
			return "NO";
		}

		return "YES";	// id가 없음
	}

	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(Model model, MemberDto dto) {
		//	System.out.println("MemberController regiAf " + new Date());
		
		// 성공적으로 진행 되었다면 참거짓 isS 로 반환
		// xml -> 1rows affected -> 1를 가지고 dao -> insertinto 를통해 데이터의 영향이 
		boolean isS = service.addMember(dto); 	// 데이터의 영향이 있었는지에 대해 판단
		// 이후로 다오는 상관x 
		String message = "";
		// true 일때(추가가 성공했을때) message 를 ADD_YES 로 바꾼다 
		if(isS) {
			message = "MEMBER_ADD_YES";		//추가된게 맞다면 성공메세지 
		}else {
			message = "MEMBER_ADD_NO"; // 추가가 되지않았다.			table 에 데이터를 추가. 그것의 반환이 숫자 cru는 숫자값을 반환
		}
		model.addAttribute("message", message);
		
		return "message";		//mess
	}
	
	@RequestMapping(value = "deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(Model model,String id) {
		System.out.println("membercontroller deletemember " + new Date());
		// isS 가 데이터의 변동으로 인해서 0보다 커졌느냐 를 묻고 (service에서)
		// 0보다 커지면 true이기때문에 
		boolean isS = service.deleteMember(id);
		
		String deleteMember="";
		
		if(isS) {	// true일때 delmem 에 DELETE_MEMBER_OK를 담아주
			deleteMember ="DELETE_MEMBER_OK";
		}else {
			deleteMember ="DELETE_MEMBER_NO";
		}
		System.out.println(deleteMember);
		model.addAttribute("deleteMember", deleteMember);	// delMem을 포장해서
		return "message";		// message.jsp 로 출장 
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String login(HttpSession session, Model model, MemberDto dto) {
		//	System.out.println("MemberController login " + new Date());
				//id pwd 
		MemberDto login = service.login(dto);
		String msg = "";
		if(login != null) {	// login 성공
			session.setAttribute("login", login);
			session.setAttribute("id", dto.getId());
			session.setAttribute("nickname", dto.getNickname());
			//	req.getSession().setMaxInactiveInterval(60 * 2);
		
			msg = "LOGIN_OK";
		}else {				// login 실패
			msg = "LOGIN_FAIL";
		}
		model.addAttribute("login", msg);

		return "message";
	}

	@RequestMapping(value = "sessionOut.do", method = RequestMethod.GET)
	public String sessionOut(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();

		String sessionOut = "logout";
		
		model.addAttribute("sessionOut", sessionOut);
		// web-inf/views/message.jsp
		return "message";
		
	}
	
	@PostMapping(value = "updateMember.do")
	public String updateMember(HttpSession session, Model model,MemberDto dto) {
		System.out.println("membercontroller updateMember " + new Date());
		// service에서 boolean 으로 판단된 값을 isS에 담아준다
		boolean isS = service.updateMember(dto);
		// 수정된 db의 세션값을 다시 가져온 것 
		MemberDto login = service.login(dto);
		System.out.println(login);
				
		session.setAttribute("nickname", dto.getNickname());
		session.setAttribute("phonenumber", dto.getPhonenumber());
		session.setAttribute("address", dto.getAddress());
		session.setAttribute("email", dto.getEmail());
		session.setAttribute("pwd", dto.getPwd());
		
		// isS가 판단된 이후에 model로 포장해서 받을 컨테이너 생성
		String updateMember = "";
		
		if(isS) {
			// dao에서 int 로 받은 updateMember의 데이터의 변동이 있을때 (추가가 되었을때) service에서 추가가 되었는지를 판단한후 controller에서 너희가 추가해서 왔다고 했는데 맞느냐를 한번더 따져본 후 
			// 지정한 빈문자열에 긍정적인 답변 OK를 준다 			
			updateMember = "UPDATE_MEM_OK";
		}else {
			updateMember = "UPDATE_MEM_FAIL";
		}
		System.out.println(updateMember);
		// 모델로 포장
		model.addAttribute("updateMember", updateMember);
		// go to message.jsp
		return "message";
	}
	
	
	
	// 모델로 리스트 뿌리기
	// 모델과 세션은 용도가 비슷 
	// 모델은 행선지가 정해져있다
	// 세션은 행선지 미정
	@GetMapping(value = "allMember.do")
	public String allMember(Model model) {
		List<MemberDto> list = service.allMember();
		// 모델에 List를 넣어서 보냄
		model.addAttribute("list", list);
		
		return "mypageAf"; // 짐싸서 보낸다 행선지를 정하는것은 return;
	}
	
	// getmapping 으로 보내기로했는데 약속이 깨진다. 
	
//	@ResponseBody	// view 와 컨트롤러끼리 통신한다 화면변화없이 ajax 할때 필요  
//	@GetMapping(value = "allMember.do")
//	public List<MemberDto> allMember(String id) {
//		List<MemberDto> list = service.allMember();
//		return list;	// 모델에 List를 넣어서 보냄
////		return service.allMember(); // service.allMember()가 필요한 곳에서 호출한다
//	}	// 어떤 view에서든 allMember.do 를 호출하면 여기로옴
		// view에서 호출하면 리턴값을 준다 . 
	
	
//	@GetMapping(value = "NewFile.do")
//		public String NewFile() {
//		return "NewFile";
//	}
	
	
	
	// ajax는 값을 보내는게아니라 결과를 보낸다
}











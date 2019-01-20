package com.map.board;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.map.Sha256.SHA256;
import com.map.join.joinVO;
import com.map.joinBiz.joinBiz;

@Controller
public class HomeController {
	// 값주입
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping("test.do")
	public String test() {
		return "test";
	}
	//주소록
	@RequestMapping(value="addressForm.do")
	public String addressForm() {
		return "address";
	}
	@RequestMapping(value = "main.do")
	public String main() {
		return "main";
	}

	// 로그인 성공시 들어갈 메인
	@RequestMapping(value = "main2.do")
	public String main2(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email_login");
		model.addAttribute("email", email);
		return "main2";
	}

	// 로그아웃
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.setAttribute("email_login", null);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println("<script>alert('다음에 또 방문해주세요');</script>");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
		}
		return "main";
	}

	// mailForm
	@RequestMapping(value = "mailForm.do")
	public String mailForm() {

		return "mailForm";
	}

	// mailSending 코드
	@RequestMapping(value = "mailSending.do", method = RequestMethod.POST)
	public String mailSending(Model model, MultipartHttpServletRequest multi) {

		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 파일경로
		String path = "";
		try {
			path = WebUtils.getRealPath(multi.getSession().getServletContext(), "/storage");
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		System.out.println(path);
		// 파일들을 List형식으로 보관
		List<MultipartFile> files = multi.getFiles("files");

		File file = new File(path);
		// 파일이 없다면 디렉토리를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		// 메일보내기기능
		String setfrom = "jea830@hanmail.net";
		String tomail = multi.getParameter("tomail"); // 받는 사람 이메일
		String title = multi.getParameter("title"); // 제목
		String content = multi.getParameter("content"); // 내용
		File filename = null;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			for (int i = 0; i < files.size(); i++) {
				inputStream = files.get(i).getInputStream();
				System.out.println(files.get(i).getOriginalFilename() + " 업로드");
				filename = new File(path + "/" + files.get(i).getOriginalFilename());
				if (!filename.exists()) {
					filename.createNewFile();
				}
				outputStream = new FileOutputStream(filename);
				int read = 0;
				byte[] b = new byte[(int) files.get(i).getSize()];

				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}
				// 파일첨부
				FileSystemResource fsr = new FileSystemResource(filename);
				messageHelper.addAttachment(MimeUtility.encodeText(files.get(i).getOriginalFilename(), "UTF-8", "B"),
						fsr);
			}

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용-

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		return "suc";
	}

//--------------------	  회원가입
	@Autowired
	private joinBiz biz;

	@RequestMapping(value = "joinform.do")
	public String joinform() {

		return "joinform";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(joinVO dto, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("dto에 담겨진 이름" + dto.getMembers_name());
		int join_chek = biz.joinCheck(dto.getMembers_email(), dto.getMembers_pw());
		System.out.println("체크체크 : " + join_chek);
		System.out.println("dto에 넣어졌는지 확인" + dto.getMembers_name() + dto.getMembers_email() + dto.getMembers_pw());
		if (join_chek == 1) {// 메퍼에서 sql문이 성공하면 1을 반환하지만, 실패하면 0 (중복이 없어야하기에 0이면 처리하도록함)
			System.out.println("값주입가능");
			int join_insert = biz.joinInsert(dto);// jsp에서 받은값 인서트
			if (join_insert == 0) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('가입처리오류');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out.flush();
				}
				return "joinform";// 실패시 다시 회원가입창으로
			} else if (join_insert == 1) { // 성공했다는 것을 알리기 위해 1이 보내질거임
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				String to = dto.getMembers_email();
				String host = "http://localhost:8787/board/";
				String setfrom = "jea830@hanmail.net";
				String tomail = dto.getMembers_email(); // 받는 사람 이메일
				String title = "[투메일] 안녕하세요 인증메일이 도착했어요!"; // 제목
				String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "join_email_complate.do?join_code="
						+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>"; // 내용
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content, true); // html이라는 의미로 true를 써준다.
				mailSender.send(message);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
				PrintWriter out_p = null;
				try {
					out_p = response.getWriter();
					out_p.println("<script>alert('인증 메일을 보냈어요!');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out_p.flush();
				}
				session.setAttribute("join_email", to);
				return "main";
			}
		} else if (join_chek == 0) {// 중복에러
			System.out.println("중복됐어요!!!");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('이미 가입하신 정보입니다');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			return "joinform";
		}
		return "joinform";
	}

	@RequestMapping(value = "join_email_complate.do")
	public String join_email_complate(HttpServletRequest request, HttpSession session, Model model,
			HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("join_code");
		String session_mail = (String) session.getAttribute("join_email");
		try {
			boolean rightCode = (new SHA256().getSHA256(session_mail).equals(code)) ? true : false;
			if (rightCode == true) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('인증이 완료되었습니다.');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out.flush();
				}
				biz.pass_complate(session_mail);
				model.addAttribute("email", session_mail);
				return "main2";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.setAttribute("join_email", null);
		}
		return "error"; // 절대 잘못된 코드가 올일이 없지만.. 만약 잘못온다면 에러창을 띄우게 해준다.
	}

	// ---------------------로그인
	@RequestMapping(value = "loginform.do")
	public String loginform() {
		return "login";
	}

	@RequestMapping(value = "login.do")
	public @ResponseBody HashMap<String, Object> login(@RequestBody joinVO dto, HttpSession session) throws Exception {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		System.out.println("로그인 유지 체크 여부" + dto.getLogin_check());
		System.out.println("내가보낸 비번값 : " + dto.getMembers_pw());
		int res = biz.loginSelect(dto.getMembers_email(), dto.getMembers_pw());
		System.err.println("성공앤 실패 : " + res);
		 String mail_ck = biz.mail_check(dto.getMembers_email());
			System.out.println(mail_ck+"뭐지,,,,,");
		if ("true".equals(mail_ck)) {
			if (res == 0) {
				System.out.println("로그인 실패");
				hashmap.put("login_false", res);
			} else if (res == 1) {
				System.out.println("로그인 성공");
				session.setAttribute("email_login", dto.getMembers_email());
				hashmap.put("login_true", res);
			}
			 hashmap.put("mail_checked", mail_ck);
		} else if ("false".equals(mail_ck)) {
			hashmap.put("mail_ck_false", mail_ck);
		} else{
			System.out.println("로그인 실패실패");
			hashmap.put("login_false", 0);
		}
		return hashmap;
	}

	// ---------------비밀번호 체크
	@RequestMapping(value = "password.do")
	public String pass() {
		return "password_ck";
	}

	@RequestMapping(value = "pass.do")
	public String pass_ck(joinVO dto, HttpSession session, Model model, HttpServletResponse response) throws Exception {
		int res = biz.pass_ck(dto.getMembers_email());

		if (res == 1) {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			System.out.println("이메일 존재" + res);
			String to = dto.getMembers_email();
			String host = "http://localhost:8787/board/";
			String setfrom = "jea830@hanmail.net";
			String tomail = dto.getMembers_email(); // 받는 사람 이메일
			String title = "[투메일] 비밀번호를 새로 설정하세요"; // 제목
			String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "email_complate.do?code="
					+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>"; // 내용
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // html이라는 의미로 true를 써준다.
			mailSender.send(message);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일을 확인해주세요'); location.href='password.do';</script>");
			out.flush();
			session.setAttribute("email", dto.getMembers_email());
		} else if (res == 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('메일 정보가 잘못됐어요');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			model.addAttribute("mail_n", res);
			return "password_ck";
		}
		return "password_ck";
	}

	@RequestMapping(value = "email_complate.do")
	public String mail_com(HttpServletRequest request, HttpSession session, Model model, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String session_mail = (String) session.getAttribute("email");
		boolean rightCode = (new SHA256().getSHA256(session_mail).equals(code)) ? true : false;
		if (rightCode == true) {// 인증코드와 같다면..
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('인증해주셔서 감사합니다.');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			model.addAttribute("email", session_mail);
			return "pass_change";
		} else {// 여기까지 올일은 없을듯
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('잘못된 인증이에요!');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			return "password_ck";
		}
	}

	@RequestMapping(value = "pass_change_ck.do")
	public String pass_change_ck(joinVO dto, HttpSession session, HttpServletResponse response, Model model) {
		int result = biz.pass_change(dto);
		if (result == 1) {// 비밀번호가 잘바뀌면
			session.setAttribute("email", null);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('이젠 꼭 기억하세요!');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			System.out.println(result);
			return "main";
		} else { // 여기까지 올일은 없지만 혹시..안되면
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('패스워드 오류..다시적어주세요');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			String email = (String) session.getAttribute("email");
			model.addAttribute("email", email);
			return "pass_change";
		}
	}
}

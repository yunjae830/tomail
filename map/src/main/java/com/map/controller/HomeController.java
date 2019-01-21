package com.map.controller;

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
import com.map.biz.joinBiz;
import com.map.domain.joinVO;

@Controller
public class HomeController {
	// ������
	
	@Autowired(required=false)
	private JavaMailSender mailSender;
	
	@Autowired
	joinBiz join;
	
	@RequestMapping("test.do")
	public String test() {
		return "test";
	}
	//�ּҷ�
	@RequestMapping(value="addressForm.do")
	public String addressForm() {
		return "address";
	}
	@RequestMapping(value = "main.do")
	public String main() {
		return "main";
	}

	// �α��� ������ �� ����
	@RequestMapping(value = "main2.do")
	public String main2(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email_login");
		model.addAttribute("email", email);
		return "main2";
	}

	// �α׾ƿ�
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.setAttribute("email_login", null);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println("<script>alert('������ �� �湮���ּ���');</script>");
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

	// mailSending �ڵ�
	@RequestMapping(value = "mailSending.do", method = RequestMethod.POST)
	public String mailSending(Model model, MultipartHttpServletRequest multi) {

		InputStream inputStream = null;
		OutputStream outputStream = null;

		// ���ϰ��
		String path = "";
		try {
			path = WebUtils.getRealPath(multi.getSession().getServletContext(), "/storage");
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		System.out.println(path);
		// ���ϵ��� List�������� ����
		List<MultipartFile> files = multi.getFiles("files");

		File file = new File(path);
		// ������ ���ٸ� ���丮�� ����
		if (file.exists() == false) {
			file.mkdirs();
		}
		// ���Ϻ�������
		String setfrom = "jea830@hanmail.net";
		String tomail = multi.getParameter("tomail"); // �޴� ��� �̸���
		String title = multi.getParameter("title"); // ����
		String content = multi.getParameter("content"); // ����
		File filename = null;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			for (int i = 0; i < files.size(); i++) {
				inputStream = files.get(i).getInputStream();
				System.out.println(files.get(i).getOriginalFilename() + " ���ε�");
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
				// ����÷��
				FileSystemResource fsr = new FileSystemResource(filename);
				messageHelper.addAttachment(MimeUtility.encodeText(files.get(i).getOriginalFilename(), "UTF-8", "B"),
						fsr);
			}

			messageHelper.setFrom(setfrom); // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ������ �����ϴ�
			messageHelper.setText(content); // ���� ����-

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

//--------------------	  ȸ������
	@Autowired
	private joinBiz biz;

	@RequestMapping(value = "joinform.do")
	public String joinform() {

		return "joinform";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(joinVO dto, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("dto�� ����� �̸�" + dto.getMembers_name());
		int join_chek = biz.joinCheck(dto.getMembers_email(), dto.getMembers_pw());
		System.out.println("üũüũ : " + join_chek);
		System.out.println("dto�� �־������� Ȯ��" + dto.getMembers_name() + dto.getMembers_email() + dto.getMembers_pw());
		if (join_chek == 1) {// ���ۿ��� sql���� �����ϸ� 1�� ��ȯ������, �����ϸ� 0 (�ߺ��� ������ϱ⿡ 0�̸� ó���ϵ�����)
			System.out.println("�����԰���");
			int join_insert = biz.joinInsert(dto);// jsp���� ������ �μ�Ʈ
			if (join_insert == 0) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('����ó������');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out.flush();
				}
				return "joinform";// ���н� �ٽ� ȸ������â����
			} else if (join_insert == 1) { // �����ߴٴ� ���� �˸��� ���� 1�� ����������
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				String to = dto.getMembers_email();
				String host = "http://localhost:8787/board/";
				String setfrom = "jea830@hanmail.net";
				String tomail = dto.getMembers_email(); // �޴� ��� �̸���
				String title = "[������] �ȳ��ϼ��� ���������� �����߾��!"; // ����
				String content = "���� ��ũ�� �����Ͽ� �̸��� Ȯ���� �����ϼ���." + "<a href='" + host + "join_email_complate.do?join_code="
						+ new SHA256().getSHA256(to) + "'>�̸��� �����ϱ�</a>"; // ����
				messageHelper.setFrom(setfrom); // �����»�� �����ϰų� �ϸ� �����۵��� ����
				messageHelper.setTo(tomail); // �޴»�� �̸���
				messageHelper.setSubject(title); // ���������� ������ �����ϴ�
				messageHelper.setText(content, true); // html�̶�� �ǹ̷� true�� ���ش�.
				mailSender.send(message);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
				PrintWriter out_p = null;
				try {
					out_p = response.getWriter();
					out_p.println("<script>alert('���� ������ ���¾��!');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out_p.flush();
				}
				session.setAttribute("join_email", to);
				return "main";
			}
		} else if (join_chek == 0) {// �ߺ�����
			System.out.println("�ߺ��ƾ��!!!");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('�̹� �����Ͻ� �����Դϴ�');</script>");
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
				response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('������ �Ϸ�Ǿ����ϴ�.');</script>");
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
		return "error"; // ���� �߸��� �ڵ尡 ������ ������.. ���� �߸��´ٸ� ����â�� ���� ���ش�.
	}

	// ---------------------�α���
	@RequestMapping(value = "loginform.do")
	public String loginform() {
		return "login";
	}

	@RequestMapping(value = "login.do")
	public @ResponseBody HashMap<String, Object> login(@RequestBody joinVO dto, HttpSession session) throws Exception {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		System.out.println("�α��� ���� üũ ����" + dto.getLogin_check());
		System.out.println("�������� ����� : " + dto.getMembers_pw());
		int res = biz.loginSelect(dto.getMembers_email(), dto.getMembers_pw());
		System.err.println("������ ���� : " + res);
		 String mail_ck = biz.mail_check(dto.getMembers_email());
			System.out.println(mail_ck+"����,,,,,");
		if ("true".equals(mail_ck)) {
			if (res == 0) {
				System.out.println("�α��� ����");
				hashmap.put("login_false", res);
			} else if (res == 1) {
				System.out.println("�α��� ����");
				session.setAttribute("email_login", dto.getMembers_email());
				hashmap.put("login_true", res);
			}
			 hashmap.put("mail_checked", mail_ck);
		} else if ("false".equals(mail_ck)) {
			hashmap.put("mail_ck_false", mail_ck);
		} else{
			System.out.println("�α��� ���н���");
			hashmap.put("login_false", 0);
		}
		return hashmap;
	}

	// ---------------��й�ȣ üũ
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
			System.out.println("�̸��� ����" + res);
			String to = dto.getMembers_email();
			String host = "http://localhost:8787/board/";
			String setfrom = "jea830@hanmail.net";
			String tomail = dto.getMembers_email(); // �޴� ��� �̸���
			String title = "[������] ��й�ȣ�� ���� �����ϼ���"; // ����
			String content = "���� ��ũ�� �����Ͽ� �̸��� Ȯ���� �����ϼ���." + "<a href='" + host + "email_complate.do?code="
					+ new SHA256().getSHA256(to) + "'>�̸��� �����ϱ�</a>"; // ����
			messageHelper.setFrom(setfrom); // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ������ �����ϴ�
			messageHelper.setText(content, true); // html�̶�� �ǹ̷� true�� ���ش�.
			mailSender.send(message);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�̸����� Ȯ�����ּ���'); location.href='password.do';</script>");
			out.flush();
			session.setAttribute("email", dto.getMembers_email());
		} else if (res == 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('���� ������ �߸��ƾ��');</script>");
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
		if (rightCode == true) {// �����ڵ�� ���ٸ�..
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('�������ּż� �����մϴ�.');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			model.addAttribute("email", session_mail);
			return "pass_change";
		} else {// ������� ������ ������
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('�߸��� �����̿���!');</script>");
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
		if (result == 1) {// ��й�ȣ�� �߹ٲ��
			session.setAttribute("email", null);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('���� �� ����ϼ���!');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out.flush();
			}
			System.out.println(result);
			return "main";
		} else { // ������� ������ ������ Ȥ��..�ȵǸ�
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // �ѱ۱��� ����
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("<script>alert('�н����� ����..�ٽ������ּ���');</script>");
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

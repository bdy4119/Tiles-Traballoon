/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-26 06:17:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.loginScreen;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class message_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("	");

	String message = (String) request.getAttribute("message"); //model 로 받은 짐 푼다
	
	if (message != null && !message.equals("")) {
		// 메세지가 MEMBER_ADD_YES 입니까?
		if (message.equals("MEMBER_ADD_YES")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"성공적으로 가입되었습니다\");\n");
      out.write("		location.href = \"login.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"가입되지 않았습니다 다시 가입해 주십시오\");\n");
      out.write("		location.href = \"regi.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}

	String login = (String) request.getAttribute("login");
	if (login != null && !login.equals("")) {
	if (login.equals("LOGIN_OK")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"로그인되었습니다\");\n");
      out.write("		location.href = \"maintraballoon.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"아이디나 패스워드를 확인해 주십시오\");\n");
      out.write("		location.href = \"login.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}

	String bbswrite = (String) request.getAttribute("bbswrite");
	if (bbswrite != null && !bbswrite.equals("")) {
	if (bbswrite.equals("BBS_ADD_OK")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"성공적으로 작성되었습니다\");\n");
      out.write("		location.href = \"bbslist.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"다시 작성해 주십시오\");\n");
      out.write("		location.href = \"bbswrite.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}

	String sessionOut = (String) request.getAttribute("sessionOut");
	if (sessionOut != null && !sessionOut.equals("")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"로그아웃 되었습니다\");\n");
      out.write("		location.href = \"maintraballoon.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}

	String bbsupdate = (String) request.getAttribute("bbsupdate");
	if (bbsupdate != null && !bbsupdate.equals("")) {
	if (bbsupdate.equals("BBS_UPDATE_OK")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"성공적으로 수정되었습니다\");\n");
      out.write("		location.href = \"bbslist.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"다시 작성해 주십시오\");\n");
      out.write("		location.href = \"bbslist.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}

	String answer = (String) request.getAttribute("answer");
	if (answer != null && !answer.equals("")) {
	if (answer.equals("BBS_ANSWER_OK")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"답글이 성공적으로 작성되었습니다\");\n");
      out.write("		location.href = \"bbslist.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"답글을 다시 작성해 주십시오\");\n");
      out.write("		location.href = \"bbslist.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}

	String bbsdelete = (String) request.getAttribute("bbsdelete");
	if (bbsdelete != null && !bbsdelete.equals("")) {
	if (bbsdelete.equals("BBS_DELETE_OK")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"성공적으로 삭제되었습니다\");\n");
      out.write("		location.href = \"bbs?param=bbslist\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"삭제되지 않았습니다\");\n");
      out.write("		location.href = \"bbs?param=bbslist\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}	
	String deleteMember = (String) request.getAttribute("deleteMember");
	if (deleteMember != null && deleteMember != "") {
	if (deleteMember == "DELETE_MEMBER_OK"){
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"회원님의 정보가 삭제되었습니다\");\n");
      out.write("		location.href = \"sessionLeaveOut.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}else{
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"삭제되지 않았습니다\");\n");
      out.write("		locatin.href = \"leave.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}
	String updateMember = (String)request.getAttribute("updateMember");
	// 가져온 값이 비어있는값인지 빈문자열인지 먼저 판단
	if(updateMember != null && updateMember != ""){
	if(updateMember == "UPDATE_MEM_OK"){	
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"회원님의 정보 수정이 완료되었습니다\");\n");
      out.write("		location.href = \"maintraballoon.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}else{
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"수정이 완료되지 않았습니다\");\n");
      out.write("		location.href = \"mypageAf.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}
	String refmsg = (String) request.getAttribute("refmsg"); //model 로 받은 짐 푼다
	if (refmsg != null && refmsg != ("")) {
		if (refmsg == ("REF_ADD_YES")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"문의사항이 접수되었습니다\");\n");
      out.write("		location.href = \"mypageAf.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	} else {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		alert(\"문의사항이 접수되지않았습니다.다시 작성해 주십시오\");\n");
      out.write("		location.href = \"mypageReference.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	}
	String sessionLeaveOut = (String) request.getAttribute("sessionLeaveOut");
	if (sessionLeaveOut != null && !sessionLeaveOut.equals("")) {
	
      out.write("\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("		location.href = \"maintraballoon.do\";\n");
      out.write("	</script>\n");
      out.write("	");

	}
	
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

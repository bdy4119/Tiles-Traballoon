/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-19 15:02:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

    HttpSession loginsession = request.getSession();
    String userId = (String) loginsession.getAttribute("id");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        .blog-header {\r\n");
      out.write("            line-height: 1;\r\n");
      out.write("            border-bottom: 1px solid #e5e5e5;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .blog-header-logo {\r\n");
      out.write("            font-family: \"Playfair Display\", Georgia, \"Times New Roman\", serif;\r\n");
      out.write("            font-size: 2.25rem;\r\n");
      out.write("        }b \r\n");
      out.write("\r\n");
      out.write("        .nav-scroller {\r\n");
      out.write("            position: relative;\r\n");
      out.write("            z-index: 2;\r\n");
      out.write("            height: 2.75rem;\r\n");
      out.write("            overflow-y: hidden;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .nav-scroller .nav {\r\n");
      out.write("            display: -ms-flexbox;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            -ms-flex-wrap: nowrap;\r\n");
      out.write("            flex-wrap: nowrap;\r\n");
      out.write("            padding-bottom: 1rem;\r\n");
      out.write("            margin-top: -1px;\r\n");
      out.write("            overflow-x: auto;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("            -webkit-overflow-scrolling: touch;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        a.mylink {\r\n");
      out.write("            color: #666;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        a.mylink:hover {\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            color: #666;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <header class=\"blog-header py-3\">\r\n");
      out.write("        <div class=\"row flex-nowrap justify-content-between align-items-center\">\r\n");
      out.write("            <div class=\"col-4 pt-1\">\r\n");
      out.write("                <a class=\"text-muted\"></a>\r\n");
      out.write("                ");

                    if (loginsession.getAttribute("id") != null) {
                
      out.write("\r\n");
      out.write("                <div id=\"user\">\r\n");
      out.write("                    <a href=\"mypage.do\" class=\"mylink\">");
      out.print( userId );
      out.write("님 환영합니다</a>\r\n");
      out.write("                    ");

                        if (loginsession.getAttribute("id").equals("admin")) {
                    
      out.write("\r\n");
      out.write("                    <a class=\"btn btn-sm btn-outline-secondary\" href=\"tripadmin.do\">Admin</a>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                    }
                    
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-4 text-center\">\r\n");
      out.write("                <a class=\"blog-header-logo text-dark\" href=\"main.do\">Traballoon</a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-4 d-flex justify-content-end align-items-center\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                ");

                    if (loginsession.getAttribute("id") == null) {
                
      out.write("\r\n");
      out.write("                <div id=\"login\">\r\n");
      out.write("                    <a class=\"btn btn-sm btn-outline-secondary\" href=\"login.do\">Login</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                } else {
                
      out.write("\r\n");
      out.write("                <div>\r\n");
      out.write("                    <a class=\"btn btn-sm btn-outline-secondary\" href=\"sessionOut.do\">Log out</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </header>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("        <div class=\"nav-scroller py-1 mb-2\">\r\n");
      out.write("            <nav class=\"nav d-flex justify-content-between\">\r\n");
      out.write("                <a href=\"trip.do\" class=\"p-2 text-muted\" style=\"margin-right: 50px;\">지역별 여행</a>\r\n");
      out.write("                <a href=\"hotel.do\" class=\"p-2 text-muted\" style=\"margin-right: 50px;\">숙소 추천</a>\r\n");
      out.write("                <a href=\"review.do\" class=\"p-2 text-muted\" style=\"margin-right: 50px;\">여행 리뷰</a>\r\n");
      out.write("                <a href=\"community.do\" class=\"p-2 text-muted\" style=\"margin-right: 50px;\">커뮤니티</a>\r\n");
      out.write("\r\n");
      out.write("            </nav>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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

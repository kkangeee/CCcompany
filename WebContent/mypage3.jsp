<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="user.userVO"%>
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/qanda.css">
<link rel="stylesheet" href="./css/shop-homepage.css">
<link rel="stylesheet" href="./css/tab.css">
<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/delete.js"></script>
<!-- 달력 불러옴 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css">

<style type="text/css">
	input { border: 2px solid whitesmoke;border-radius: 20px; padding: 12px 10px; text-align: center; width: 250px;}
</style>

<script>
/* 흑흑.. ajax 아까워서 일단 둘게요.. */
function getParameterByName(name) {

    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");

    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),

            results = regex.exec(location.search);

    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));

}
	var id = getParameterByName('id');
	
	
/*
	 $.ajax({
	    url : "./qanda/qanda.jsp",
	    dataType : "html",
	    type : "get",  // post 또는 get
	    data : {id:iid},
	    success : function(result){
	        $("#tabcontent").html(result);
	    }
	   
	
	});   */
	/* window.onload = function() {
		for(var i=0; i<document.getElementsByClassName("button").length;i++){
			 document.getElementsByClassName("button")[i].onclick = function(){
				alert('클릭');
			}
		}
	} */
	

	
	</script>
	
	
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./basis/navigation.jsp" %>		<!-- navigation 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%String iid = request.getParameter("id"); %>

<%! 
	String mypageName;
	String mypageEmail;
	String mypageAddress;
%>

	<% 
			
			if (iid == null || "null".equals(iid)){
				out.println("로그인안함");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 하세요')");
				script.println("location.href = 'loginpage.jsp'");
				script.println("</script>");
			
			} 
		%>

<%-- <%@ include file="./basis/qanda_db/qanda_db.jsp" %> --%>		<!-- qanda db 불러옴 --> 
<%@include file="./basis/basis_db.jsp" %>

<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->


<!-- Page Content -->

<!-- DB 연결 -->
		<%
		
		//	DB연결 - mypage
			
				stmt = conn.createStatement();
				String sql = "select name, email, address from MEMBER where id = '" + iid + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					mypageName = rs.getString("name");
					mypageEmail = rs.getString("email");
					mypageAddress = rs.getString("address");
				}
	
	
%>
<!-- DB 연결 끝 -->
   
 

<!-- 꾸미기 -->
<h1>마이페이지</h1>
<div class="tabmenu" style="width: 1200px" >
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" name="tabmenu" id="tabmenu1" checked="!<%=request.getParameter("flag")%>">
      <label for="tabmenu1">나의 정보</label>
      <div class="tabCon" style="width: 1200px">
		<br><br><br>
		<div>
        	이름 :  <%=mypageName%>
     	</div>
        <div>
	   		아이디 : <%=iid %>
	    </div>
	    <div>
	        이메일 :  <%=mypageEmail%>
	    </div>
	    <div>
	        주소 : <%=mypageAddress%>
	    </div>
      </div>

    </li>
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3" >
      <label for="tabmenu3">구매내역</label>
      <div class="tabCon" style="width: 1200px; height:80vh;">
		 <div class="container">
			<input type="text" id="rangeDate" placeholder="Please select Date Range" data-input style="border: 1px solid black; display:inline;">
		</div>	  	
      </div>
    </li>
    
    <li data-tab="./qanda/qanda" id="tab4" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu4">
      <label for="tabmenu4">Q&A</label>
      <div class="tabCon" style="width: 1200px; height: 70vh;" id="tabcontent">
      
		 <div class="container">
		 	<iframe  id="iframe"  frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0 src="./qanda.jsp?id=<%=iid%>&name=<%=mypageName%>"></iframe>
		 </div>
	</div>
      	
   </div>
      
    </li>
  </ul>
</div>




<!-- 꾸미기 끝  -->


  </div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
  <script>
	$("#rangeDate").flatpickr({
	    mode: 'range',
	    dateFormat: "Y-m-d"
    	disable: [
            {
                from: "2025-04-01",
                to: "2025-05-01"
            }
	});
	</script>
</body>

​
</html>
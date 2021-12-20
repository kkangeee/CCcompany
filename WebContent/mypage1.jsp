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
<link rel="stylesheet" href="./css/shop-homepage.css">
<link rel="stylesheet" href="./css/tab.css">
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <script type="text/javascript" src="./js/delete.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%
	String id = request.getParameter("id"); 
	System.out.println("id="+id);
%>
<%! 
	String mypageName;
	String mypageEmail;
	String mypageAddress;
%>

	<% 
			
			if (id == null || "null".equals(id)){
				out.println("로그인안함");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 하세요')");
				script.println("location.href = 'loginpage.jsp'");
				script.println("</script>");
			
			} 
		%>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
         <a class="navbar-brand" href="#">홈페이지</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <form class="form-inline my-2 my-lg-0 navbar-form">
            <div class="input-group input-group-search mx-auto">
               <input type="search" class="form-control" placeholder="검색어를 입력하세요." aria-label="Search" aria-describedby="search-button-addon">
               <div class="input-group-append">
                  <button class="btn btn-success" type="submit" id="search-button-addon">&#128269;</button>
               </div>
            </div>
         </form>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="logoutaction.jsp">로그아웃</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-nowrap" href="mypage2.jsp">마이페이지</a>
               </li>
            </ul>
         </div>
      </nav>
      
	
<!-- Navigation 끝 -->


<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->


<!-- Page Content -->

<!-- DB 연결 -->
		<%
		Connection conn = null;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		
		//	DB연결
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(url, "su", "0000");
				/* out.println("db연결"); */
				stmt = conn.createStatement();
				String sql = "select name, email, address from MEMBER where id = '" + id + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					mypageName = rs.getString("name");
					mypageEmail = rs.getString("email");
					mypageAddress = rs.getString("address");
				}
	
			} catch (ClassNotFoundException e) {
				out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.<br/>");
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("데이터베이스 접속 정보가 올바르지 않습니다.<br/>");
			}
	
		
%>
<!-- DB 연결 끝 -->
 
 

<!-- 꾸미기 -->

<h1>마이페이지</h1>
<div class="tabmenu" style="width: 1200px" >
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">나의 정보</label>
      <div class="tabCon" style="width: 1200px">
		<br><br><br>
		<div>
        	이름 :  <%=mypageName%>
     	</div>
        <div>
	   		아이디 : <%=id %>
	    </div>
	    <div>
	        이메일 :  <%=mypageEmail%>
	    </div>
	    <div>
	        주소 : <%=mypageAddress%>
	    </div>
      </div>

    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
		<label for="tabmenu2">장바구니</label>
			<div class="tabCon" style="width: 1200px">
				<form>
					<div style="display: flex;">
						<div style="width : 15%"><img src="./image/computer.jpg" alt="product" class="productimage" style="width:130px"></div>
						<div style="width : 85%; margin : 10px 0px 40px 10px;"><%=mypageName%>님 안녕하세요~ 장바구니에요~!</div>
					</div>
					
					<div class="container" style="margin-left:10px;">
						<div class="rowhead" style="display: flex; width : 1300px; height: 30px;">
							<div style="width: 10%">체크</div>
							<div style="width: 20%">이미지</div>
							<div style="width: 25%">상품명</div>
							<div style="width: 10%">가격</div>
							<div style="width: 15%">수량</div>
							<div style="width: 10%">합계</div>
							<div style="width: 10%">삭제</div>
						</div>
					<hr/>
					
					<!-- rowdata는 장바구니에 새로운 상품을 넣을때마다 추가된다. for문 활용 -->
					<div class="rowdata" style="display: flex; width : 1300px; height: 80px;" id="rowdata">
						<div style="width: 10%">체크</div>
						<div style="width: 20%"><img src="./image/computer.jpg" alt="product" class="productimage" style="width:130px; 
				    		height:100%;"></div>
						<div style="width: 25%">티비</div>
						<div style="width: 10%">1000</div>
						<div style="width: 15%">
							<form>
							<input type=text name=amount value=1 readonly style= "width:50px;">
							<input type=button value="증가" onClick="javascript:this.form.amount.value++;">
							<input type=button value="감소" onClick="javascript:this.form.amount.value--;">
							</form>
						</div>
						<div style="width: 10%">합계</div>
						<div style="width: 10%"><button type="button" class="btn btn-outline-dark">삭제</button></div>
					</div>
					<!-- rowdata는 장바구니에 새로운 상품을 넣을때마다 추가된다. for문 활용 -->
					<div class="rowdata" style="display: flex; width : 1300px; height: 80px;" >
						<div style="width: 10%">체크</div>
						<div style="width: 20%"><img src="./image/computer.jpg" alt="product" class="productimage" style="width:130px; 
				            height:100%;"></div>
						<div style="width: 25%">에어컨</div>
						<div style="width: 10%">500</div>
						<div style="width: 15%">
							<form>
							<input type=text name=amount value=2 readonly style= "width:50px;">
							<input type=button value="증가" onClick="javascript:this.form.amount.value++;">
							<input type=button value="감소" onClick="javascript:this.form.amount.value--;">
							</form>
						</div>
						<div style="width: 10%">합계</div>
						<div style="width: 10%">
							<button type="button" class="btn btn-outline-dark" onclick="deleteImg()">삭제
								
							</button></div>
					</div>
				<hr/>
							
				<div>
				총 합계: 0000000원   
				<button>선택상품 주문</button>	
				</div>
				</div>
				</form>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
      </div>
      
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">구매내역</label>
      <div class="tabCon" style="width: 1200px">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div>
      
    </li>
  </ul>
</div>




<!-- 꾸미기 끝  -->


  </div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
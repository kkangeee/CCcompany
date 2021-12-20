<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%-- <%@page import="user.userVO"%>--%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html style="overflow:scroll; width:auto; height:5000px;">
<link rel="stylesheet" href="./css/shop-homepage.css">
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <link href="./js/tab.js" rel="stylesheet">
 <link href="./js/productpage.js" rel="stylesheet">
 <link href="./css/tab.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="./js/productpage.js"></script>
<body onload="init();">

<%String iid = request.getParameter("id"); %>
<%int idx = Integer.parseInt(request.getParameter("idx"));%> 
<link href="./css/tab.css" rel="stylesheet">
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 --> 
<%@ include file="./basis/product_main_db.jsp" %>		<!-- TV_db정보 -->
<div class="col p-3"> <!-- 이 안에 내용 적어주세요 -->
<%
	stmt = conn.createStatement();
	String dtest = "select * from product where idx = " + idx ;	
	pstmt = conn.prepareStatement(dtest);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		 productname = rs.getString("productname");
		 brandName = rs.getString("brandName");
		 price = rs.getInt("price");
		 storagedate = rs.getString("storagedate");
	}
%>


<br><br>
	<div class="container" style="width : 85%; height: 100vh;">
			<div class="row" style="display: flex">
				<div class="product_pictures" style="width: 50%">
				<img src="./image/computer.jpg" alt="product" class="productimage">
				</div>
				
				<div class="product_spec" style="width: 50%; margin-top: 20px;" >
					<h2>제품명:<%=productname%></h2> <!-- 제품명 -->
					<h3>브랜드명:<%=brandName%></h3> <!-- 상세설명 -->	
					<p>제조일자:<%=storagedate%></p>
					<hr/>
					
					
					<div style="display: flex">
						<div class="quantity" style="width: 70%">
							<form name="form" method="get">
							수량 : <input type=hidden name="sell_price" value="<%=price%>">
							<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
							가격 : <%=price%>
							금액 : <input type="text" name="sum" size="11" readonly>원
							</form>		
						</div>
						
						<div class="totalprice" style="width: 15%">
						
							<%
				                if(iid == null  || iid.equals("null")) {
				            %>
							<input type="button" value="주문하기" onclick="location.href='loginpage.jsp'">
							<% 
				                } else {
							%>
							<input type="button" value="주문하기" onclick="location.href='orderform.jsp'">
							<%
				                }
				            %>
						</div>	
						<div class="totalprice" style="width: 15%">
							<%
				                if(iid == null  || iid.equals("null")) {
				            %>
							<input type="button" value="장바구니" onclick="location.href='loginpage.jsp'">
							<% 
				                } else {
							%>
							<input type="button" value="장바구니" onclick="location.href='shopping_basket.jsp?idx=<%=best_idx.get(0)%>'">
							<%
				                }
				            %>
						</div>	
					</div>
				<div>
				<hr/>
			 </div>	
	</div>	  
			  
  
	
<div>dddddddddddddddddddddddddddddddddddddddddddddddddddd

<div class="tabmenu" style="width: 1200px">
  <ul>
    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">상품설명</label>
      <div class="tabCon" style="width: 1200px">
		<br><br><br>
      	<div>
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    	</div>
    	<div>
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    		<img src="./image/computer.jpg" alt="product" class="productimage" style="width: 300px">
    	</div>
      </div>
    </li>
    <li id="tab2" class="btnCon" ><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">리뷰</label>
      <div class="tabCon" style="width: 1200px; height:80vh;">
      	<iframe src="./review.jsp?id=<%=id %>&product_idx=<%=idx %>" style="width:100%; height:100%;" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0></iframe>
      </div>
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">어떤걸 넣을까용?</label>
      <div class="tabCon" style="width: 1200px">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div>
      
    </li>
  </ul>
</div>


</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->
</body>
</html>
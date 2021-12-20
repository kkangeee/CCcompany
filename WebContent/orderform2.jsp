<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/basis_Su.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<!-- 숫자 3자리마다 , 표시하기 위한 코드 -->
<%@ page import="java.text.*" %> 
<% NumberFormat nf = NumberFormat.getNumberInstance(); %>
<%@ include file="./basis/navigation.jsp" %>	<!-- navigation 불러옴 -->
<%@ include file="./basis/category.jsp" %>		<!-- category 불러옴 --> 
<%@ include file="./basis/footer.jsp" %>		<!-- footer 불러옴 --> 

<!-- 내가 주문하기를 누른 db가져오기 -->

<div class="col p-1"> <!-- 이 안에 내용 적어주세요 -->
<!-- 상품상세페이지에서 주문하기 누르면 나오는 페이지 주문페이지 -->
<div class="전체" style="width: 800px; margin-left: 100px; margin-top: 50px">
	<div><h1>주문/결제하기</h1></div>
	<div class="주문한것" style="width:800px; height: 210px; display: flex;" >
		<div class="사진" style="width:40%; height: 200px; border-color: blue">제품 이미지 사진 </div>
		<div class="제품 설명" style="width:60%">
			<div class="제품이름" style="height: 50px">제품이름</div>
			<div class="제품가격" style="height: 50px">제품가격</div>
		</div>
	</div>
	<hr/>
	<div>
		<div><h3>주문자 정보</h3></div>
		<div class="이름">이름:</div>
		<div class="주소">주소:</div>
		<div class="이메일">이메일:</div>
	</div>
	<hr/>
	<div><h2>총가격 : 총가격</h2></div>
	<button type="button" onclick="location.href='ordercomplete.jsp'">주문완료</button>
</div>
	
<%@ include file="./basis/shopping_basket_db.jsp" %>

제품번호:<%=basket_idx.get(0)%>
상품이름: <%=basket_product.get(0)%>
브랜드명: <%=basket_brand.get(0)%>
가격: <%=basket_price.get(0)%>
이름:
주소:
<%-- 이름: <jsp:getProperty property="name" name="name"/>
주소: <jsp:getProperty property="address" name="user"/> --%>


<!-- 장바구니에서 확인을 누르면 주문 완료가 뜨는 페이지 (주문 폼 페이지  )-->
<input type="button" value="확인" onclick="btn()">

<script type="text/javascript">
	function btn() {
		alert('주문완료!')
		location.href="team_main.jsp"
	}
</script>



</div></div></div> <!-- 이 안에 내용 적어주세요 끝 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Elegant Dashboard | Dashboard</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
</head>
<script src="${pageContext.request.contextPath}/resources/plugins/chart.min.js"></script>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>
<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<body>
<body>
  <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <!-- ! Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-start">
        <div class="sidebar-head">
            <a href="/" class="logo-wrapper" title="Home">
                <span class="sr-only">Home</span>
                <span class="icon logo" aria-hidden="true"></span>
                <div class="logo-text">
                    <span class="logo-title">관리자페이지</span>
                    <span class="logo-subtitle">admin</span>
                </div>

            </a>
            <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
                <span class="sr-only">Toggle menu</span>
                <span class="icon menu-toggle" aria-hidden="true"></span>
            </button>
        </div>
        <!-- LNB 영역 -->
        <div class="sidebar-body">
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="/admin/clubAdminPage"><span class="icon home" aria-hidden="true"></span>동아리 관리</a>
                </li>
            </ul>
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="/admin/rankAdminPage"><span class="icon user-3" aria-hidden="true"></span>개인랭킹 관리</a>
                </li>
            </ul>
          
        </div>
    </div>
</aside>
 <div class="main-wrapper">
   <!-- ! Main nav -->
   <nav class="main-nav--bg">
   <div class="container main-nav">
	   <div class="main-nav-start">
	   <div class="search-wrapper">
	       <i data-feather="search" aria-hidden="true"></i>
	        <input type="text" placeholder="Enter keywords ..." required>
	    </div>
	   </div>  
	</div>
   </nav>
   <div class="container">
    <div class="row">
    	<div class="col-lg-9" style="margin: 0px 0px 0px 50px">  
          <div class="users-table table-wrapper">
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                  	<th>
                      <label class="users-table__checkbox ms-20">
                        <input type="checkbox" class="check-all">
                      </label>
                    </th>
                    <th>사원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>사원 사진</th>
                    <th>레이팅 점수</th>
                    <th>경기 횟수</th>
                  </tr>
                </thead>
                <tbody id="dataTbody">
                  <%-- <tr>
                  	 <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                      </label>
                    </td>
                    <td>
                    	1
                    </td>
                    <td>
                      라이즈 동아리
                    </td>
                    <td>
						<div class="categories-table-img">
                          <picture><source srcset="${pageContext.request.contextPath}/resources/img/categories/03.webp" type="image/webp"><img src="./img/categories/03.jpg" alt="category"></picture>
                        </div>
                    </td>
                    <td><span class="badge-active">상태</span></td>
                    <td>서울</td>
                    <td>Y</td>
                    <td>액티비티</td>
                    <td> 2021-04-21 </td>
                    <td> 2021-04-21 </td>
                  </tr> --%>
                </tbody>
              </table>
            </div>
    	</div>
    </div>
  </div>
 <script>
 $(document).ready(function() {
 
 });
 getRankingList();
 function getRankingList() { 
	    var params = {}; // 
		$.ajax({
			type: 'POST',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
		    url: '/admin/rank', 
		    data: JSON.stringify(params),
			contentType: 'application/json',
			success: function(response) {
	            console.log('개인 랭킹 리스트 정보 가져오기 성공');
	            //console.log(response.data);
	            var list = response.data;
	            
	            for(var i = 0 ; i < list.length; i++){
	            	appendDataToTable(list[i]);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('개인 랭킹 리스트 정보 가져오기 실패:', error);
	        }
	    });
	}
 function appendDataToTable(data) {
	    var tbody = $('#dataTbody'); 
	 
	    var tr = $('<tr>'); 

	    tr.append('<td><label class="users-table__checkbox"><input type="checkbox" class="check"></label></td>'); // 체크박스 열 추가
	    tr.append('<td>'+data.employeeNo+'</td>'); // 사원번호
	    tr.append('<td>'+data.memberId+'</td>'); // 아이디
	    tr.append('<td>'+data.employeeName+'</td>'); // 이름
	    tr.append('<td>'+data.memberImage+'</td>'); // 이미지
	    tr.append('<td>'+data.memberRating+'</td>'); // 카테고리 열 추가
	    tr.append('<td>'+data.matchNum+'</td>'); // 회원가입일 열 추가
	   
	    
	    tbody.append(tr); // 행을 테이블에 추가합니다.
	}


 </script>
</body>
</html>
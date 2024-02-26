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
                    <th>번호</th>
                    <th>동아리 이름</th>
                    <th>동아리 사진</th>
                    <th>동아리 소개</th>
                    <th>활동 지역</th>
                    <th>활성 여부</th>
                    <th>카테고리</th>
                    <th>등록 날짜</th>
                    <th>수정 날짜</th>
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
 getClubList();
 function getClubList() { 
	    var params = {}; // ClubVO 객체를 생성하고 필요한 데이터를 추가해야 합니다.
		$.ajax({
			type: 'POST',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
		    url: '/admin/club', // URL을 '/club'로 변경합니다.
		    data: JSON.stringify(params), // ClubVO 객체를 JSON 문자열로 변환하여 전송합니다.
			contentType: 'application/json', // 전송하는 데이터의 타입을 명시합니다.
			success: function(response) {
	            console.log('개인 랭킹 리스트 정보 가져오기 성공');
	         //  console.log(response.data);
	            var list = response.data;
	            
	            for(var i = 0 ; i < list.length; i++){
	            	//appendDataToTable(list[i]);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('동아리 리스트 정보 가져오기 실패:', error);
	        }
	    });
	}
 function appendDataToTable(data) {
	    var tbody = $('#dataTbody'); // 테이블의 tbody 요소를 선택합니다. 해당 테이블 ID에 맞게 변경해야 합니다.
	    
	    // 새로운 행(tr) 요소를 생성하고 데이터를 추가합니다.
	    var tr = $('<tr>'); 
	    
	    // 각 열(td)에 데이터를 추가합니다.
	    tr.append('<td><label class="users-table__checkbox"><input type="checkbox" class="check"></label></td>'); // 체크박스 열 추가
	    tr.append('<td>'+data.clubNo+'</td>'); // ID 열 추가
	    tr.append('<td>'+data.clubName+'</td>'); // 동아리명 열 추가
	    tr.append('<td><div class="categories-table-img"><picture><source srcset="${pageContext.request.contextPath}/resources/img/categories/03.webp" type="image/webp"><img src="./img/categories/03.jpg" alt="category"></picture></div></td>'); // 이미지 열 추가
	    tr.append('<td>'+data.clubInfo+'</td>'); // 상태 열 추가
	    tr.append('<td>'+data.clubLoc+'</td>'); // 위치 열 추가
	    tr.append('<td><span class="badge-active">'+data.useYn+'</span></td>'); // 활성화 여부 열 추가
	    tr.append('<td>'+data.categoryName+'</td>'); // 카테고리 열 추가
	    tr.append('<td>'+data.createdAt+'</td>'); // 생성일 열 추가
	    tr.append('<td>'+data.modifiedAt+'</td>'); // 수정일 열 추가
	    
	    tbody.append(tr); // 행을 테이블에 추가합니다.
	}


 </script>
</body>
</html>
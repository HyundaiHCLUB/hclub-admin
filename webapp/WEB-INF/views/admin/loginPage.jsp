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

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->


<script>
function pay(){
	
	var user_id = 'test01';
	var buyName = '상품명';
	
	var total= 200;
	
	var mName = '초콜릿';
 
   // alert(total.toLocaleString());
    var IMP = window.IMP; // 생략가능
    
    IMP.init('imp20386257');
    // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
    IMP.request_pay({
    	
   //	pg: 'kakao.TC0ONETIME', // version 1.1.0부터 지원.
    pg: 'inicis', // version 1.1.0부터 지원.
    /*
    'kakao':카카오페이,
    html5_inicis':이니시스(웹표준결제)
    'nice':나이스페이
    'jtnet':제이티넷
    'uplus':LG유플러스
    'danal':다날
    'payco':페이코
    'syrup':시럽페이
    'paypal':페이팔
    */
    pay_method: 'card',
    /*
    'samsung':삼성페이,
    'card':신용카드,
    'trans':실시간계좌이체,
    'vbank':가상계좌,
    'phone':휴대폰소액결제
    */
   // merchant_uid: 'merchant_' + new Date().getTime(),
    merchant_uid: 'merchant_' + new Date().getTime(),
    name: '주문명:결제테스트',
    //결제창에서 보여질 이름
    amount: total,
    //가격
    buyer_email: 'iamport@siot.do',
    buyer_name:  buyName,
    buyer_tel: '010-1234-5678',
    buyer_addr: '서울특별시 강남구 삼성동',
    buyer_postcode: '123-456',
    m_redirect_url: '/competition/loseTeam'
    /*
    모바일 결제시,
    결제가 끝나고 랜딩되는 URL을 지정
    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
    */
    }, function (rsp) {
    console.log(rsp);
	    if (rsp.success) {
		    var msg = '상점 거래ID : ' + user_id;
		    msg += '\n결제 금액 : ' + rsp.paid_amount.toLocaleString();
		    msg +='원\n결제가 완료되셨습니다.';
		    alert(msg);
		    //후에 필요 정보 파라미터로 넘기기.
		    payJudge=true;
		  
		    //location.ref;
    } else {
		    var msg = '결제에 실패하였습니다.';
		    msg += '에러내용 : ' + rsp.error_msg;
		    alert(msg);
		    //결제 실패 페이지로 이동
		    location.href='/competition/loseTeam';
    } 
   });  
}
//comp용 코드 추후 삭제 예정
function test(){
	$.ajax({
		url:'/ad/admin/kakaopay' ,
		dataType : 'json',
		success:function(data){
			console.log(data);
			//alert(data.tid);
			//alert(data.total_amount);
			var box = data.next_redirect_pc_url;
			window.open(box);
		},
		error: function(error){
			alert(error);
		}
	});	
}
</script>
<style>
	.inputBas{
		margin: 10px;
	}
	#loginDiv{
		border: 1px solid black;
		width: fit-content;
		padding:30px;
		margin:auto;
	}
</style>
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
           
          
        </div>
    </div>
</aside>
 <div class="main-wrapper">
   <!-- ! Main nav -->
   <nav class="main-nav--bg">
   <div class="container main-nav">
	   <div class="main-nav-start">
	  
	   </div>  
	</div>
   </nav>
   <div class="container">
    <div class="row">
    	<div class="col-lg-9">  
          <div class="users-table table-wrapper">
          	<div id="loginDiv">
          		<form id="loginFrm">
	         		<div>
	         			<input type="text" name="id"  class="inputBas"placeholder="아이디를 입력하세요">
	         		</div>
	         		<div>
	         			<input type="text" name="pass" class="inputBas" placeholder="비밀번호를 입력하세요">
	         		</div>
	         		  <input type="button" class="btn-payment" onclick="test()" value="결제하기">
         		</form>
            </div>
            </div>
    	</div>
    </div>
  </div>
 <script>
 $(document).ready(function() {
 
 });
 
function getUserInfo(accessToken) { 
	$.ajax({
		type: 'POST',
	    url: 'https://www.h-club.site/auth/test',
		headers: {
	     'Authorization': 'Bearer ' + accessToken // accessToken 사용
	},
	success: function(memberInfo) {
          console.log('사용자 정보:', memberInfo);
    },
    error: function(xhr, status, error) {
          console.error('사용자 정보 가져오기 실패:', error);
       }
    });
}
 </script>
</body>
</html>
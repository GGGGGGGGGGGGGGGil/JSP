<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>케이마켓 고객센터</title>
    <link rel="shortcut icon" type="image/x-icon" href="/Kmarket/img/favicon.ico" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <div id="wrapper">
      <header>
        <div class="top">
          <div>
            <p>
	            <a href="/Kmarket1/member/login.jsp">로그인</a>
	            <a href="/Kmarket1/member/join.jsp">회원가입</a>
	            <a href="/Kmarket1/member/login.jsp">마이페이지</a>
	            <a href="/Kmarket1/product/cart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;장바구니</a>
            </p>
          </div>
        </div>
        <div class="logo">
          <div>
            <a href="/Kmarket/cs/index.html"><img src="../img/logo.png" alt="로고" />고객센터</a>
          </div>
        </div>
      </header>
      <section id="cs">
        <div class="qna">
          <nav>
            <div>
              <p>홈<span>></span>문의하기</p>
            </div>
          </nav>
          <section class="view">
            <aside>
              <h2>문의하기</h2>
              <ul>
                <li class="on"><a href="#">회원</a></li>
                <li><a href="#">쿠폰/이벤트</a></li>
                <li><a href="#">주문/결제</a></li>
                <li><a href="#">배송</a></li>
                <li><a href="#">취소/반품/교환</a></li>
                <li><a href="#">여행/숙박/항공</a></li>
                <li><a href="#">안전거래</a></li>
              </ul>
            </aside>
            <article>
              <nav>
                <h2 class="title">[가입] 가입 문의내용</h2>                
                <p>
                  <span>chh***</span>
                  <span>2022-11-21</span>
                </p>
              </nav>

              <div class="content">
                <p>
                  개인회원에서 법인회원(사업자 회원)으로 전환은 불가하므로 법인회원(사업자 회원) 전환은 신규 가입으로 진행을 해야 합니다.
                </p>
                <p>
                  ※ 피싱 관련 피해신고<br /><br />
                  ▶ 경찰청 사이버수사국 (국번없이)182 :
                  <a href="http://cyberbureau.police.go.kr">http://cyberbureau.police.go.kr</a><br />
                  ▶ KISA 인터넷침해대응센터 (국번없이)118 :
                  <a href="http://www.krcert.or.kr">http://www.krcert.or.kr</a><br />
                  감사합니다.<br />
                </p>
              </div>
              <a href="./list.html" class="btnList">목록보기</a>
            </article>
          </section>
        </div>
      </section>

      <footer>
        <ul>
          <li><a href="#">회사소개</a></li>
          <li><a href="#">서비스이용약관</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">전자금융거래약관</a></li>
        </ul>
        <div>
          <p><img src="../img/footer_logo.png" alt="로고" /></p>
          <p>
            <strong>(주)KMARKET</strong><br />
            부산시 강남구 테헤로 152 (역삼동 강남파이낸스센터)<br />
            대표이사 : 홍길동<br />
            사업자등록번호 : 220-81-83676 사업자정보확인<br />
            통신판매업신고 : 강남 10630호 Fax : 02-589-8842
          </p>
          <p>
            <strong>고객센터</strong><br />
            Tel : 1234-5678 (평일 09:00~18:00)<br />
            스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)<br />
            경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층<br />
            Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr<br />
          </p>
        </div>
      </footer>
    </div>
  </body>
</html>
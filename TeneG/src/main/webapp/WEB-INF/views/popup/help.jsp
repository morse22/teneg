<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	p{
		font-size: 10pt;
	}

   th{
      height: 50px;
      border: 1px solid black;      
   }
   td{
      height: 300px;
      border: 1px solid #bbb;
   }   
   table{
      align:center;
      width: 550px;
   }
   fieldset{
   margin-bottom: 150px;
   border: 1px solid white;
   }   
           a:link { color: black; text-decoration: none;}
       a:visited { color: black; text-decoration: none;}
       a:hover { color: black; text-decoration: underline;}
        .line{border-bottom:1px solid black;}
       #red_bar2{
               width: 330px;
               height: 100px;
               margin-top:100px;
                 margin-right:175px;
               border: 2px solid black;
               color: #000;
            
               padding-left: 15px;
            
            }   
           .c{
              background-color: black;
           }
        
         
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
<script> 
function fnMove(seq){
    var offset = $("#div" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}


</script> 
</head>
<body>
   <h3 align="center">TeneG-GUIDE</h3>
   <table style="border: 1px solid #bbb">
      <tr class="c">
         <th onclick="fnMove('1')" id="div1"><a style="color: white; font-size: 20px;" href="#">회원가입</a></th>
         <th onclick="fnMove('2')"><a  style="color: white; font-size: 20px;" href="#">주문방법</a></th>
         <th onclick="fnMove('3')"><a  style="color: white; font-size: 20px;" href="#">결제안내</a></th>
         <th onclick="fnMove('4')"><a  style="color: white; font-size: 20px;" href="#">기타안내</a></th>
      </tr>
      <tr>
         <th colspan="4" >회원가입</th>      
      </tr>
      <tr>
         <td colspan="4" >
            <fieldset>
            <strong><label>회원가입안내</label></strong><br/><br/><br/>
            <p><a href=#><strong>[회원가입]</strong></a>메뉴를 통해 일정 양식의 가입항목을 기입함으로써 회원에 가입됩니다.</p>
            <p>회원가입 즉시 회원을 위한 다양한 이벤트 및 서비스에 참여하실 수 있습니다.</p></fieldset>
      </td>
      </tr>
         <tr class="c">
         <th onclick="fnMove('1')"><a style="color: white; font-size: 20px;" href="#">회원가입</a></th>
         <th onclick="fnMove('2')" id="div2"><a style="color: white; font-size: 20px;" href="#">주문방법</a></th>
         <th onclick="fnMove('3')"><a style="color: white; font-size: 20px;" href="#">결제안내</a></th>
         <th onclick="fnMove('4')"><a style="color: white; font-size: 20px;" href="#">기타안내</a></th>
      </tr>
      <tr>
         <th colspan="4" >주문방법</th>
      </tr>
      <tr>
         <td colspan="4" >안내</td>
      </tr>
         <tr class="c">
         <th onclick="fnMove('1')"><a style="color: white; font-size: 20px;" href="#">회원가입</a> </th>
         <th onclick="fnMove('2')"><a style="color: white; font-size: 20px;" href="#">주문방법</a></th>
         <th onclick="fnMove('3')" id="div3"><a  style="color: white; font-size: 20px;" href="#">결제안내</a></th>
         <th onclick="fnMove('4')"><a style="color: white; font-size: 20px;" href="#">기타안내</a></th>
      </tr>
            <tr>
         <th colspan="4" >결제안내</th>
      </tr>
      <tr>
         <td colspan="4" >
            <fieldset>
            <strong><label>결제안내</label></strong><br/><br/><br/>
            <p><strong>고액</strong>의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.</p>
            <p>확인과정에서 도난 카드의 사용이나 타인 명의의 주문 등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 추소할  수 있습니다.</p>
            <p><strong>무통장 입금</strong>에서 상품 구매 대금은 PC뱅킹, 인터넷뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.</p>
            <p>주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 합니다.</p>
            <p>7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</p></fieldset>         
         </td>
      </tr>
         <tr class="c">
         <th onclick="fnMove('1')"><a style="color: white; font-size: 20px;" href="#">회원가입</a></th>
         <th onclick="fnMove('2')"><a style="color: white; font-size: 20px;" href="#">주문방법</a></th>
         <th onclick="fnMove('3')"><a style="color: white; font-size: 20px;" href="#">결제안내</a></th>
         <th onclick="fnMove('4')"  id="div4"><a  style="color: white; font-size: 20px;" href="#">기타안내</a></th>
      </tr>
      <tr>
         <th colspan="4">기타안내</th>
      </tr>
      <tr>
         <td colspan="4">
         <fieldset>
            <strong><label>기타안내</label></strong><br/><br/><br/>
               <strong>적립금</strong>
                  <p>사용가능한 적립금은 상품구매시 즉시 사용하실 수 있습니다</p>
               <strong>적립금 이용조건</strong>
                  <p>적림금 사용시 최소구매가능적립금은 100원 이상입니다.</p>   
               <strong>소멸조건</strong>
                  <p>주문취소/환불시에 상품구매로 적림된 적립금은 함께 취소됩니다.</p>
                  <p>회원탈퇴시에는 적립금은 자동적으로 소멸됩니다.</p>
                  <p>최종 적립금 발생일로부터 3년 동안 추가적립금 누적이 없을 경우에도 적립금은 소멸됩니다.</p>   
              <div style="margin-top: 68px" id="red_bar2"><p><span style="font-size:15px">TEL.</span><strong><sub  style="font-size:25px">1544-7199</sub></strong></p>
                    <p>기타문의사항으로 연락주시기 바랍니다.</p></div>
            </fieldset>   
         </td>
      </tr>
      
   </table>
</body>
</html>
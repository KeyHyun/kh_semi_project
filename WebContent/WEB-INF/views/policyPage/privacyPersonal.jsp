<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보처리방침</title>
</head>

    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .wrap {
            margin: 0 auto;
            width: 1200px;
        }

        .header {
            width: 1200px;
            height: 100px;
            background: green;
        }

        .myplan {
            overflow: hidden;
        }

        .leftMenu {
            width: 182px;
            height: 920px;
            background: #E1E1E1;
            float: left;
        }

        .participatingGroup {
            float: left;
        }

        .groupListTitle {
            width: 1018px;
            height: 58px;
            text-align: center;
            line-height: 58px;
            color: white;
            font-weight: bold;
            background: #6ED078;
        }

        .groupList {
            width: 1018px;
            background: #FDFDFD;
        }

        .leftMenuList {
            padding: 0;
            margin: 0;
            list-style-type: none;
            line-height: 58px;
        }

        .leftMenuA {
            display: block;
            width: 100%;
            height: 58px;
            color: black;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .leftMenuA:hover {
            color: black;
            text-decoration: none;
        }

        .leftMenuList>li:first-child {
            text-indent: 0;
            text-align: center;
            font-weight: bold;
            font-size: 20px;
        }

        .title {
            margin-left: 20px;
        }

        .text {
            width: 94%;
            height: 750px;
            overflow: auto;
            line-height: 20px;
            font-family: Roboto;
            font-style: normal;
            padding: 3%;
            margin: 0 auto;
            color : black;
        }

        strong {
            margin-left: 10px;
        }
    </style>
<body>
<div>
	   <%@inclue file="file="/WEB-INF/views/common/header.jsp" %>
</div>
    <section>
        <div class="wrap">
            <div class="header">헤더부분</div>
            <div class="myplan">
                <div class="leftMenu">
                    <ul class="leftMenuList">
                        <li>이용안내</li>
                        <li><a class="leftMenuA" href="/usePolicy">이용약관</a></li>
                        <li><a class="leftMenuA" href="/privacyPersonal" style="background-color: #6ED078; ">개인정보처리방침</a></li>
                        <li><a class="leftMenuA" href="/servicePolicy">운영정책</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    <div class="groupListTitle">개인정보처리방침</div>
                    <div class="groupList">
                        <div class="body">
                            <div class="text">
                                <h1>개인정보처리방침</h1>
                                <hr>
                                <strong>1. 개인정보의 처리 목적 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.</strong><br>

                                - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등<br>

                                <br><strong>2. 개인정보의 처리 및 보유 기간</strong><br>

                                ① 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br>

                                ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>

                                ☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.<br>

                                (예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br>

                                - 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년<br>



                                <br><strong>3. 개인정보의 제3자 제공에 관한 사항</strong><br>

                                ① 비타500('http://STUDY_WITH_US.com'이하 'STUDY WITH US')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>

                                ② 비타500('http://STUDY_WITH_US.com')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>

                                <br><strong>4. 개인정보처리 위탁</strong><br>

                                ① 비타500('STUDY WITH US')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>


                                ② 비타500('http://STUDY_WITH_US.com'이하 'STUDY WITH US')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>

                                ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>

                                <br><strong>5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</strong><br>

                                ① 정보주체는 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>

                                1. 개인정보 열람요구<br>

                                2. 오류 등이 있을 경우 정정 요구<br>

                                3. 삭제요구<br>

                                4. 처리정지 요구<br>



                                <br><strong>6. 처리하는 개인정보의 항목 작성</strong><br>

                                ① 비타500('http://STUDY_WITH_US.com'이하 'STUDY WITH US')은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br>

                                1회원가입<br>
                                필수항목 : 이메일, 비밀번호, 로그인ID, 이름<br>
                                - 선택항목 :<br>


                                <br><strong>7. 개인정보의 파기 '비타500'('STUDY WITH US')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다</strong>.<br>

                                -파기절차
                                이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br>

                                -파기기한
                                이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br>



                                <br><strong>8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong><br>

                                비타500 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.<br>

                                <br><strong>9. 개인정보 보호책임자 작성</strong><br>

                                ① 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>

                                ▶ 개인정보 보호책임자<br>
                                <br>성명 :최문정
                                <br>직책 :사원
                                <br>직급 :사원
                                <br>연락처 :02-000-000, ctj123@naver.com,
                                <br>※ 개인정보 보호 담당부서로 연결됩니다.

                                ▶ 개인정보 보호 담당부서<br>
                                ② 정보주체께서는 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 비타500(‘http://STUDY_WITH_US.com’이하 ‘STUDY WITH US) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>

                                <br><strong>10. 개인정보 처리방침 변경</strong><br>

                                ①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br>



                                <br><strong>11. 개인정보의 안전성 확보 조치 비타500('STUDY WITH US')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</strong><br>

                                1. 정기적인 자체 감사 실시<br>
                                개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br>

                                2. 개인정보 취급 직원의 최소화 및 교육<br>
                                개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br>

                                3. 내부관리계획의 수립 및 시행<br>
                                개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br>

                                4. 해킹 등에 대비한 기술적 대책<br>
                                비타500('STUDY WITH US')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.<br>

                                5. 개인정보의 암호화<br>
                                이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br>

                                6. 접속기록의 보관 및 위변조 방지<br>
                                개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.<br>

                                7. 개인정보에 대한 접근 제한<br>
                                개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br>

                                8. 문서보안을 위한 잠금장치 사용<br>
                                개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.<br>

                                9. 비인가자에 대한 출입 통제<br>
                                개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.<br>
                           

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div>
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
	
</body>
</html>
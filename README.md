# PPAERUWA

프로젝트 소개 - 다이어트 관리 웹사이트 
- 식단, 운동량, 칼로리 기록 및 관리
- SNS 기능 및 회원 간 채팅
- 레시피 및 운동 관련 영상 제공

사용 기술
- Tomcat 7.0
- Oracle Database 11g
- JDK 1.8.0
- Eclipse Oxygen
- Spring 4 Framework
- MyBatis
- Windows 7

Spring MVC 패턴
1. web.xml<br>
Client가 URL로 접근하여 정보를 요청하게 되면 web.xml을 통하여 dispatcher-servlet.xml로 이동하게 된다.
2. dispatcher-servlet.xml<br>
HandlerMapping을 통해 Controller로 요청을 전달한다.
3. @Controller<br>
해당하는 @RequestMapping에서 Client의 요청을 처리한다.

프로젝트 내용
1. 회원가입<br>
/member/signup.jsp<br>
/mvc/controller/MemberCtrl.java<br>
1&rpar; 이메일 중복 체크<br>
2&rpar; 이메일 인증<br>
3&rpar; 회원가입
2. 로그인<br>
/member/login.jsp<br>
/mvc/controller/MemberCtrl.java<br>
1&rpar; 이메일과 비밀번호 입력 후 로그인
3. 아이디 / 비밀번호 찾기
- 아이디 찾기: /member/idfind.jsp
- 비밀번호 찾기: /member/pwfind.jsp<br>
/mvc/controller/MemberCtrl.java<br>
1&rpar; 아이디 찾기: 이름, 연락처, 생년월일 입력 후 아이디 확인<br>
2&rpar; 비밀번호 찾기: 이메일, 연락처 입력 후 해당 이메일로 비밀번호 발송
4. 마이페이지 수정<br>
/no/mypage.jsp<br>
/mvc/controller/MemberCtrl.java<br>
1&rpar; 프로필 사진 수정<br>
2&rpar; 비밀번호, 주소, 연락처 수정
5. 회원검색<br>
/member/searchMem.jsp<br>
/mvc/controller/MemberCtrl.java<br>
1&rpar; 회원 이메일 주소 혹은 닉네임 검색
6. 채팅<br>
/chatting/chatForm.jsp<br>
/mvc/controller/ChatHandler.java<br>
1&rpar; 채팅을 하고자 하는 회원 타임라인으로 이동한 후 message 버튼을 클릭하면 채팅창으로 이동<br>
2&rpar; 상대방에게는 채팅 요청을 알리는 alert창이 뜨고, 확인 버튼 클릭 시 해당 채팅창으로 이동
7. 지도 검색 및 후기 리스트<br>
/no/go.jsp<br>
/mov/controller/SportCtrl.java<br>
1&rpar; 다음 지도 API 사용<br>
2&rpar; 검색명을 입력한 후 검색버튼을 클릭하면 입력한 검색명과 관련된 장소 리스트가 출력되고 지도상에도 표시 됨<br>
3&rpar; 후기 탭 버튼을 클릭하면 후기 리스트를 볼 수 있음
8. 후기작성<br>
/no/go_write.jsp<br>
/mov/controller/SportCtrl.java<br>
1&rpar; 하단 쓰기 버튼을 클릭하면 장소와 후기 내용을 작성할 수 있는 페이지로 이동


# Stim
스팀은 열기, 자극이라는 의미로 개인 운동에 활기를 넣어주는 어플리케이션을 개발하자는 취지와 어울려 이름짓게 되었습니다. 시중에 PT상품은 높은 가격으로 형성되어 있습니다. 아무래도 가격이 큰 걸림돌인 것은 사실입니다. 또한 혼자 운동하는데 효율이 나지 않아 고민인 사람도 많이 있다는 것을 알게 되었습니다. 스팀은 이러한 문제를 해결할 수 있을 것입니다. 혼자 운동하더라도 PT받는 것처럼 열정적으로 운동할 수 있는 특별한 서비스, 운동인을 위한 건강한 커뮤니티를 만드는 것을 목표로하고 있습니다.  
<br/><br/>


## 활용기술
SwiftUI, MVVM, Firebase
<br/><br/>


## 초기화면
일반적인 회원가입처럼 여러 사용자 정보를 기입하는 방식이 아니라, 모바일 전용앱인 만큼 휴대폰이 인증 후 이메일 패스워드를 입력하도록하였습니다. 최소한의 정보만 입력함으로서 최대한 간편하면서 익숙한 사용자 경험을 제공하는 것에 초점을 두었습니다. 
<br/><br/>


![title](stim-signup.gif)
<br/><br/>


### Implements & Learn
- FirebaseStore CRUD
- Dependency Injection
- Transition
- Custom Modifires
- Error Control
- Extensions
- SwiftUI property wrappers
   - @EnvironmentObject
   - @ObservedObject
   - @FocusState
   - @State
   - @Published
   - @Binding
<br/>


### Why Firebase?
이전에 사용한 svelteKit으로 node server를 구축할까도 생각했지만 기획, 디자인, 개발 전반적으로 모든 부분을 커버해야해서 백엔드 개발에 시간과 리소스를 줄여야겠다고 판단했습니다. 파이어베이스는 쉽고 빠르게 프로토타입을 개발하면서 실제 런칭에서도 안정적으로 확장할 수 있는 방법이었고 여러 대체자원들 중에 나에게 가장 읽기 편한 문서를 가져 선택하게 되었습니다.
<br/><br/>

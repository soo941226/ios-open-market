# 𝞫. 프로젝트를 진행하며 겪었던 고민들, 문제들
<sub>정말 많았는데... 이걸 다시 상기하고 쓰려니 겁이 난다...</sub>

* 목차
    * [1. HTTP 메소드 관련 이름 짓기](#1-method-naming-related-with-httpmethods)
    * [2. 모델링](#2-modeling)
    * [3. 네트워크 응답에 대한 처리](#3-network-response)
    * [4. 테스트에서의 옵셔널 강제 언래핑](#4-forced-unwrapping-optional-in-test)
    * [5. 네트워크 테스트](#5-network-test)
    * [6. 멀티파트폼](#6-multipartform-data-)
    * [7. 화면구현](#7-sceneview-implementation)
    * [8. 네트워크 에러 핸들링](#8-networking-error-handling)

<br>

---

<br>

### 1. Method naming related with httpMethods
 * 기존에는 get이나 set과 같은 말은 이미 스위프트에서 사용되고 있는 예약어이므로 지양하라는 말을 들어왔다
 * 하지만 HTTP의 메소드 종류에도 get과 같은 이름을 가지고 있는 게 있었고, 이 성질을 메소드의 이름에서 녹여내려면 결국에는 그 이름을 그대로 사용하는 게 좋을 것 같다는 느낌이 들었다
 * 그래서 getGoodsList, postGoods과 같은 이름들을 사용하게 됐다

<br>

---

<br>

### 2. Modeling
 * 타입의 이름과, 이에 대한 역할 및 책임 등에, SOLID를 계속 생각하며 아주 많이 고민하였다
 * 아직까지도 선뜻 이게 최선이라고 이야기를 못하겠다. 너무 어렵다...

<br>

---

<br>

### 3. Network response 
 * completionHandler를 단순하게 넘겨주고 싶었는데
 * 생각해보니 응답이 에러가 발생할 수도 있다는 점에서 정상과 에러에 대한 각각의 completionHandler를 넘겨줘야 하는 건가 싶었다
 * 아니면 에러는 completionHandler를 사용하지 않고 범용적으로 처리를 하거나...
 * 고민을 하는 도중 캠퍼 분들이 공유해주신 내용 중 Result를 사용하는 사례를 발견하였고, Result라는 이름과 너무나도 잘 매칭이 되고 사용할 수 있겠다는 생각에 적극적으로 사용하게 되었다
 * Result 타입을 사용한 건 진짜 신의 한 수가 아니었나 싶다... 지금도 아주 만족스럽게 생각한다

<br>

---

<br>


### 4. Forced-unwrapping Optional in Test
 * 테스트만 하려고 했는데 이것까지 고민을 하려니 내용이 너무 장황해져서, 에러면 그냥 고치고 끝내면 되니 일단 다 강제로 다 벗겼었다
 * 그리고 내심 탐탁치 않았기에 라자냐에게 이에 대한 질문을 남겼었다
 * 라자냐는 문서를 공유해주셨는데, 읽고 보니 강제 언래핑이 테스트 프로젝트의 목적과는 다소 거리가 있는 문법이라는 생각이 들었다
 * 왜냐하면 테스트를 작성하는 게 스스로의 코드를 신뢰할 수 있게 하는 것에 목적이 있는 것인데,
 * 강제언랩핑을 한다는 것은 그 부분은 오히려 어떤 조치가 취해져있지 않기 때문에 신뢰를 할 수 없게 되기 때문이다

<br>

---

<br>

### 5. Network Test
 * 이번 프로젝트는 모델들이 JSON에 알맞게 잘 사용이 되는지 테스트하는 모델 테스트와(프로젝트 명세서에 명시된 사항)
 * 실제로 네트워킹이 잘되는지 확인하는 네트워크 테스트로 구분하여 진행하고자 했다(내 희망 사항)
 * 하지만 실제로 async한 closure을 테스트 하려니 XCTest가 실행되는 thread가 이를 기다리지 않기 때문에, 테스트가 정상적으로 되지 않는 이슈가 있었다
 * Semaphore를 사용해야 하나? 싶었지만 기다림에 쓸 수는 있겠지만, 적절한 사용처가 아닌 것 같아(공유자원은 아닌 것 같아) PR을 할 때에 질문을 남겼었다
 * 라자냐는 이번에도 문서를 공유해주셨는데, 3편까지 연재가 되어있는 제법 긴 내용이었다
 * 공부를 하는 과정에서 XCTestExpectation과 XCTest.wait과 같은 메소드들을 확인할 수 있고, 이를 사용하여 처리하게 됐다

<br>

---

<br>

### 6. Multipart/form-data를 작성하기
 * 이번 프로젝트에서 가장 어려웠던 것은 이것이었다고 생각된다. 네트워킹을 하기 위해서는 서버에서 정의한 request type인 이 녀석을 작성할 수 있어야 했다
 * 자료가 많기는 했지만 대부분 이 녀석이 무엇인지는 뭔지 정확히 이야기를 안해놓고, 어떻게 작성하는지만 써놓아서... 뭐가 틀리면 어디가 틀렸는지 몰라서 더 이해가 안가서 많이 화가 났었다
 * 고민을 하는 시점에 결국 내가 제대로 공부를 못한 게 원인이라는 것을 깨닫고, 일단은 공부를 했다...
 * 동기 캠퍼분들의 강의를 듣거나 도움을 받으면서 점점 이해가 가게 되었고, 작성을 할 수 있었다. 정말 통쾌한 기분이었다

<br>

---

<br>

### 7. Scene(view) implementation
 * 이번 프로젝트에서 가장 힘들었던 것은 이거였다... 에러를 너무 많이 만나서 중간에 진짜 화가 많이 났다
 * 특히 XCode의 인스펙터에서 사용되는 내용들이 너무 많고 복잡해서, 또 코드에서 사용되는 이름과 상이한 내용도 있어서, 정신이 하나도 없었다...(당시에 컨디션 조절도 못한 것도 있어서 더 힘들었다)
 * 결국 문제를 해결하기 위해서는 문제를 알아야하고, 문제를 알려면 공부를 해야했다...
 * LLDB를 사용하여 Symbol에 break-point를 걸어 문제를 확인하기도 했고
 * 각각의 뷰의 속성들, 그 속성들이 무엇인지 많이 파헤쳐보면서 내가 알고 모르는 것들이 점차 구분이 되어가기 시작했다
 * 그 와중에도 삽질을 엄청하긴 했다... CHCR의 우선순위와 관련된 내용이나, delegate가 메소드를 호출하는 순서나...
 * 그래도 오랜 삽질 끝에 마침내 에러없이 화면이 나왔고 진짜 행복했다

<br>

---

<br>

### 8. Networking-error Handling
 * 예를 들어 응답코드가 400번대나 500번대 일 때... 어떻게 처리를 해야하는가? 에 대한 고민이었다
 * 스스로의 유저 경험에서는 이런 에러를 마주한 적이 별로 없었던 것 같았다(내가 만들면서 보니 앱들을 진짜 기깔나게 만들었구나 싶었다...)
 * 일단은 에러에 대해서 guard만 하고 별다른 액션은 취하지 않았는데, 라자냐의 말로는 로그를 남기거나 한다고 한다
 * 사용자에게 전파될 필요가 있는 경우도 있고, 이럴 때에는 경고를 띄운다거나...
 * 이건 사실 아직까지도 해결이 안된 이슈다. 조금 더 고민이 필요할 거 같다 ㅎㅎ...
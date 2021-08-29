# 𝞪. 이번 프로젝트를 통해 학습한 것

* 목차
  * [1. Network](#1-network)
  * [2. URLSession](#2-urlsession)
  * [3. UICollectionView](#3-uicollectionview)
  * [4. Layout](#4-layout)
  * [5. Unit-Test](#5-unit-test)
  * [6. 그 밖에...](#6-else)

<br>

---

<br>

### 1. Network
| 주제 | 내용 |
| --- | --- |
| TCP / IP | `TCP`: Transfer Control Protocol <br> `IP`: Internet Protocol <br> `TCP / IP`: 인터넷을 통한 전송 제어 프로토콜(POP와 유사하다는 느낌을 받았다)|
| HTTP / HTTPS | `HTTP`: Hyper Text Transfer Protocol <br> `Hyper Text`: HTML(Hyper Text Markup Language) -> 웹에서 사용되는 문서양식 <br><br> 즉, HTTP란 웹에서 사용되는 문서를 주고 받는 데에 사용되던 규약이다 <br> 하지만 웹이 발전하고 이에 대한 기능들이 매우 다양해지고 무거워짐에 따라, 여러가지의 메소드로 분리하여 사용된다고 한다 <br><br> `HTTPS`: TCP/IP처럼 TLS를 같이 사용하는 HTTP <br> `TLS(SSL)`: Transport Layer Security(Secure Socket Layer) <br> - 보안을 위한 계층 <br> - 장점: HTTP는 통신 중 이것을 훔쳐보면 데이터가 적나라하게 드러나는데, 이 보안 계층을 통해 이러한 내용을 숨길 수 있다. <br> - 단점: 제대로 사용하지 못하면 속도가 최대 10배까지 느려지거나, 개발자가 제대로 사용하지 못하여 HTTP와 HTTPS가 혼용될 경우 신뢰할 수 없는 사이트가 된다고 한다|
| HTTP Method | `GET`: GET 하는 것 <br> `DELETE`: DELETE 하는 것 <br> `HEAD`: 리소스에 대한 메타데이터만 요청하는 것(이미지의 이름이나 형식처럼) <br> `POST`: 멱등성이 없는 데이터 조작 요청(CREATE) <br> `PUT`: 멱등성이 있는 데이터 조작 요청(UPDATE) <br> `PATCH`: 멱등성이 있을 수도 있고 없을 수도 있는 데이터 조작요청(Partial UPDATE) <br>`그 외`: 다른 메소드들도 있고 공부는 했으나, 프로젝트와 크게 관련이 없는 듯하여 금방 잊어버렸다|
| HTTP Status | `200번대`: Success <br> `300번대`: Redirection <br> `400번대`: Client Error <br> `500번대`: Server Error <br> 자세한 내용을 전부 외우기에는 너무 많았고, 이걸 공부할 당시에 애플의 공식 Swift Documentation이 분명히 자기네들이 잘못해서 홈페이지가 안들어가졌음에도, 400번대 에러를 뱉는 것을 보며 생각보다 정확하게 사용되지는 않는 듯한 느낌을 받아 그냥 그런 거구나 라는 식으로 넘겼다 <br> [HTTP 상태 코드(위키백과)](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C)
| Session | 정의가 다소 난해해서 바로 읽히지 않았는데, 여러 컴퓨터 사이에서, 그 컴퓨터들의 연결 상태들에 대한 기록. 기록이라는 점에서 시간을 포함할 수 있다 <br> [세션(위키백과)](https://ko.wikipedia.org/wiki/세션_(컴퓨터_과학)) |
| URL | Uniform Resource Locator <br> 자원의 위치를 가리키는 주소, 규약, 참조 |
| form-data | 하냐의 양식form으로 정의된 데이타셋data <br> 이 양식을 만드는 게 처음엔 많이 까다롭지만, 만들고 나면 돌려쓰면 되는 거라서 편한 장점이 있었다 <br> 주요 특징으로는 boundary라는 것이 필요하고, 양식의 마지막에 있는 boundary는 --을 뒤에 달아 닫아줘야 했다는 점, 계행을 \n이 아니라 \r\n을 사용해야 했다는 점이 있었다. 또 데이터가 배열로 들어가는 form의 경우에는 name에 []을 추가적으로 명시해야했다는 점...|
| multipart / form-data | 위의 form-data를 여러개를 가지고 있는 data-set | 
| Cache | - 캐시란 주체가 필요한 데이터를 미리 저장을 해놓고 제공하는 것이다 <br> - 컴퓨터 구조에서 사용되던 캐시메모리는, 이 개념을 사용한 하나의 사례라고 볼 수 있다(여기서의 주체는 CPU) <br> - 자주 사용되는 데이터를 저장하거나, 곧 사용할 데이터를 미리 저장해서 이 데이터에 접근하는 오버헤드를 줄이는 게 목적이다 <br> - 둘을 분리해서 언급했으나 데이터를 미리 저장해놓고 이에 대한 접근을 빠르게 하는 게 목표라고 할 수 있겠다 <br> - 주체에 따라 다양한 캐싱이 존재한다. 캐싱 서버, 메모리 캐싱, 파일 캐싱 등등... 반드시 캐시 메모리에 캐시를 하는 것은 아니다 단지 하나의 사례일 뿐이다 | 
| API | - Application Programming Interface <br> - 개발자 사이에 공유해야하는 명세서를 API라고 부르는 것으로 이해했다 |
| 네트워크를 공부하면서 부수적으로 공부가 된 내용 | `UUID`: Universal Unique Identifier, 중복이 발생할 가능성은 있지만 보편적으로 유니크하다고 인정하는 ID(대충 easd13-asd21-123asd와 같은 형식) <br> `Result`: 테스트에서만 사용을 하던 타입이었는데, 네트워크에 대한 결과에도 매우 유용하게 사용할 수 있는, 정말로 Result 그 자체인 타입이었다) |


<br>

---

<br>

### 2. URLSession
* 이것에 대해 공부하기에 앞서 URL이 무엇이고 Session이 무엇인지 짚고 넘어갈 필요가 있어서 공부를 했었다

| 주요 내용 | 설명 |
| --- | --- |
| 4가지 타입 | `shared`: 초기화가 필요없는, 애플에서 만들어놓은 싱글톤 인스턴스. 설정도 따로 할 필요가 없다 <br> `default`: 초기화가 필요하다. 사용자 설정 및 delegate를 사용할 수 있다 <br> `ephemeral`: `default`와 유사하나 캐쉬, 쿠키, 자격증명 등을 디스크에 쓸 수 없다 <br> `background`: 앱이 background 상태일 때에 사용되는 세션. 주로 download나 upload task를 위해 사용된다고 한다|
| 4가지 역할 | `dataTask`: 짧지만 자주 서버와 통신하는 task. 일반적으로 생각하는 task는 거의 모두 이것이다 <br> `uploadTask`: 파일 단위의 업로드를 할 때, 또 특히 앱이 비동작중일 때에도 데이터를 보내는 task <br> `downloadTask`: 파일에서 data를 검색하거나, 앱이 비동작중일 때에도 data를 받는 task <br> `webSocketTask`: TCP와 TLS를 통해 메시지를 교환한다고 한다. dataTask와 정확한 차이점은 모르겠으나, 웹소켓 프로토콜을 사용한다고 한다. 공부할 게 많아서 이것까지는 자세하게 공부를 하지 못했다... |
| URLSessionTaskDelegate | URLSession도 delegation pattern을 채택한 타입인데, 인증 실패, 서버에서 데이터가 도착했을 때, 데이터 캐싱과 관련된 기능들을 URLSessionTaskDelegate를 통해 구현할 수 있다 |
| Async, Concurrent | - 알아서 비동기적으로 돌아간다. <br> - cancel과 관련된 기능들을 제공한다고 하는데 그런 점에서 내부적으로 OperationQueue를 사용하는 것이 아닌가 하는 짐작을 하고 있으나 정확히 모르겠다. <br> - UIKit과 관련된 내용들은 다시 메인스레드에서 돌아가도록 조정해줘야 한다 |

<br>

---

<br>

### 3. UICollectionView

| 주요 내용 | 설명 |
| --- | --- |
| UICollectionView | UITableView가 다소 정적으로 데이터를 보여준다면, UICollectionView는 아주 동적으로 데이터를 보여줄 수 있다 <br> 하지만 내부적으로 돌아가는 전체적인 흐름은 UITableView와 유사했다 <br> Delegation Pattern을 채택하여 UI와 Data를 매니징하는 점과 reuseableQueue를 통해 cell을 재사용한다는 점, IndexPath를 사용한다는 점이 특히 그랬다|
| UICollectionViewCell | UICollectionView는 특히 주의할 점이 cell과 data를 prefetch하는 것이 기본적으로 참이라는 점이다. <br> 플로우를 잘 이해하여 후술할 delegate와 dataSource를 적절히 사용하는 것이, 그렇게 함으로써 cell의 기능을 구분하고 분리하는 것이 에러를 더 적게 일으키는 방법이 될 수 있겠다|
| UICollectionViewDelegate | 유저와의 상호작용에 사용되는 delegate, display와 같은 실제로 UI와 관련된 요소는 이 delegate를 통해 구현할 수 있다 |
| UICollectionViewDataSource | 셀과 데이터를 매니징하는 delegate, 셀을 생성하고, 데이터를 셀을 초기화하거나 데이터를 입력받거나... 이런 건 여기서 해야한다. 강제되는 건 아니지만 그렇게 함으로써 각자의 책임을 명확히 할 수 있을 것이다 |
| UICollectionViewDelegateFlowLayout, UICollectionViewDiffableDataSource | - 앞서 말한 delegate들을 확장하려는 시도가 엿보인다 <br> - 각각 Delegate와 DataSource로부터 뻗어 나온 새로운 프로토콜이다. 실제로 사용까지 해보고 싶었으나, 뇌용량의 한계에 부딪혀 일단 기본형이 되는 녀석들만 제대로 해보자는 마음으로 공부를 하고 구현을 했다

<br>

---

<br>

### 4. Layout

| 주요 내용 | 설명 |
| --- | --- |
| CGPoint | 2차원 좌표를 가지고 있는 구조체(x,y) |
| CGSize | 2차원 크기를 가지고 있는 구조체(width, height) |
| CGRect | 2차원 좌표와 크기를 가지고 있는 구조체(CGPoint, CGRect) |
| Frame | superview로부터의 CGRect |
| Bounds | self로부터의 CGRect |
| Frame? Bounds? | - 활용사례를 생각하면 좋다 <br> - Frame은 superview의 CGRect이기 때문에, Superview에게 영향을 받아 값을 가지고 있고 화면에 그려진다 <br> - Bounds는 self의 CGRect이기 때문에, 이것의 Subview들에게 영향을 준다|
| Offset | CGPoint, bounds.origin과 같다 <br> 즉 해당 뷰가 시작하는 지점(중심?)을 가리키고 있다고 보면 된다 |
| Inset | - 뷰의 내부 여백 <br> - 왜 괜히 헷갈리게(?) offset inset 이렇게 해놨을까? 내가 모르는 어떤 지식으로 이 둘이 명료하게 구분이 되는 건가? |
<br>

---

<br>

### 5. Unit-Test
* 새로 알게 된 내용과 함께, 이미 공부했던 내용도 있었으나 제대로 모르고 있었던 내용도 있어 복습을 하고 다시 정리를 했다

| 주요 내용 | 설명 |
| --- | --- |
| Test-Double(이하 TD) | - 테스트를 위한 스턴트맨들 <br> `dummy`: 아무런 기능은 없으나(실사용은 않으나) 단지 존재가 필요해 만들어 놓는 TD <br> `stub`: 결과를 반환하는 기능이 있는 TD (stub ⊃ dummy) <br> `spy` stub이면서 값을 기록하여 가지고 있는 TD (spy ⊃ stub) <br> `fake`: 실은 매우 복잡한 개체지만 단순화 한 개체, 주로 DB (spy ⊃ fake) <br> `mock`: 위의 내용들이 어떤 값, 상태를 위한 TD라면, mock은 행위에 대한 TD로 행위에 대한 분기, 복잡한 행위를 간단하게 증명한다거나 하는 TD이다. XCTest가 Asset를 사용한다는 점에서 Mock의 한 종류라고 볼 수 있겠다 |
| XCTestExpectation | - 비동기 클로저, 특히 네트워크 테스트에 사용할 수 있는 타입 <br> - expectedFulfillmentCount라고 하는 프로퍼티와 fulfill이라고 하는 메소드를 통해서 어떤 상태를 충족했는지 안했는지를 검증할 수 있다 |
| XCTestCase.wait(for:, timeout:) | - for에는 [XCTestExpectation]가 들어가고 timeout에는 TimeInterval이 들어간다 |
| Network-Test | 위의 2가지 내용을 응용하여 실제로 네트워크를 이용하는, 서버와 통신하는 내용을 테스트 할 수 있다 |

<br>

---

<br>

### 6. else...
| ***프로젝트 기간 중 공부를 하게 된 내용*** |
| --- |
| 공부는 했으나 실사용은 못해봤기에 제대로 된 복습이 필요할 것 같다 |
| iOS File System |
| CoreData |
| NSCache |
| Proxy |

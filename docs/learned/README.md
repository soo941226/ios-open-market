# 𝞪. 이번 프로젝트를 통해 학습한 것


### 1. Network
| 주제 | 내용 |
| --- | --- |
| TCP / IP | `TCP`: Transfer Control Protocol <br> `IP`: Internet Protocol <br> `TCP / IP`: 인터넷을 통한 전송 제어 프로토콜(POP와 유사하다는 느낌을 받았다)|
| HTTP / HTTPS | `HTTP`: Hyper Text Transfer Protocol <br> `Hyper Text`: HTML(Hyper Text Markup Language) -> 웹에서 사용되는 문서양식 <br><br> 즉, HTTP란 웹에서 사용되는 문서 주고 받는 데에 사용되던 규약이다 <br> 하지만 웹이 발전하고 이에 대한 기능들이 매우 다양해지고 무거워짐에 따라, 여러가지의 메소드로 분리하여 사된다고 한다 <br><br> `HTTPS`: TCP/IP처럼 TLS를 같이 사용하는 HTTP <br> `TLS(SSL)`: Transport Layer Security(Secure Socket Layer) <br> - 보안을 위한 계층 <br> - 장점: HTTP는 통신 중 이것을 훔쳐보면 데이터가 적나라하게 드러나는데, 이 보안 계층을 통해 이러한 내용을 숨길 수 있다. <br> - 단점: 제대로 사용하지 못하면 속도가 최대 10배까지 느려지거나, 개발자가 제대로 사용하지 못하여 HTTP와 HTTPS가 혼용될 경우 신뢰할 수 없는 사이트가 된다고 한다|
| HTTP Method | `GET`: GET 하는 것 <br> `DELETE`: DELETE 하는 것 <br> `HEAD`: 리소스에 대한 메타데이터만 요청하는 것(이미지의 이름이나 형식처럼) <br> `POST`: 멱등성이 없는 데이터 조작 요청(CREATE) <br> `PUT`: 멱등성이 있는 데이터 조작 요청(UPDATE) <br> `PATCH`: 멱등성이 있을 수도 있고 없을 수도 있는 데이터 조작요청(Partial UPDATE) <br>`그 외`: 다른 메소드들도 있고 공부는 했으나, 프로젝트와 크게 관련이 없는 듯하여 금방 잊어버렸다|
| HTTP Status | `200번대`: Success <br> `300번대`: Redirection <br> `400번대`: Client Error <br> `500번대`: Server Error <br> 자세한 내용을 전부 외우기에는 너무 많았고, 이걸 공부할 당시에 애플의 공식 Swift Documentation이 분명히 자기네들이 잘못해서 홈페이지가 안들어가졌음에도, 400번대 에러를 뱉는 것을 보며 생각보다 정확하게 사용되지는 않는 듯한 느낌을 받아 그냥 그런 거구나 라는 식으로 넘겼다 <br> [공부했던 문서(위키백과)](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C)

<br>
---
### 2. URLSession
* 
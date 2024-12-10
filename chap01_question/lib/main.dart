import 'package:flutter/material.dart';


// flutter 어플리케이션 진입점이 되는 메소드
void main() {
  // 주어진 위젯을 기준으로 위젯 트리를 만든다.
  runApp(const MyApp());
}

//한번 생성되면 변경되지 않은 위젯
//myapp 은 플루터 앱의 루트 위젯이다
/*
* 앱의 전반적인 테마 설정 - 텍스트 스타일, 버튼 스타일 등
* 홈 페이지 설정 - home 속성을 통해서 처음 앱을 실행할 때 보여줄 초기 화면 지정
* 라우팅 및 내비게이션 설정 등등
* */


class MyApp extends StatelessWidget {
  const MyApp({super.key});
/*
* build()
* - 위젯 트리를 구성하고 해당 트리를 기반으로 화면에 표시될 UI를 정의하는 메소드
* */
  // This widget is the root of your application.
  @override
  /*메테리얼 - 안드로이드에 적용하려고 구글이 만든 디자인 규칙이다.
  * - 하지만 꼭 안드로이드 전용으로 동작하는 것은 아니다.
  * 플러터는 크로스 플랫폼 프레임워크이기 때문에 , MeterialApp 을 사용한 앱도
  * IOS 웹 데스크탑 등 다양한 플랫폼에서 실행될 수 있다.
  *
  * flutter 어플리케이션은  material Design 을 기반으로
  * 전반적인 테마, 라우팅, 기본 스타일 및 네비게이션을 관리한다.
  *
  * 주요 속성
  * - title = 앱의 제목을 설정한다
  * - theme = 앱의 기본 테마를 정의한다. 색상 텍스트 등
  * - home = 앱의 기본화면을 설정한다. 일반적으로 첫 번째 화면을 표시하는 위젯
  * - routes = 라우팅을 정의하는데 사용한다.
  * */
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title:" 우리들의 첫 플러터 app"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title}); // 이거해줌 필수로 해야하는것
  final String title;

  @override
  Widget build(BuildContext context) {

    /* Scaffold 는 기본적인 화면의 구조를 제공한다
    * Flutter 에서 기본적인 화면 구조를 쉽게 설정할 수 있게 해 주는 위젯
    * 속성
    * - appbar = 앱의 상단에 표시되는 앱바
    * - body = 화면의 메인 콘텐츠 영역
    * - drawer = 앱의 왼쪽에서 오른쪽으로 스와이프 해 열 수 있는 네비
    * - bottomNavigationBar*/
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("네비바 테스트"),
            ],),
        leading: Icon(Icons.arrow_back), //왼쪽
        actions: [
          Icon(Icons.star),
          SizedBox(width: 30),  // 아이콘 간격을 8픽셀로 설정
          Padding(
            padding: EdgeInsets.only(right: 50.0),  // 오른쪽에 12픽셀 여백 추가
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      //화면의 메인 컨텐츠 영역
      body: Center(
        child: Image.asset("assets/6.png"),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.home),Icon(Icons.search),Icon(Icons.menu),
            Icon(Icons.close)],
          ),
        ),
      ),
    );
  }
}


/*
*  위젯?
* - html 의 개발방식은 태그 <p> 안녕하세요~ 감사해요~ 잘있어요~ 다시만나요 </p>
*
* - flutter 는 위젯을 사용
* - 글자를 넣고 싶으면  Text 이미지는 image
* - 네모박스 혹은 컨테이너는 Container()
* */
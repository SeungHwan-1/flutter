

/*
 다트는 배열은 따로 제공하지않는다.
 리스트와 맵을 제공하고,데이터의 추가 조회 수정 삭제가 가능하다.
 */




void collectionTest(){

  print("---- list -----");

  List<String> foods = ["동파육","탕수육"];

  print(foods.length);
  print(foods.first);

  print(foods[0]);
  print(foods[1]);
  
  //수정
  
  foods[0] = "크림새우";  //값들어올때
  print(foods);


  //삭제
  foods.remove('크림새우');
  print(foods);

  foods.removeAt(0);
  print(foods);

  print("---- Map -----");


  // dynamic - 타입을 명시적으로 지정하지 않고 동적으로 결정할 수 있다.
  //서로 다른 타입의 값도 할당할 수 있다.
  Map<String, dynamic> person = {"name":"홍길동","age":12,"gender":"남"};

  print(person);
  print(person['name']);

  //없는 값을 조회해도 에러가 나지 않는다.
  print(person["test"]);

  // 새로운 키를 넣어서 값을 추가할 수있다.
  person['hobby']=["축구","농구"];
  print(person);


  // 수정 - 기존에 존재하는 키 벨류 값에 새로운 값을 넣는다
  person['age'] = 21;
  print(person);


  // 삭제

  person.remove('hobby');
  print(person);
}
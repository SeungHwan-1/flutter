import 'package:dio/dio.dart';

class MenuModel {

  // 메뉴 조회
  Future<List<dynamic>> searchMenu() async {
    final dio = Dio();

    try{
      final response = await dio.get("http://localhost:8080/menu/select");

      if(response.statusCode == 200){
        return response.data as List<dynamic>;
      }else{
        throw Exception("로드실패");
      }
    } catch(e){
      print(e);
      throw Exception("Error : $e");
    }
  }

  // 메뉴 삽입
  Future<String> insertMenu(Map<String, dynamic> menuData) async {
    final dio = Dio();
    try {
      final response =
      await dio.post("http://localhost:8080/menu/insert", data: menuData);

      if (response.statusCode == 200) {

        return "삽입 성공적으로 수행되었습니다.";
      } else {
        return "실패하였습니다.";
      }
    } catch (e) {
      throw Exception("에러 : $e");
    }
  }


  // 메뉴 수정

  Future<String> updateMenu(Map<String, dynamic> menuData) async {
    final dio = Dio();

    try {
      final response =
          await dio.post("http://localhost:8080/menu/update", data: menuData);

      if (response.statusCode == 200) {
        //json 데이터를 list로 변환
        return "수정이 성공적으로 수행되었습니다.";
      } else {
        return "실패하였습니다.";
      }
    } catch (e) {
      throw Exception("에러 : $e");
    }
  }
  Future<String> deleteMenu(Map<String, dynamic> menuData) async {
    final dio = Dio();

    try {
      final response =
      await dio.post("http://localhost:8080/menu/delete", data: menuData);

      if (response.statusCode == 200) {
        //json 데이터를 list로 변환
        return "삭제가 성공적으로 수행되었습니다.";
      } else {
        return "실패하였습니다.";
      }
    } catch (e) {
      throw Exception("에러 : $e");
    }
  }
}

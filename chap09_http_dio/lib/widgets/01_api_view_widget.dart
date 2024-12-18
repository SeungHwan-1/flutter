
import 'package:chap09_http_dio/models/01_api_model.dart';
import 'package:flutter/material.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  final ApiModel apiModel = ApiModel();
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts(); // 제일먼저이걸받아와서 sjgdjwna
  } // 받아올 게시글 목록



  // 게시글 목록을 로드하는 함수
  Future<void> _loadPosts() async{
    try{
      List<dynamic> posts = await apiModel.fetchGets2();
      setState(() {
        _posts = posts;
      });
    }catch (e){
      print("오류발생 $e");
    }

  }



  // 오류 메시지를 띄워주는 함수
  void _showErrorDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("오류"),
        content: Text("게시글을 불러오는 데 실패 했습니다."),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("확인"))
        ],
      );
    });

  }
  //게시글을 삭제하는 함수
  void _deletePost(int postId) {
    setState(() {
      _posts.removeWhere((post) {
        return post['id'] == postId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child: Column(

      children: [
        Expanded(
            child: _posts.isEmpty
                ?  Center(
                   child: CircularProgressIndicator(),
                    )
            : ListView.builder(itemCount : _posts.length,

            itemBuilder:(context,i){
              return ListTile(
                title: Text(_posts[i]['title']),
                subtitle: Text(_posts[i]['body']),
                trailing: IconButton(onPressed: (){
                  _deletePost(_posts[i]['id']);
                }, icon: Icon(Icons.delete)),
              );
              }))
      ],
    ),
    );
  }
}


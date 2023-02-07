import 'package:dio/dio.dart';
import 'package:example_fakeapi_books/home/service/home_view_service.dart';
import 'package:example_fakeapi_books/model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewService _service;
  List<BooksModel>? _items = [];
  final String _baseUrl = 'https://fakerestapi.azurewebsites.net/api/v1/';

  @override
  void initState() {
    super.initState();
    _service = HomeViewService(Dio(BaseOptions(baseUrl: _baseUrl)));
    fetchDatas();
  }
  Future<void> fetchDatas() async {
    _items = await _service.fetchBooks();
    // eğer veriler geldiğinde setState çalışmazsa ekranda gözükmez
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
        itemCount: _items?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${_items?[index].title}'),
              subtitle: Text('${_items?[index].description}'),
            ),
          );
        },
      )),
    );
  }
}

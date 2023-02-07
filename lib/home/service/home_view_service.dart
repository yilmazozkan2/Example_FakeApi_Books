import 'package:dio/dio.dart';
import 'package:example_fakeapi_books/model/home_view_model.dart';

// https://fakerestapi.azurewebsites.net/api/v1/Books
class HomeViewService {
  Dio dio;
  HomeViewService(this.dio);


  Future<List<BooksModel>?> fetchBooks() async {
    final String url = '/Books';

    final  response = await dio.get(url);
    if (response.statusCode == 200) {
      final body = response.data;
      print(body.toString()+response.statusCode.toString());
      if (body is List) {
        return body.map((e) => BooksModel.fromJson(e)).toList();
      }
    } else {
      print('İstek başarısız oldu ${response.statusCode}');
    }
    return null;
  }
}

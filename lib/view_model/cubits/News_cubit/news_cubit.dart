import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/news/article.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  var filteron = false;
  bool isSeleccted = false;
  List<String> Filters = [
    'Recommended',
    'Latese',
    'Most Viewed',
    'Channel',
    'Following'
  ];
  TextEditingController sarechController = TextEditingController();

  static NewsCubit get(context) => BlocProvider.of(context);
  final Dio dio = Dio();
  List<Article> artcles = [];

  var SelectedFilter = -1;
  void ChangeSelectedFilrer(int index) {
    SelectedFilter = index;
    emit(SelectedFilterState());
  }

  Future<void> gitHttp() async {
    if (sarechController.text == '') {
      sarechController.text = 'all';
    }

    print('after');
    //
    dio.get('https://newsapi.org/v2/everything', queryParameters: {
      'q': sarechController.text,
      'apiKey': '96124f11649f43da8c3f6c73733dbb2c',
      'pageSize': 50,
    }).then((value) {
      artcles.clear();

      for (var i in value.data['articles']) {
        Article artcle = Article.fromJson(i);
        artcles.add(artcle);
      }
      emit(GetNewsSuccessState());
    }).catchError((error) {
      emit(GetNewsFieldState());
    });

    print('before');
    print(artcles.length);
  }

  void sesrchActive() {
    filteron = !filteron;
    print('state is ${filteron}');
    emit(SearchNewsInitial());
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapi/helper/api.dart';
import 'package:newsapi/views/business.dart';
import 'package:newsapi/views/sciences.dart';
import 'package:newsapi/views/settings.dart';
import 'package:newsapi/views/sports.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    // if (index == 1) {
    //   getSports();
    // }
    // if (index == 2) {
    //   getScience();
    // }
    emit(NewsBottomNav());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessLoaded());
    if (business.length == 0) {
      DioHelper().getData(
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'business',
          'country':'us'
        },
      ).then((value) {
        business = value.data['articles'];
        // print(business[0]['title']);
        emit(GetBusinessSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetBusinessFailure(onError.toString()));
      });
    } else {
      emit(GetBusinessSucess());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(GetScienceLoaded());
    if (science.length == 0) {
      DioHelper().getData(
        // url: 'api/1/news',
        // query: {
        //   'apikey': 'pub_380764f72cf4581d5f3edfcc3c92e2f1b8d46',
        //   'q': 'science',
        // },
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'science',
          'country':'us'
        },
      ).then((value) {
        science = value.data['articles'];
        // print(science[0]['title']);
        emit(GetScienceSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetScienceFailure(onError.toString()));
      });
    }
    else {
      emit(GetScienceSucess());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoaded());
    if (sports.length == 0) {
      DioHelper().getData(
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'sports',
          'country':'us'
        },
      ).then((value) {
        sports = value.data['articles'];
        // print(sports[0]['content']);
        emit(GetSportsSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetSportsFailure(onError.toString()));
      });
    }
    else {
      emit(GetSportsSucess());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoaded());
    search = [];
    DioHelper().getData(
        url: 'v2/everything',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'q': '$value',
        },
      ).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(GetSearchSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetSearchFailure(onError.toString()));
      });
  }
}

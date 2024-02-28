import 'dart:convert';

import 'package:news_app_clean_architecture/core/constants.dart';
import 'package:news_app_clean_architecture/core/exceptions.dart';

import '../models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<NewsModel> getAllNews();

  Future<NewsModel> getPopularNews();

  Future<NewsModel> getBreakingNews();

  Future<NewsModel> getSportsNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<NewsModel> getAllNews() async {
    final response = await client.get(Uri.parse(Constants.allNewsUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NewsModel> getBreakingNews() async {
    final response = await client.get(Uri.parse(Constants.breakingNewsUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NewsModel> getPopularNews() async {
    final response = await client.get(Uri.parse(Constants.popularNewsUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NewsModel> getSportsNews() async {
    final response = await client.get(Uri.parse(Constants.sportsNewsUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      throw ServerException();
    }
  }
}

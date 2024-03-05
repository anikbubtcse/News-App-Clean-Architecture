import 'dart:convert';

import 'package:news_app_clean_architecture/core/constants.dart';
import 'package:news_app_clean_architecture/core/exceptions.dart';

import '../../../../core/log.dart';
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
  final Log log;

  NewsRemoteDataSourceImpl({required this.client, required this.log});

  @override
  Future<NewsModel> getAllNews() async {
    final response = await client.get(Uri.parse(Constants.allNewsUrl),
        headers: {"Connection": "Keep-Alive"});

    log.debug(title: "All News Response Code", message: response.statusCode);
    log.debug(title: "All News Response", message: response.body);

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
    final response = await client.get(Uri.parse(Constants.breakingNewsUrl),
        headers: {"Connection": "Keep-Alive"});

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
    final response = await client.get(Uri.parse(Constants.popularNewsUrl),
        headers: {"Connection": "Keep-Alive"});

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
    final response = await client.get(Uri.parse(Constants.sportsNewsUrl),
        headers: {"Connection": "Keep-Alive"});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      throw ServerException();
    }
  }
}

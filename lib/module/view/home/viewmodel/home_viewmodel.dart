import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/constants/endpoint_constant.dart';
import '../../../../core/helper/snackbar.dart';
import '../../../../core/init/loading_manager/loading_manager.dart';
import '../../../model/feed_video_list_model/response/feed_video_list_model_response.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late BuildContext _context;

  @observable
  List<FeedVideoListModel> videoList = [];
  @observable
  int selectedVideo = 0;

  Future<void> setContext(BuildContext context) async {
    _context = context;
    await getWorkRequest(true);
  }

  @action
  Future changeSelectedVideo(int index) async {
    selectedVideo = index;
    index == 8 ? await getWorkRequest(false) : null;
  }

  @action
  Future getWorkRequest(bool showLoading) async {
    showLoading ? await LoadingManager.instance.showLoading(_context) : null;

    final response = await NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
        baseUrl: Endpoint.baseUrl,
        followRedirects: false,
        headers: {'Device-Id': '20f3a467-6001-471b-af09-8defc6dd7317'},
        contentType: 'application/json; charset=utf-8',
        sendTimeout: 5000,
        receiveTimeout: 10000,
        connectTimeout: 20000,
      ),
    ).send<FeedVideoListModel, List<FeedVideoListModel>>(
      Endpoint.mainFeed,
      parseModel: FeedVideoListModel(),
      method: RequestType.GET,
    );
    inspect(response);

    if (response.data != null) {
      videoList = response.data ?? [];
    } else {
      ShowSnackBar.showErrorSnackBar(_context, 'Something went wrong!');
    }
    showLoading ? await LoadingManager.instance.hideLoading(_context) : null;
  }
}

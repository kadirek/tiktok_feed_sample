import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tiktok_feed_sample/module/widgets/custom_video_player.dart';

import '../../../widgets/wrapper/stateful_wrapper.dart';
import '../viewmodel/home_viewmodel.dart';

class Home extends StatelessWidget {
  final HomeViewModel _viewModel;

  const Home({Key? key, required HomeViewModel viewModel})
      : _viewModel = viewModel,
        super(key: key);

  Future<void> init(BuildContext context) async {
    await Future.microtask(() {
      _viewModel.setContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        init(context);
      },
      child: Observer(
        builder: (_) => PageView(
            controller: PageController(initialPage: 0),
            scrollDirection: Axis.vertical,
            onPageChanged: (int index) async {
              await _viewModel.changeSelectedVideo(index);
            },
            children: _viewModel.videoList
                .map(
                  (e) => Observer(
                    builder: (_) =>
                        CustomVideoPlayer(videoUrl: _viewModel.videoList[_viewModel.selectedVideo].url ?? ''),
                  ),
                )
                .toList()),
      ),
    );
  }
}

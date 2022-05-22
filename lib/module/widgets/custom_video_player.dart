import 'dart:async';
import 'dart:developer';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late BetterPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    setupVideoController();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    if (oldWidget.videoUrl != widget.videoUrl) {
      _videoPlayerController.dispose();
      setupVideoController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future setupVideoController() async {
    BetterPlayerControlsConfiguration videoConfiguration = const BetterPlayerControlsConfiguration(
      showControls: false,
      enableFullscreen: false,
    );
    BetterPlayerConfiguration configuration = BetterPlayerConfiguration(
      aspectRatio: 9 / 16,
      controlsConfiguration: videoConfiguration,
    );

    _videoPlayerController = BetterPlayerController(configuration);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.videoUrl);

    await Future.microtask(() async {
      await _videoPlayerController.setupDataSource(dataSource);
      await _videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(
      controller: _videoPlayerController,
    );
  }
}

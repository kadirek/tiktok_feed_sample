// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$videoListAtom = Atom(name: '_HomeViewModelBase.videoList');

  @override
  List<FeedVideoListModel> get videoList {
    _$videoListAtom.reportRead();
    return super.videoList;
  }

  @override
  set videoList(List<FeedVideoListModel> value) {
    _$videoListAtom.reportWrite(value, super.videoList, () {
      super.videoList = value;
    });
  }

  final _$selectedVideoAtom = Atom(name: '_HomeViewModelBase.selectedVideo');

  @override
  int get selectedVideo {
    _$selectedVideoAtom.reportRead();
    return super.selectedVideo;
  }

  @override
  set selectedVideo(int value) {
    _$selectedVideoAtom.reportWrite(value, super.selectedVideo, () {
      super.selectedVideo = value;
    });
  }

  final _$changeSelectedVideoAsyncAction =
      AsyncAction('_HomeViewModelBase.changeSelectedVideo');

  @override
  Future<dynamic> changeSelectedVideo(int index) {
    return _$changeSelectedVideoAsyncAction
        .run(() => super.changeSelectedVideo(index));
  }

  final _$getWorkRequestAsyncAction =
      AsyncAction('_HomeViewModelBase.getWorkRequest');

  @override
  Future<dynamic> getWorkRequest(bool showLoading) {
    return _$getWorkRequestAsyncAction
        .run(() => super.getWorkRequest(showLoading));
  }

  @override
  String toString() {
    return '''
videoList: ${videoList},
selectedVideo: ${selectedVideo}
    ''';
  }
}

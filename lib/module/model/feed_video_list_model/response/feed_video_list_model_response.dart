import 'package:vexana/vexana.dart';

class FeedVideoListModel extends INetworkModel<FeedVideoListModel> {
  int? claps;
  String? id;
  String? title;
  String? tribeNick;
  String? tribePhoto;
  String? uploaded;
  String? url;
  String? userId;
  String? userName;
  String? userNick;
  String? userPhoto;
  int? views;

  FeedVideoListModel(
      {this.claps,
      this.id,
      this.title,
      this.tribeNick,
      this.tribePhoto,
      this.uploaded,
      this.url,
      this.userId,
      this.userName,
      this.userNick,
      this.userPhoto,
      this.views});

  FeedVideoListModel.fromJson(Map<String, dynamic> json) {
    claps = json['claps'];
    id = json['id'];
    title = json['title'];
    tribeNick = json['tribe_nick'];
    tribePhoto = json['tribe_photo'];
    uploaded = json['uploaded'];
    url = json['url'];
    userId = json['user_id'];
    userName = json['user_name'];
    userNick = json['user_nick'];
    userPhoto = json['user_photo'];
    views = json['views'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['claps'] = claps;
    data['id'] = id;
    data['title'] = title;
    data['tribe_nick'] = tribeNick;
    data['tribe_photo'] = tribePhoto;
    data['uploaded'] = uploaded;
    data['url'] = url;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_nick'] = userNick;
    data['user_photo'] = userPhoto;
    data['views'] = views;
    return data;
  }

  @override
  FeedVideoListModel fromJson(Map<String, dynamic> json) {
    return FeedVideoListModel.fromJson(json);
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../module/widgets/custom_progress_indicator.dart';

class LoadingManager {
  static LoadingManager? _instance;
  static LoadingManager get instance {
    return _instance ??= LoadingManager();
  }

  bool _isPopupShow = false;

  Future showLoading(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomProgressIndicator(color: Colors.orange, size: 20.w);
      },
    );
    _isPopupShow = true;
  }

  Future hideLoading(BuildContext context) async {
    if (_isPopupShow) {
      _isPopupShow = false;
      Navigator.of(context).pop();
    }
  }
}

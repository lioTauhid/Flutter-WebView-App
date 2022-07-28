import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {}

  @override
  Future onLoadStart(url) async {}

  @override
  Future onLoadStop(url) async {}

  @override
  void onLoadError(url, code, message) {}

  @override
  void onProgressChanged(progress) {}

  @override
  void onExit() {
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Future<PermissionRequestResponse> androidOnPermissionRequest(
      String origin, List<String> resources) async {
    return PermissionRequestResponse(
        resources: resources, action: PermissionRequestResponseAction.GRANT);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_app/web_browser.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final String _url = "https://softxbd.com/";
  final WebBrowser _webBrowser = WebBrowser();

  var options = InAppBrowserClassOptions(
    crossPlatform: InAppBrowserOptions(
        // hideUrlBar: true,
        // hideToolbarTop: true,
        toolbarTopBackgroundColor: Colors.deepPurple),
    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
        cacheEnabled: true,
        transparentBackground: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _webBrowser.openUrlRequest(
    //     urlRequest: URLRequest(url: Uri.parse(_url)), options: options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                icon: const Icon(Icons.close),
                label: const Text("Exit App")),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  _webBrowser.openUrlRequest(
                      urlRequest: URLRequest(url: Uri.parse(_url)),
                      options: options);
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Enter App"))
          ]),
        ));
  }
}

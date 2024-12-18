import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewpaid extends StatefulWidget {
 String link;

 WebViewpaid({required this.link});

  @override
  State<WebViewpaid> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewpaid> {
/*final controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.disabled)
//..loadRequest(Uri.parse("https://www.udemy.com/course/complete-python-bootcamp/"));
..loadRequest(Uri.parse(widget.link));*/
 WebViewController? controller;

@override
void initState() {
  super.initState();
  // Load the URL when the state is initialized
  _loadPage();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.Appbacground,
        title: Text('Paid Screen'),
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
        javascriptMode: JavascriptMode.disabled,
      ),
    );
  }

void _loadPage() async {
  if (widget.link.isNotEmpty) {
    await controller!.loadUrl(widget.link);
    print(widget.link);
  }
}
}
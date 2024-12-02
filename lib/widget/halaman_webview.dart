import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Untuk Android/iOS
import 'package:webview_windows/webview_windows.dart'; // Untuk Windows

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({Key? key, required this.url, required this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late WebviewController _windowsController; // Untuk Windows
  bool _isWindowsInitialized = false;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      // Platform-specific WebView for Android
      WebView.platform = AndroidWebView();
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      // Platform-specific WebView for Windows
      _initializeWindowsWebView();
    }
  }

  Future<void> _initializeWindowsWebView() async {
    _windowsController = WebviewController();
    try {
      await _windowsController.initialize();
      await _windowsController.loadUrl(widget.url);
      setState(() {
        _isWindowsInitialized = true;
      });
    } catch (e) {
      debugPrint("Error initializing WebView for Windows: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (_) {
          if (widget.url.isEmpty) {
            return const Center(
              child: Text('Homepage is Empty'),
            );
          }

          if (Platform.isAndroid || Platform.isIOS) {
            // WebView for Android/iOS
            return WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            );
          } else if (defaultTargetPlatform == TargetPlatform.windows) {
            // WebView for Windows
            return _isWindowsInitialized
                ? Webview(_windowsController)
                : const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text('WebView is not supported on this platform.'),
            );
          }
        },
      ),
    );
  }
}

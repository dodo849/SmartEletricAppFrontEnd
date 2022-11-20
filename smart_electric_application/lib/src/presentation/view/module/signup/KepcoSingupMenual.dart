import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KepcoSingupMenual extends StatelessWidget {
  const KepcoSingupMenual({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height -
          AppBar().preferredSize.height -
          100,
      child: const WebView(
        initialUrl:
            'https://graceful-buffalo-e2e.notion.site/64171524347244a9b6b8c8f8e3b34ff7',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

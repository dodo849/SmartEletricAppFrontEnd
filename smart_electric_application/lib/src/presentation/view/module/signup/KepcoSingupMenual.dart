import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KepcoSingupMenual extends StatelessWidget {
  const KepcoSingupMenual({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 200,
      child: const WebView(
        initialUrl:
            'https://graceful-buffalo-e2e.notion.site/ca0daae9eb8b429cb7bfbfe0df8cfc5b',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

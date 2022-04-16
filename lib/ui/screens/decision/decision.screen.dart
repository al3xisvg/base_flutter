import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:mb_base_dt/blocs/decision/decision.bloc.dart';

import 'package:mb_base_dt/services/logs.service.dart';

import 'package:mb_base_dt/helpers/functions.helper.dart';
import 'package:mb_base_dt/helpers/constants.helper.dart';

import 'package:mb_base_dt/values/strings.dart' as strings;
import 'package:mb_base_dt/styles/colors.dart' as colors;

class DecisionScreen extends StatefulWidget {
  static String routeName = strings.routeDecision;

  const DecisionScreen({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ScreenState();
}

class ScreenState extends State<DecisionScreen> {
  DecisionBloc bloc = DecisionBloc();
  String logctx = 'DECISION_SCREEN';

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<DecisionBloc>(context);
    bloc.init();
    bloc.listUsers();
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  Widget _header() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: colors.primary,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, strings.routeOnboarding);
        },
      ),
    );
  }

  Widget _body() {
    return WebView(
      initialUrl: Constants.weburl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        Logs.debug(logctx, 'i', 'Webview created !!!');
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        // ignore: avoid_print
        print('WebView is loading (progress : $progress%)');
      },
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          Logs.debug(logctx, 'w', 'Blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        Logs.debug(logctx, 'i', 'Allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        Logs.debug(logctx, 'i', 'Page started loading: $url');
        Functions.startLoading(context);
      },
      onPageFinished: (String url) {
        Logs.debug(logctx, 'i', 'Page finished loading: $url');
        Functions.endLoading(context);
      },
      gestureNavigationEnabled: true,
      backgroundColor: colors.background,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colors.background,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: _header(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: colors.background,
          child: _body(),
        ),
      ),
    );
  }
}
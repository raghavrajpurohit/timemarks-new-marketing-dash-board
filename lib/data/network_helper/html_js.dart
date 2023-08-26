import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class NetworkWebHtmlJs {
  static Uri getCurrentUri() {
    return Uri.parse(window.location.href);
  }

  static Future openInNewTab(String url) async {
    AnchorElement(href: url)
      ..setAttribute('download', url.split("/").last)
      ..setAttribute('target', '_blank')
      ..click();
  }

  static Future openInSameTab(String url) async {
    AnchorElement(href: url)
      ..setAttribute('download', url.split("/").last)
      ..click();
  }

  static getSessionLastPath() {
    return WebLocalStorage.get(WebLocalStorage.lastPathKey);
  }

  static setSessionLastPath(String url) {
    WebLocalStorage.set(
      key: WebLocalStorage.lastPathKey,
      data: url,
    );
  }

  static Future<bool> downloadPdf(Uint8List bytes, {String? filename}) async {
    final Blob pdfFile = Blob(
      <Uint8List>[bytes],
      'application/pdf',
    );
    final String pdfUrl = Url.createObjectUrl(pdfFile);
    final HtmlDocument doc = js.context['document'];
    final AnchorElement link = AnchorElement(href: pdfUrl);
    if (filename != null) {
      link.download = filename;
    } else {
      link.target = '_blank';
    }
    doc.body?.append(link);
    link.click();
    link.remove();
    return true;
  }
}

class WebNavigation {
  static updateCurrentWebPathQueryParm(Map<String, dynamic> newQueryParm) {
    Uri currentUri = Uri.parse(window.location.href);
    Map<String, dynamic> query = {
      ...currentUri.queryParameters,
    };
    for (String key in newQueryParm.keys) {
      if (query.containsKey(key)) {
        query.remove(key);
      }
    }
    query.addAll(newQueryParm);
    Uri newUri = Uri(
      scheme: currentUri.scheme,
      userInfo: currentUri.userInfo,
      host: currentUri.host,
      path: currentUri.path,
      queryParameters: query,
      port: currentUri.port,
      fragment: currentUri.fragment,
    );
    window.history.pushState(null, "", newUri.toString());
  }

  static back() {
    window.history.back();
  }

  static forward() {
    window.history.forward();
  }
}

class WebLocalStorage {
  static String lastPathKey = "last_path";
  static String userJoinedChannelsKey = "Channel_ids";

  static Storage getAll() {
    return window.localStorage;
  }

  static dynamic get(String key) {
    return window.localStorage[key];
  }

  static void set({
    required String key,
    required String data,
  }) {
    window.localStorage[key] = data;
  }

  static dynamic getStringJson(String key) {
    return jsonDecode(window.localStorage[key] ?? "[]");
  }

  static bool setStringJson({
    required String key,
    required dynamic data,
  }) {
    window.localStorage[key] = jsonEncode(data);
    return true;
  }

  static removeAKey(String key) {
    window.localStorage.remove(key);
  }

  static clearAllData() {
    window.localStorage.clear();
  }
}
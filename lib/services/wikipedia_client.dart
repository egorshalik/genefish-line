import 'dart:convert';
import 'package:http/http.dart' as http;

class WikipediaResult {
  final String? title;
  final String? extract;

  WikipediaResult({this.title, this.extract});
}

class WikipediaClient {
  Future<WikipediaResult?> lookup(String query) async {
    final hasCyrillic = RegExp(r'[а-яА-ЯёЁ]').hasMatch(query);
    final lang = hasCyrillic ? 'ru' : 'en'; 
    
    final searchUrl = Uri.parse(
        'https://$lang.wikipedia.org/w/api.php?action=query&list=search&srsearch=${Uri.encodeComponent(query)}&utf8=&format=json&limit=1');

    final searchRes = await http.get(searchUrl);
    if (searchRes.statusCode != 200) return null;

    final searchData = jsonDecode(searchRes.body);
    final searchList = searchData['query']?['search'] as List?;
    if (searchList == null || searchList.isEmpty) return null;

    final title = searchList[0]['title'] as String;

    final summaryUrl = Uri.parse(
        'https://$lang.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(title)}');

    final summaryRes = await http.get(summaryUrl);
    if (summaryRes.statusCode != 200) return null;

    final summaryData = jsonDecode(summaryRes.body);
    
    return WikipediaResult(
      title: title,
      extract: summaryData['extract'] as String?,
    );
  }
}
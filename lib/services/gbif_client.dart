import 'dart:convert';
import 'package:http/http.dart' as http;

class GbifResult {
  final String? latinName;
  final String? genus;
  final String? family;
  final String? className;
  final String? kingdom; 

  GbifResult({this.latinName, this.genus, this.family, this.className, this.kingdom});
}

class GbifClient {
  Future<bool> isAnimal(String query) async {
    try {
      final url = Uri.parse(
          'https://api.gbif.org/v1/species/search?q=${Uri.encodeComponent(query)}&limit=1&kingdom=Animalia');

      final res = await http.get(url);
      if (res.statusCode != 200) return true;

      final data = jsonDecode(res.body);
      final results = data['results'] as List?;
      
      return results != null && results.isNotEmpty;
    } catch (e) {
      return true;
    }
  }

  Future<GbifResult?> match(String query) async {
    final url = Uri.parse(
        'https://api.gbif.org/v1/species/match?name=${Uri.encodeComponent(query)}');

    final res = await http.get(url);
    if (res.statusCode != 200) return null;

    final data = jsonDecode(res.body);
    
    if (data['matchType'] == 'NONE') return null;

    return GbifResult(
      latinName: data['scientificName'] as String?,
      genus: data['genus'] as String?,
      family: data['family'] as String?,
      className: data['class'] as String?,
      kingdom: data['kingdom'] as String?,
    );
  }
}
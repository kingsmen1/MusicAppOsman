import 'package:http/http.dart' as http;
import 'package:music_artist_app_osman/models/artist.dart';

class ArtistRepo {
  Future<List<Artist>> getArtist() async {
    var artist;
    try {
      final client = http.Client();
      const url = 'https://jsonkeeper.com/b/OKR7';
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        artist = artistFromJson(response.body);
      }
    } catch (e) {
      var error = 'Something went wrong';
      error = e.toString();
      print(error);
      throw error;
    }

    return artist as List<Artist>;
  }
}

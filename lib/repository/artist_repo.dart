import 'package:http/http.dart' as http;
import 'package:music_artist_app_osman/models/artist.dart';

class ArtistRepo {
  Future<List<Artist>> getArtist() async {
    final client = http.Client();
    const url = 'https://jsonkeeper.com/b/OKR7';
    final response = await client.get(Uri.parse(url));
    List<Artist> artist = artistFromJson(response.body);
    return artist;
  }
}

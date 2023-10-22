import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/shake_animation/data/datasources/remote/music_datasource.dart';

@Injectable(as: RemoteMusicDataSource)
class RemoteMusicDataSourceImpl implements RemoteMusicDataSource {
  @override
  Future<List<String>> getMusicPlayList() async {
    try {
      final playListRef = firebaseStorage.ref().child('music/chill/');

      final playListRefenceResults = await playListRef.listAll();

      final musicPlayList = playListRefenceResults.items.map((item) async {
        final music = await item.getDownloadURL();
        return music;
      }).toList();

      return Future.wait(musicPlayList);
    } catch (e) {
      throw Exception(e);
    }
  }
}

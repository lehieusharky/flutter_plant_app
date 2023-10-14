import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

AudioConstant get audioConstant => injector.get<AudioConstant>();

abstract class AudioConstant {
  String get chillMp3;
}

@Injectable(as: AudioConstant)
class AudioConstantImpl implements AudioConstant {
  @override
  String get chillMp3 => 'assets/audios/chill.mp3';
}

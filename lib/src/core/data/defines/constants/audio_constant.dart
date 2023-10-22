import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

AudioConstant get audioConstant => injector.get<AudioConstant>();

abstract class AudioConstant {}

@Injectable(as: AudioConstant)
class AudioConstantImpl implements AudioConstant {}

import 'package:equatable/equatable.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class TimeLineParams extends NoParams {
  final TimeLineModel timeLineModel;

  TimeLineParams({required this.timeLineModel});

  @override
  List<Object> get props => [timeLineModel];
}

class PlantSpecialListParams extends NoParams {
  final String q;
  final int? page;
  final String? order;
  final String? edible;

  PlantSpecialListParams({
    this.edible = '',
    this.order = '',
    this.page = 1,
    required this.q,
  });

  @override
  List<Object> get props => [q];
}

class PlantDiseaseListParams extends NoParams {
  final String q;
  final int? page;
  final int? id;

  PlantDiseaseListParams({
    this.id,
    this.page = 1,
    required this.q,
  });

  @override
  List<Object> get props => [q];
}

class GetWeatherParams extends NoParams {
  final String lat;
  final String lon;

  GetWeatherParams({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object> get props => [lat, lon];
}

class VerityOtpParams extends NoParams {
  final String verificationId;
  final String smsCode;
  final void Function()? onError;

  VerityOtpParams({
    required this.verificationId,
    required this.smsCode,
    this.onError,
  });
}

class SentOtpParams extends NoParams {
  final String phoneNumber;
  final void Function(String verificationId) pushToOtp;

  SentOtpParams({required this.phoneNumber, required this.pushToOtp});
}

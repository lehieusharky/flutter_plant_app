import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/weather_background.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class WeatherHomeage extends StatefulWidget {
  const WeatherHomeage({super.key});

  @override
  State<WeatherHomeage> createState() => _WeatherHomeageState();
}

class _WeatherHomeageState extends State<WeatherHomeage> {
  WeatherModel _weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomePageBloc, HomePageState, WeatherModel>(
      selector: (state) {
        if (state is HomePageGetWeatherInfomationSuccess) {
          _weatherModel = state.weatherModel;
        }
        return _weatherModel;
      },
      builder: (context, weatherModel) {
        if (weatherModel.name == null) {
          return const CircularProgressIndicator();
        } else {
          return Stack(
            alignment: Alignment.center,
            children: [
              const WeatherBackGround(),
              Padding(
                padding: context.padding(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(weatherModel.main!.temp! - 273).toInt()}°C',
                          style: theme(context).textTheme.displayMedium,
                        ),
                        _buildRowItem(
                          iconPath: imageConstant.locationSVG,
                          value: weatherModel.name!,
                          context: context,
                          paddingTop: 0,
                        ),
                      ],
                    ),
                    context.sizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRowItem(
                          iconPath: imageConstant.humiditySVG,
                          value: '${weatherModel.main!.humidity} %',
                          context: context,
                        ),
                        _buildRowItem(
                          iconPath: imageConstant.windSVG,
                          value: '${weatherModel.wind!.speed} m/s',
                          context: context,
                        ),
                        _buildRowItem(
                          iconPath: imageConstant.binocularsSVG,
                          value: '${weatherModel.main!.pressure} hPa',
                          context: context,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }

  Widget _buildRowItem({
    required String iconPath,
    required String value,
    required BuildContext context,
    double? paddingTop,
  }) {
    return Padding(
      padding: context.padding(top: paddingTop ?? 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomSvg(
            path: iconPath,
            color: colorTheme.getFFFFFF,
            width: context.sizeWidth(20),
            height: context.sizeWidth(20),
          ),
          context.sizedBox(width: 5),
          Text(
            value,
            style: AppTextTheme.darkTheme(context).titleLarge!.copyWith(
                  fontSize: context.sizeWidth(14),
                ),
          ),
        ],
      ),
    );
  }
}

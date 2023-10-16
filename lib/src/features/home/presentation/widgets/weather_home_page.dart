import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_shimmer.dart';
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
          return CustomShimmer(
            width: context.width,
            height: context.sizeHeight(175),
          );
        } else {
          return Stack(
            children: [
              const WeatherBacground(),
              Padding(
                padding: context.padding(horizontal: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTemperature(weatherModel),
                    context.sizedBox(width: 10),
                    _buildWeatherPart(weatherModel),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildTemperature(WeatherModel weatherModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRowItem(
          iconPath: imageConstant.locationSVG,
          value: weatherModel.name!,
          context: context,
        ),
        Text(
          '${(weatherModel.main!.temp! - 273).toInt()}°C',
          style: theme(context).textTheme.displayMedium,
        ),
      ],
    );
  }

  Widget _buildWeatherPart(WeatherModel weatherModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRowItem(
          iconPath: imageConstant.humiditySVG,
          value: '${weatherModel.main!.humidity} %',
          context: context,
        ),
        context.sizedBox(height: 15),
        _buildRowItem(
          iconPath: imageConstant.windSVG,
          value: '${weatherModel.wind!.speed} m/s',
          context: context,
        ),
        context.sizedBox(height: 15),
        _buildRowItem(
          iconPath: imageConstant.binocularsSVG,
          value: '${weatherModel.main!.pressure} hPa',
          context: context,
        ),
      ],
    );
  }

  Widget _buildRowItem({
    required String iconPath,
    required String value,
    required BuildContext context,
  }) {
    return Row(
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
    );
  }
}

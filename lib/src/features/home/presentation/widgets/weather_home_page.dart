part of 'part_home_page_widget.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  WeatherModel _weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is HomePageDeterminePositionSuccess) {
            _handleWhenDeterminePosition(context, state);
          }
          if (state is HomePageGetWeatherInfomationSuccess) {
            _weatherModel = state.weatherModel;
          }
        },
        builder: (context, state) {
          if (_weatherModel.name == null) {
            return SizedBox(
              width: context.width,
              height: context.sizeHeight(150),
            );
          } else {
            return SizedBox(
              width: context.width,
              height: context.sizeHeight(150),
              child: Stack(
                children: [
                  // const WeatherBackground(),
                  Padding(
                    padding: context.padding(horizontal: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTemperature(_weatherModel),
                        context.sizedBox(width: 10),
                        _buildWeatherPart(_weatherModel),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _getWeatherInfomation({
    required String lat,
    required String long,
    required BuildContext context,
  }) {
    context
        .read<HomePageBloc>()
        .add(HomePageGetWeatherInfomation(lat: lat, long: long));
  }

  void _handleWhenDeterminePosition(
      BuildContext context, HomePageDeterminePositionSuccess state) {
    _getWeatherInfomation(
      context: context,
      lat: state.position!.latitude.toString(),
      long: state.position!.longitude.toString(),
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
          style: AppTextTheme.darkTheme(context).displayMedium,
        ).animate().fade(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
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
          color: AppTextTheme.darkTheme(context).titleLarge!.color,
          width: context.sizeWidth(20),
          height: context.sizeWidth(20),
        ),
        context.sizedBox(width: 5),
        Text(
          value,
          style: AppTextTheme.darkTheme(context).titleLarge!.copyWith(
                fontSize: context.sizeWidth(16),
              ),
        ),
      ],
    ).animate().fade(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
  }
}

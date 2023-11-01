part of 'part_home_page_widget.dart';

class TopicButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  final TopicSymbol isChoosed;
  final TopicSymbol topicSymbol;
  final String pathIcon;
  const TopicButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isChoosed,
    required this.pathIcon,
    required this.topicSymbol,
  });

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  var _isChoosed = false;

  @override
  Widget build(BuildContext context) {
    // * compare default index with indexOfButton which is choosed
    _isChoosed = _checkIschoosed();

    return BlocBuilder<MyAppBloc, MyAppState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              boxShadowColor: ThemeManager.shadowTopicButton(),
              width: context.sizeWidth(50),
              height: context.sizeHeight(50),
              borderRadius: context.sizeWidth(10),
              onPress: widget.onPressed,
              backgroundColor: _color(
                isChoosed: _isChoosed,
                lightFocus: colorTheme.get2DDA93,
                darkFocus: colorTheme.get2DDA93,
                lightUnFocus: colorTheme.getFFFFFF,
                darkUnFocus: colorTheme.get252A3D,
              ),
              child: _buildSymbol(),
            ),
            context.sizedBox(height: 5),
            _buildTitle(),
          ],
        );
      },
    );
  }

  Widget _buildSymbol() {
    return CustomSvg(
      path: widget.pathIcon,
      width: context.sizeWidth(30),
      color: _isChoosed ? colorTheme.getFFFFFF : colorTheme.get2DDA93,
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: _isChoosed
          ? theme(context).textTheme.titleSmall!.copyWith(
              color: sharePreference.isDarkMode()
                  ? AppTextTheme.darkTheme(context).titleSmall!.color
                  : AppTextTheme.darkTheme(context).titleSmall!.color)
          : theme(context).textTheme.titleSmall!.copyWith(
              color: sharePreference.isDarkMode()
                  ? AppTextTheme.lightTheme(context).titleSmall!.color
                  : AppTextTheme.lightTheme(context).titleSmall!.color),
    );
  }

  Color _color({
    required bool isChoosed,
    required Color lightFocus,
    required Color darkFocus,
    required Color lightUnFocus,
    required Color darkUnFocus,
  }) {
    final themeMode = sharePreference.getTheme() == SupportedTheme.light
        ? ThemeMode.light
        : ThemeMode.dark;
    switch (themeMode) {
      case ThemeMode.light:
        if (isChoosed) {
          return lightFocus;
        } else {
          return lightUnFocus;
        }
      case ThemeMode.dark:
        if (isChoosed) {
          return darkFocus;
        } else {
          return darkUnFocus;
        }

      default:
        return lightFocus;
    }
  }

  bool _checkIschoosed() {
    return widget.topicSymbol == widget.isChoosed ? true : false;
  }
}

part of 'part_home_page_widget.dart';

class PolularPlantsButton extends StatefulWidget {
  const PolularPlantsButton({super.key});

  @override
  State<PolularPlantsButton> createState() => _PolularPlantsButtonState();
}

class _PolularPlantsButtonState extends State<PolularPlantsButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildPopularPlantsItem(
                  iconPath: imageConstant.vegetableSVG,
                  title: translate(context).vegetables),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                  iconPath: imageConstant.flowerSVG,
                  title: translate(context).flowers),
            ],
          ),
          context.sizedBox(height: 10),
          Row(
            children: [
              _buildPopularPlantsItem(
                  iconPath: imageConstant.fruitSVG,
                  title: translate(context).fruits),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                  iconPath: imageConstant.leafSVG,
                  title: translate(context).leafy),
            ],
          ),
          context.sizedBox(height: 10),
          Row(
            children: [
              _buildPopularPlantsItem(
                  iconPath: imageConstant.deseaseSVG,
                  title: translate(context).diseases),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                  iconPath: imageConstant.plantSVG,
                  title: translate(context).plants),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPopularPlantsItem({
    required String iconPath,
    required String title,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => context.go(RouterPath.popularTopicPage),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _buildBackGround(iconPath: iconPath),
            Padding(
              padding: context.padding(
                horizontal: 10,
              ),
              child: Text(
                title,
                style: theme(context).textTheme.titleMedium!.copyWith(
                      fontSize: context.sizeWidth(17),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackGround({required String iconPath}) {
    return CustomShadow.button(
      boxShadowColor: ThemeManager.shadowButton(),
      child: Container(
        alignment: Alignment.bottomRight,
        width: context.width / 2,
        height: context.sizeHeight(110),
        padding: context.padding(all: 2),
        decoration: BoxDecoration(
          color: ThemeManager.backgroundButton(),
          borderRadius: BorderRadius.circular(context.sizeWidth(5)),
        ),
        child: Padding(
          padding: context.padding(vertical: 10),
          child: CustomSvg(
            path: iconPath,
            width: context.sizeWidth(90),
            height: context.sizeHeight(90),
          ),
        ),
      ),
    );
  }
}

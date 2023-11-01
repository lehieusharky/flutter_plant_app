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
                iconPath: imageConstant.flowerPNG,
                title: translate(context).flowers,
                plantTopic: PlantTopic.flower,
                linearColor:
                    listListColor[linearIndex[PopularTopic.flower.getPopular]!],
              ),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                iconPath: imageConstant.leafyPNG,
                title: translate(context).leafy,
                plantTopic: PlantTopic.leaf,
                linearColor:
                    listListColor[linearIndex[PopularTopic.leafy.getPopular]!],
              ),
            ],
          ),
          context.sizedBox(height: 10),
          Row(
            children: [
              _buildPopularPlantsItem(
                iconPath: imageConstant.plantPNG,
                title: translate(context).plants,
                plantTopic: PlantTopic.plant,
                linearColor:
                    listListColor[linearIndex[PopularTopic.plant.getPopular]!],
              ),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                iconPath: imageConstant.fruitPNG,
                title: translate(context).fruits,
                plantTopic: PlantTopic.fruit,
                linearColor:
                    listListColor[linearIndex[PopularTopic.fruit.getPopular]!],
              ),
            ],
          ),
          context.sizedBox(height: 10),
          Row(
            children: [
              const Text(''),
              _buildPopularPlantsItem(
                iconPath: imageConstant.diseasePNG,
                title: translate(context).diseases,
                plantTopic: PlantTopic.disease,
                linearColor: listListColor[
                    linearIndex[PopularTopic.disease.getPopular]!],
              ),
              context.sizedBox(width: 10),
              _buildPopularPlantsItem(
                iconPath: imageConstant.diseasePNG,
                title: translate(context).diseases,
                plantTopic: PlantTopic.disease,
                linearColor: listListColor[
                    linearIndex[PopularTopic.disease.getPopular]!],
              ),
            ],
          )
        ],
      ),
    );
  }

  void _navigateToPopularPage({
    required BuildContext context,
    required PlantTopic plantTopic,
  }) {
    context.go(
      RouterPath.popularTopicPage,
      extra: {
        AppConstant.plantTopicRouter: plantTopic,
      },
    );
  }

  Widget _buildPopularPlantsItem(
      {required String iconPath,
      required String title,
      required PlantTopic plantTopic,
      required List<Color> linearColor}) {
    return Expanded(
      child: InkWell(
        onTap: () =>
            _navigateToPopularPage(context: context, plantTopic: plantTopic),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _buildBackGround(iconPath: iconPath, linearColor: linearColor),
            Padding(
              padding: context.padding(horizontal: 10, vertical: 10),
              child: Text(
                title,
                style: AppTextTheme.darkTheme(context).titleMedium!.copyWith(
                      fontSize: context.sizeWidth(17),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackGround(
      {required String iconPath, required List<Color> linearColor}) {
    return CustomShadow.button(
      boxShadowColor: ThemeManager.shadowButton(),
      child: Container(
        alignment: Alignment.bottomRight,
        width: context.width,
        height: context.sizeHeight(110),
        padding: context.padding(all: 2),
        decoration: BoxDecoration(
          color: ThemeManager.backgroundButton(),
          borderRadius: BorderRadius.circular(context.sizeWidth(24)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: linearColor,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: context.sizeWidth(90),
        ),
      ),
    );
  }

  final List<List<Color>> listListColor = [
    [
      const Color(0xff68428E),
      const Color(0xffBB87EB),
      const Color(0xffE0E6C8),
    ],
    [
      const Color(0xff456D2D),
      const Color(0xff9EA77D),
      const Color(0xffE0E6C8),
    ],
    [
      const Color(0xff426D2C),
      const Color(0xff8FC139),
      const Color(0xffE0E6C8),
    ],
    [
      const Color(0xffB32F4C),
      const Color(0xffC5888E),
      const Color(0xffE0E6C8),
    ],
    [
      const Color(0xff8E663C),
      const Color(0xffE29C4A),
      const Color(0xffE0E6C8),
    ],
    [
      const Color(0xff68428E),
      const Color(0xffBB87EB),
      const Color(0xffE0E6C8),
    ]
  ];

  final Map<String, int> linearIndex = {
    PopularTopic.flower.getPopular: 0,
    PopularTopic.plant.getPopular: 1,
    PopularTopic.leafy.getPopular: 2,
    PopularTopic.fruit.getPopular: 3,
    PopularTopic.disease.getPopular: 4,
  };
}

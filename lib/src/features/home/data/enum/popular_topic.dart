enum PopularTopic {
  flower,
  leafy,
  plant,
  fruit,
  disease;

  String get getPopular {
    switch (this) {
      case PopularTopic.flower:
        return "flower";
      case PopularTopic.leafy:
        return "leafy";
      case PopularTopic.plant:
        return "plant";
      case PopularTopic.fruit:
        return "fruit";
      case PopularTopic.disease:
        return "disease";

      default:
        return 'flower';
    }
  }
}

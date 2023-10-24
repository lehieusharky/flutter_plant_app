enum PlantTopic {
  plant,
  fruit,
  flower,
  disease,
  leaf;

  String get getTopic {
    switch (this) {
      case PlantTopic.plant:
        return 'plant';
      case PlantTopic.fruit:
        return 'fruit';
      case PlantTopic.flower:
        return 'flower';
      case PlantTopic.disease:
        return 'disease';
      case PlantTopic.leaf:
        return 'leaf';
      default:
        return 'plant';
    }
  }
}

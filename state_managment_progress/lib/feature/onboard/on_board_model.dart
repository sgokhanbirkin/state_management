class OnBoardModel {
  final String title;
  final String description;
  final String imageName;
  OnBoardModel({
    required this.title,
    required this.description,
    required this.imageName,
  });

  String get imageWithPath => 'asset/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel(
        title: 'Order Your Food',
        description:
            'Now you can order food any time right from your mobile phone',
        imageName: 'ic_chef'),
    OnBoardModel(
        title: 'Order Your Food',
        description:
            'Now you can order food any time right from your mobile phone',
        imageName: 'ic_delivery'),
    OnBoardModel(
        title: 'Order Your Food',
        description:
            'Now you can order food any time right from your mobile phone',
        imageName: 'ic_order'),
  ];
}

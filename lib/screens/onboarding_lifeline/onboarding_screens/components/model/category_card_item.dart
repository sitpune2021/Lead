// Model class for each card item
class CardItem {
  final String title;
  final String subtitle;
  final int reward;

  CardItem({
    required this.title,
    required this.subtitle,
    required this.reward,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      title: json['title'],
      subtitle: json['subtitle'],
      reward: json['reward'],
    );
  }
}

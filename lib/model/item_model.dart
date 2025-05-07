class Item {
  String? id;
  List<dynamic>? imageUrls;
  String? price;
  String? date;
  String? location;
  String? description;
  String? city;
  String? select_Items;
  int num_views;

  Item({
    required this.id,
    required this.imageUrls,
    required this.price,
    required this.date,
    required this.location,
    required this.description,
    required this.city,
    required this.select_Items,
    required this.num_views,
  });
}

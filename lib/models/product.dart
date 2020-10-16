class Product {
  int id;
  String title;
  String description;
  String type;
  String processor;
  String ram;
  String screenSize;
  String color;
  String hdCapacity;

  Product(
    int id,
    String title,
    String description,
    String type,
    String processor,
    String ram,
    String screenSize,
    String color,
    String hdCapacity,
  ) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.type = type;
    this.processor = processor;
    this.ram = ram;
    this.screenSize = screenSize;
    this.color = color;
    this.hdCapacity = hdCapacity;
  }

  Product.fromJson(dynamic json)
      : id = json['id'] as int,
        title = json['title'] as String,
        description = json['description'] as String,
        type = json['type'] as String,
        processor = json['processor'] as String,
        ram = json['ram'] as String,
        screenSize = json['screenSize'] as String,
        color = json['color'] as String,
        hdCapacity = json['hdCapacity'] as String;

  Map<String, dynamic> toJson() {
    return {
      "id": id.toString(),
      "title": title,
      "description": description,
      "type": type,
      "processor": processor,
      "ram": ram,
      "screenSize": screenSize,
      "color": color,
      "hdCapacity": hdCapacity,
    };
  }
}

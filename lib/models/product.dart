class Product {
  String name;
  String description;
  String type;
  String processor;
  String ram;
  String screensize;
  String color;
  String hdcapacity;

  Product(
    String name,
    String description,
    String type,
    String processor,
    String ram,
    String screensize,
    String color,
    String hdcapacity,
  ) {
    this.name = name;
    this.description = description;
    this.type = type;
    this.processor = processor;
    this.ram = ram;
    this.screensize = screensize;
    this.color = color;
    this.hdcapacity = hdcapacity;
  }

  Product.fromJson(dynamic json)
      : name = json['name'] as String,
        description = json['description'] as String,
        type = json['type'] as String,
        processor = json['processor'] as String,
        ram = json['ram'] as String,
        screensize = json['screensize'] as String,
        color = json['color'] as String,
        hdcapacity = json['hdcapacity'] as String;

  dynamic toJson() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'processor': processor,
      'ram': ram,
      'screensize': screensize,
      'color': color,
      'hdcapacity': hdcapacity,
    };
  }
}

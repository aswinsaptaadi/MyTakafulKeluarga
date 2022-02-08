class ProductCategoriModel {
  final int id;
  final String picturePath;
  final String name;

  ProductCategoriModel({
    this.id,
    this.picturePath,
    this.name,
  });
}

List<ProductCategoriModel> mockProductCategoriModels = [
  ProductCategoriModel(
      id: 1,
      picturePath: 'image/takaful-personal23.jpeg',
      name: "Takaful Personal"),
  ProductCategoriModel(
      id: 2,
      picturePath: 'image/takaful-korporat.jpeg',
      name: "Takaful Korporat"),
  ProductCategoriModel(
      id: 3,
      picturePath: 'image/takaful-bancassurance.jpeg',
      name: "Takaful Bancassurance"),
];



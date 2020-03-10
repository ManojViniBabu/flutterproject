import 'CategoryDish_model.dart';


class TableMenu {
    List<CategoryDish> categoryDishes;
    String menuCategory;
    String menuCategoryId;
    String menuCategoryImage;
    String nextUrl;

    TableMenu({this.categoryDishes, this.menuCategory, this.menuCategoryId, this.menuCategoryImage, this.nextUrl});

    factory TableMenu.fromJson(Map<String, dynamic> json) {
        return TableMenu(
            categoryDishes: json['category_dishes'] != null ? (json['category_dishes'] as List).map((i) => CategoryDish.fromJson(i)).toList() : null,
            menuCategory: json['menu_category'],
            menuCategoryId: json['menu_category_id'],
            menuCategoryImage: json['menu_category_image'],
            nextUrl: json['nexturl'],
        );
    }

}
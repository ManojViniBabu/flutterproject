
class CategoryDish {
    bool addonCat;
    bool dishAvailability;
    int dishType;
    String dishCalories;
    String dishCurrency;
    String dishDescription;
    String dishId;
    String dishImage;
    String dishName;
    String dishPrice;
    String nextUrl;
    int cartCounter=0;
    List<int> cartSeq=[];

    CategoryDish({this.addonCat, this.dishAvailability, this.dishType,this.dishCalories,this.dishCurrency, this.dishDescription, this.dishId, this.dishImage, this.dishName, this.dishPrice,this.nextUrl});


    factory CategoryDish.fromJson(Map<String, dynamic> json) {
        return CategoryDish(
            addonCat: json['addonCat'] != null ? true:false ,
          dishAvailability: json['dish_Availability'],
          dishType: json['dish_Type'],
            dishCalories: json['dish_calories'].toString(),
            dishCurrency: json['dish_currency'].toString(),
            dishDescription: json['dish_description'],
            dishId: json['dish_id'],
            dishImage: json['dish_image'],
            dishName: json['dish_name'],
           dishPrice: json['dish_price'].toString(),
            nextUrl: json['nexturl'],
        );
    }


}
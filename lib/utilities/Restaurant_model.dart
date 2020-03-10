import  'TableMenu_model.dart';

// ignore: camel_case_types
class  RestaurantList{


    final  List<Restaurant> restaurants;

    RestaurantList({this.restaurants})    ;

    factory RestaurantList.fromJson(List<dynamic> json){

        List<Restaurant> rests = List<Restaurant>();
        rests = json.map((i)=>Restaurant.fromJson(i)).toList();


        return RestaurantList(
            restaurants : rests,
        );
    }
}

class Restaurant {
    String branchName;
    String nextUrl;
    String restaurantId;
    String restaurantImage;
    String restaurantName;
    String tableId;
    List<TableMenu> tableMenuList;
    String tableName;
    int cartCounter=0;
    Restaurant({this.branchName, this.nextUrl, this.restaurantId, this.restaurantImage, this.restaurantName, this.tableId, this.tableMenuList, this.tableName});

    factory Restaurant.fromJson(Map<String, dynamic> json) {
        return Restaurant(
            branchName: json['branch_name'],
            nextUrl: json['nexturl'],
            restaurantId: json['restaurant_id'],
            restaurantImage: json['restaurant_image'],
            restaurantName: json['restaurant_name'],
            tableId: json['table_id'],
            tableMenuList: json['table_menu_list'] != null ? (json['table_menu_list'] as List).map((i) => TableMenu.fromJson(i)).toList() : null,
            tableName: json['table_name'],
        );
    }

}
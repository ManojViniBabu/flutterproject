import 'dart:async';
import 'package:onion/utilities/ApiResponse.dart';
import 'package:onion/utilities/Repository.dart';
import  'package:onion/utilities/Restaurant_model.dart';



class RestaurantBloc {

  // variable declaration

  RestaurantRepository _restaurantRepository;
  StreamController _restaurantListController;




  StreamSink<ApiResponse<RestaurantList>> get restaurantListSink => _restaurantListController.sink;
  Stream<ApiResponse<RestaurantList>> get restaurantListStream => _restaurantListController.stream;


  RestaurantBloc(){
    _restaurantListController = StreamController<ApiResponse<RestaurantList>>();
    _restaurantRepository = RestaurantRepository();

    fetchRestaurantList();


  }

  fetchRestaurantList() async{

    restaurantListSink.add(ApiResponse.loading(''));

    try{
      RestaurantList restaurant = await _restaurantRepository.fetchRestaurantList();
      restaurantListSink.add(ApiResponse.completed(restaurant));



    }catch(e) {

      restaurantListSink.add(ApiResponse.error(e.toString()));
    }


  }

  dispose(){

    _restaurantListController?.close();
  }


}




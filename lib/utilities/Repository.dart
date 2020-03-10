//TODO Creating a repository class to fetch data
// from APIs

//Use a Repository class which going to act
//as the intermediator and a layer of abstraction
//between the APIs and the BLOC.
//The task of the repository is to deliver movies data to the BLOC after fetching it from the API.



// ask 4w 1H Always what why where when how

import 'Apihelper.dart';  //i need to use apihelper class here so i imported this for exception handling
import 'Restaurant_model.dart';// as the response from the network which i need is a
// list of maps ...so i need list of type movies hence importing model_class
import 'dart:async';



class RestaurantRepository{


 // create an object  of   ApiBaseHelper so that i can access its methods and properties
  ApiBaseHelper _helper = ApiBaseHelper();

  //creating a function to fetch the movie list of maps ..as it is a network request its aof type future listof maps of vovie details
//so async and await so go on and import the same
  Future<RestaurantList> fetchRestaurantList() async{

    final response = await _helper.get("v2/5dfccffc310000efc8d2c1ad#");
  // whatever the response is either its an exception or actual data  im gonna fetch it as a list of maps
    return RestaurantList.fromJson(response);

  }



}




//TODO Creating a generic ApiResponse class
//In order to expose all those HTTP errors and exceptions to our UI, we are going to create
// a generic class which encapsulates both the network status and the data coming from the API

//enum or enumeration is a special type class ...like only one type can be defined
enum Status{LOADING,COMPLETED,ERROR}


//This class will be defined by me after completion of BLoc
class ApiResponse<T>{

  Status status;
  T data ;
  String message ;

  //Create named constructor to assign values

ApiResponse.loading(this.message){

  status = Status.LOADING;
}

ApiResponse.completed(this.data){

    status = Status.COMPLETED;
}

  ApiResponse.error(this.message){

    status = Status.ERROR;
  }




}




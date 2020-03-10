//TODO Custom app Exception


//like interface in java the AppException class  is inheriting
//This is used to give custom error message  in case of failures
//Its a usual practice to use Exception class

class AppException implements Exception {

  final _message;
  final _prefix;

//Square brackets are used because both the  fields are optional
  //while instantiating a or calling the constructor
  AppException([this._message, this._prefix]);


  // Our custom error message returning function of String type
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException{
  // If you want to construct subclass by using named contructors of superclass
  //  specify the superclass constructor after a colon (:), just before the constructor body (if any)
//ie i am instantiating  the super class
 FetchDataException([String message]):super(message,"Error during Communication");


}

class  BadRequestException extends AppException{

  BadRequestException([String message]):super(message,"Invalid Request");



}

class UnauthorisedException extends AppException{

  UnauthorisedException([String message]):super(message,"Unauthorised:");


}


class InvalidInputException extends AppException{

  InvalidInputException([message]):super(message,"Invalid Input");
}




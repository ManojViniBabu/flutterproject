import 'dart:ui';
import 'package:onion/utilities/CartList_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onion/utilities/Restaurant_model.dart';
import 'package:onion/services/RestaurantBloc.dart';
import 'package:onion/utilities/ApiResponse.dart';
import 'Restaurant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CartList> cartList = [];
  final RestaurantBloc restaurantBloc = RestaurantBloc();

  @override
  void dispose() {
    super.dispose();
    restaurantBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => restaurantBloc.fetchRestaurantList(),
        child: StreamBuilder<ApiResponse<RestaurantList>>(
          stream: restaurantBloc.restaurantListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return RestaurantPage1(
                    restaurant: snapshot.data.data,
                    cartList: cartList,
                  );
                  //Restaurant(restaurant : snapshot.data.data);
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => restaurantBloc.fetchRestaurantList(),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.black,
            child: Text('Retry', style: TextStyle(color: Colors.white)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ],
      ),
    );
  }
}

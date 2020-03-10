import 'package:flutter/material.dart';
import 'package:onion/utilities/CartList_model.dart';
import 'package:onion/utilities/Restaurant_model.dart';
import 'MenuList.dart';
import 'Cart.dart';






class RestaurantPage1 extends StatelessWidget {
  final RestaurantList restaurant;
  final List<CartList> cartList;

  RestaurantPage1({Key key, this.restaurant,this.cartList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Material(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.green[50]
                    ),
                  ),

                ),



                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        '${restaurant.restaurants[0].restaurantName}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.black),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.height / 2) -50,
                  left: (MediaQuery.of(context).size.width / 2) + 20 ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: NetworkImage('${restaurant.restaurants[0].restaurantImage}'),
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: 120.0,
                    ),


                  ),
                ),

                Positioned(
                  top: MediaQuery.of(context).size.height-120,
                  left: MediaQuery.of(context).size.width-165,
                  child: FlatButton(



                    onPressed:(){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Restaurant(restaurant : restaurant,cartList: cartList))
                      );

                    },

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                          height: 40,
                          width: 100 ,
                          color: Colors.white,
                          child: Center(child: Text('Menu',style: TextStyle(color: Colors.black
                              ,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),
                          ))),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height - 275.0,
                        left: 20.0,
                        right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'All to know...',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Age old  cafe which  serves traditional foods  with a blend of  modern touch, Both  vegetarian and non-vegetarian  are served here.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                          ),
                        ),

                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );




  }
}




class Restaurant extends StatefulWidget {
  final RestaurantList restaurant;
  final List<CartList> cartList;



  Restaurant({Key key, this.restaurant,this.cartList}) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {

  //List<String> _cartList = [];



  callback(x){
    setState(() {
      //  widget.cartList.length=x;
    });
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: DefaultTabController(
        length: widget.restaurant.restaurants[0].tableMenuList.length,
        child: Scaffold(

          appBar: AppBar(title: Text('${widget.restaurant.restaurants[0].restaurantName}',style: TextStyle(color: Colors.black,
          fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 20),),
            iconTheme: IconThemeData(color: Colors.black),
            actions: [

              new Padding(padding: const EdgeInsets.all(1.0),

                child:  Container(
                    height: 200.0,
                    width: 50.0,

                    child:  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder:(BuildContext context) =>
                                    Cart(widget.cartList,widget.restaurant.restaurants[0].tableMenuList)
                            )
                        );
                      },

                      child:  Stack(
                        children: <Widget>[
                          IconButton(icon:  Icon(Icons.shopping_cart,
                            color: Colors.black,size: 25,),
                            onPressed: null,

                          ),

                          widget.cartList.length==0 ? Container() :
                           Positioned(

                              child:  Stack(
                                children: <Widget>[
                                  Icon(
                                      Icons.brightness_1,
                                      size: 20.0, color: Colors.green[800]),
                                  Positioned(
                                      top: 3.0,
                                      right: 4.0,
                                      child: new Center(
                                        child: Text(
                                          widget.cartList.length.toString(),
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      )),


                                ],
                              )),

                        ],
                      ),
                    )
                )

                ,)],
            backgroundColor: Colors.white ,
            bottom:  PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(

                child: TabBar(tabs: <Widget>[
                  Text('${widget.restaurant.restaurants[0].tableMenuList[0].menuCategory}',style: TextStyle(color:Colors.black),),
                  Text('${widget.restaurant.restaurants[0].tableMenuList[1].menuCategory}',style: TextStyle(color:Colors.black),),
                  Text('${widget.restaurant.restaurants[0].tableMenuList[2].menuCategory}',style: TextStyle(color:Colors.black),),
                  Text('${widget.restaurant.restaurants[0].tableMenuList[3].menuCategory}',style: TextStyle(color:Colors.black),),
                  Text('${widget.restaurant.restaurants[0].tableMenuList[4].menuCategory}',style: TextStyle(color:Colors.black),),
                  Text('${widget.restaurant.restaurants[0].tableMenuList[5].menuCategory}',style: TextStyle(color:Colors.black),),
                ],
                  isScrollable: true,
                  labelColor: Colors.white,
                  labelPadding: EdgeInsets.all(10.0),

                ),
              ),
            ),

          ),
          body: TabBarView(
            children: <Widget>[
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[0],callback: callback,cartList:widget.cartList),
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[1],callback: callback,cartList:widget.cartList),
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[2],callback: callback,cartList:widget.cartList),
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[3],callback: callback,cartList:widget.cartList),
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[4],callback: callback,cartList:widget.cartList),
              MenuList(tablemenu: widget.restaurant.restaurants[0].tableMenuList[5],callback: callback,cartList:widget.cartList),

            ],

          ),

        ),



      ),
    );


  }
}





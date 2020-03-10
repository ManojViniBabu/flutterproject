import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onion/utilities/TableMenu_model.dart';
import 'package:onion/utilities/CartList_model.dart';


class MenuList extends StatefulWidget {
  final TableMenu tablemenu;
  final Function (int) callback;
  final List<CartList> cartList ;
  MenuList({Key key, this.tablemenu,this.callback,this.cartList}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  void cartUpdate() {
    widget.callback(widget.cartList.length);
    }











  Icon getIcon(int dishType) {

    if(dishType== 1){

     return  Icon(Icons.center_focus_strong,
    size :20.0,
    color:
    Colors.red
    );}
    else{
      return  Icon(Icons.center_focus_strong,
          size :20.0,
          color:
          Colors.green
      );}
    }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:widget.tablemenu.categoryDishes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.5,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                Container(
                  width:20,
                  height:20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      getIcon(widget.tablemenu.categoryDishes[index].dishType),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${widget.tablemenu.categoryDishes[index].dishName}',
                          style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.bold),

                        ),
                        Row(crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${widget.tablemenu.categoryDishes[index].dishCurrency} ',
                              style: TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold),
                            ),

                            Container(
                              width: 38,
                              child: Text(
                                '${widget.tablemenu.categoryDishes[index].dishPrice}',
                                style: TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold),
                              ),
                            ),

                            SizedBox(
                              width: 75,
                            ),
                            Text(
                              '${widget.tablemenu.categoryDishes[index].dishCalories} calories',
                              style: TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold),
                            ),

                          ],
                        ),
                        Text(
                          '${widget.tablemenu.categoryDishes[index].dishDescription}',
                          style: TextStyle(fontSize: 12.0,color: Colors.black54),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 40,
                          child: Card(
                            elevation: 0.5,
                            color: Colors.green,

                            shape: StadiumBorder(),
                            child: Row(

                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                ButtonTheme(
                                  minWidth :10,
                                  child: FlatButton(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Icon(Icons.add,
                                        size :15.0,
                                        color:
                                        Colors.white
                                    ),
                                  onPressed: (){

                                       setState(() {
                                        ++widget.tablemenu.categoryDishes[index].cartCounter;
                                        widget.tablemenu.categoryDishes[index].cartSeq.add(widget.tablemenu.categoryDishes[index].cartSeq.length+1);
                                        CartList data = CartList();
                                        data.cartId=widget.tablemenu.categoryDishes[index].cartSeq.length;
                                        data.cartDishName=widget.tablemenu.categoryDishes[index].dishName;
                                        data.dishCurrency=widget.tablemenu.categoryDishes[index].dishCurrency;
                                        data.cartDishPrice=double.parse((widget.tablemenu.categoryDishes[index].dishPrice));


                                        widget.cartList.add(data);
                                        cartUpdate();
                                      });
                                  },


                                  ),

                                ),

                                Text('${widget.tablemenu.categoryDishes[index].cartCounter}',style: TextStyle(color: Colors.white),),

                                ButtonTheme(
                                  minWidth: 50,
                                  height: 1,
                                  child: FlatButton(

                                    child: Icon(Icons.remove,
                                        size :15.0,
                                        color:
                                        Colors.white
                                    ),
                                  onPressed: (){

                                    setState(() {
                                    if (widget.tablemenu.categoryDishes[index].cartCounter != 0){
                                      int indexToDelete= 0;
                                      for(int i=0;i<widget.cartList.length;i++) {
                                         if(widget.cartList[i].cartDishName== widget.tablemenu.categoryDishes[index].dishName) {
                                           indexToDelete=i;
                                             break;

                                        }

                                      }


                                      widget.cartList.removeAt(indexToDelete) ;

                                      --widget.tablemenu.categoryDishes[index].cartCounter;
                                        cartUpdate();
                                      }






                                    
                                  });
                                  },
                                  ),

                                ),


                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular((5)),
                    child: CachedNetworkImage(
                      imageUrl: '${widget.tablemenu.categoryDishes[index].dishImage}',
                      errorWidget: (context,url,error)=> Image.network('http://restaurants.unicomerp.net/images/Restaurant/Item/Item_100000025.jpg',
                          width: 75,
                          height: 75,
                          fit: BoxFit.fill
                      ),
                      width: 75,
                      height: 75,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),


              ],

            ),
          );
        });
  }
}

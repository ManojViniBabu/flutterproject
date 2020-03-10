import 'package:flutter/material.dart';
import 'package:onion/utilities/CartList_model.dart';
import 'package:onion/utilities/TableMenu_model.dart';

class Cart extends StatefulWidget {
  final List<CartList> _cart;
  final List<TableMenu> tablemenu;
  //Function (int) callback;
  Cart(this._cart, this.tablemenu);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget orderTotal() {
    double sum = 0;
    for (int i = 0; i < widget._cart.length; i++) {
      sum = sum + widget._cart[i].cartDishPrice;
    }

    if (sum == 0) {
      return Container();
    } else
      return FlatButton(
        onPressed: () {
          var alertDialog = AlertDialog(
              title: Text("Your Order Has Been Placed Successfully"),
              content: Text("Have Delicious Day "));

          showDialog(
              context: context, builder: (BuildContext context) => alertDialog);
        },
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(

            height: 60,
            width: 300,
            child: Card(
              color: Colors.green[500],
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('TOTAL : SAR',
                      style: TextStyle(color: Colors.white)),
                  Text(sum.toStringAsFixed(2),style: TextStyle(color: Colors.white),),
                  Text('Place Order ',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                  Icon(Icons.chevron_right,color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
          itemCount: widget._cart.length,
          itemBuilder: (context, index) {
            var item = widget._cart[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: Text(item.cartDishName)),
                      // SizedBox(width:  10 ,),
                      Text(
                        item.dishCurrency,
                      ),
                      // SizedBox(width:  10 ,),
                      Text(
                        item.cartDishPrice.toString(),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.deepOrange,
                      ),
                      onTap: () {
                        for (int i = 0; i < widget.tablemenu.length; i++) {
                          for (int j = 0;
                              j < widget.tablemenu[i].categoryDishes.length;
                              j++) {
                            if (widget
                                    .tablemenu[i].categoryDishes[j].dishName ==
                                item.cartDishName) {
                              --widget
                                  .tablemenu[i].categoryDishes[j].cartCounter;
                            }
                          }
                        }

                        setState(() {
                          widget._cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
      bottomSheet: orderTotal(),
    );
  }
}

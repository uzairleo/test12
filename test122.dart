import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text('widget.titl'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context,mdoal,child)=>ListView.builder(
        itemCount:mdoal.cartList.length,
        itemBuilder: (context, index) {
          return ListItem(mdoal.cartList[index],index);
        },
      ),
    ));
  }
}

class ListItem extends StatelessWidget {
  var cart;
  var index;
  ListItem(this.cart,this.index);
 
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, modal, child) => Container(
          color: Colors.orange,
          child: Row(children: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  modal.addToCart(index);
                  // addToCart();
                }),
            Text('${cart.counter}'),
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  modal.removeCart(index);
                }),
          ])),
    );
  }

 
}

class ItemProvider with ChangeNotifier {
  List<CartModal> cartList = [
    CartModal(),
    CartModal(),
    CartModal(),
    CartModal(),
    CartModal(),
  ];

  addToCart(index) {
   
    cartList[index].counter++;
    notifyListeners();
  }

  removeCart(index) {
   
    cartList[index].counter--;
    notifyListeners();
  }
}

class CartModal {
  
  int counter=0;

  CartModal();
}

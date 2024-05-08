import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprjgroup7/checkout.dart';
import 'package:flutterprjgroup7/products.dart';
import 'package:flutterprjgroup7/toys.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.toys}) : super(key: key);

  final Toys toys;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool test = true;
  int quantity = 1;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        test = false;
      });
    });
  }

  void increaseQuantity() {
    setState(() {
      if (quantity < 10) {
        quantity++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You Can Add Maximum 10 Quantity !!!')),
        );
      }
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You Need To Add Atleast 1 Quantity !!!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.toys.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Tooltip(
              message: "Products",
              child: Icon(color: Colors.black, Icons.list),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Products()),
              );
            },
          ),
          IconButton(
            icon: Tooltip(
              message: "Checkout",
              child: Icon(color: Colors.black, Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Checkout(toys: null, quantity: 0)),
              );
            },
          ),
          IconButton(
            icon: Tooltip(
              message: "About",
              child: Icon(color: Colors.black, Icons.info_outline),
            ),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  "images/logo.png",
                  width: 100,
                  height: 100,
                ),
                applicationName: "Toy Shop",
                applicationVersion: "Version : 5.4.5",
                applicationLegalese: "© 2024 Toy Shop",
                children: [
                  Text(
                      textAlign: TextAlign.justify,
                      "Experience boundless joy with our meticulously curated selection of toys. From classics to innovative gems, each item ignites imagination and fosters growth. Shop confidently with our commitment to safety and quality. Join our community, where parents connect and celebrate the wonders of childhood. Discover the magic of playtime with Toy Shop."),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.toys.image,
                child: Image(
                  width: 300,
                  height: 300,
                  image: AssetImage(
                    widget.toys.image,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1500),
                opacity: test ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.toys.name + " By " + widget.toys.brand,
                      style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        widget.toys.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Price : " + widget.toys.price.toString() + "\$",
                      style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Select Quantity",
                      style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: increaseQuantity,
                          child: Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: CircleBorder(),
                            elevation: 3,
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: decreaseQuantity,
                          child: Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: CircleBorder(),
                            elevation: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Product Selected!!!')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Checkout(
                                  toys: widget.toys,
                                  quantity: quantity,
                                ),
                              ),
                            );
                          },
                          child: Text("Buy Now"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.zero),
                            elevation: 8, // Button shadow
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Go Back"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.zero),
                            elevation: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprjgroup7/toys.dart';
import 'package:flutterprjgroup7/products.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key, this.toys, this.quantity = 0}) : super(key: key);

  final Toys? toys;
  final int? quantity;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final formCheckout = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController securityCodeController = TextEditingController();

  bool test = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        test = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.toys != null ? widget.toys!.price * widget.quantity!.toDouble() : 0.0;

      return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Checkout"),
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
                MaterialPageRoute(builder: (context) => Checkout(toys: null, quantity: 0))
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: formCheckout,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.toys != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedRotation(
                      turns: test ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedOpacity(
                        opacity: test ? 0 : 1,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: test ? 100 : 200,
                          height: test ? 100 : 200,
                          child: Image(
                            width: 200,
                            height: 200,
                            image: AssetImage(widget.toys!.image),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    AnimatedOpacity(
                      opacity: test ? 0 : 1,
                      duration: const Duration(seconds: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name : " + widget.toys!.name,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Price : " + widget.toys!.price.toString() + "\$",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Quantity : " + widget.quantity.toString(),
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Grand Total : " + total.toStringAsFixed(2) + "\$",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 50),
              Text(
                "Personal Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'First name cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last name is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Last name cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required!';
                        }
                        if (!RegExp(r'[a-zA-Z0-9._-]+@[a-z]+\.+[a-z]+').hasMatch(value)) {
                          return 'Enter valid email address!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: mobileNumberController,
                      decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile number is required!';
                        }
                        if (!RegExp(r'^(\+?1\s?)?(\()?\d{3}(\))?(-|\s)?\d{3}(-|\s)\d{4}$').hasMatch(value)) {
                          return 'Enter valid Canadian mobile number!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Address Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  if (!RegExp(r'\d+\s+[a-zA-Z]+\s+[a-zA-Z]+').hasMatch(value)) {
                    return 'Enter valid Canadian address!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                          hintText: 'City',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'City is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'City cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: provinceController,
                      decoration: InputDecoration(
                          hintText: 'Province',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Province is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Province cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: countryController,
                      decoration: InputDecoration(
                          hintText: 'Country',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Country is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Country cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: postalCodeController,
                      decoration: InputDecoration(
                          hintText: 'Postal Code',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Postal code is required!';
                        }
                        if (!RegExp(r'[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d').hasMatch(value)) {
                          return 'Please enter valid Canadian postal code!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Payment Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cardNumberController,
                      decoration: InputDecoration(
                          hintText: 'Card Number (################)',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Card number is required!';
                        }
                        if (!RegExp(r'\d{16}').hasMatch(value)) {
                          return 'Enter valid 16 digit card number!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: cardHolderNameController,
                      decoration: InputDecoration(
                          hintText: 'Card Holder Name',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Card holder name is required!';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Card holder name cannot contain digits or special characters!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                          hintText: 'Expiry Date (MM/YY)',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Expiry date is required!';
                        }
                        if (!RegExp(r'(0[1-9]|1[0-2])/(\d{2})').hasMatch(value)) {
                          return 'Enter valid expiry date in MM/YY format!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: securityCodeController,
                      decoration: InputDecoration(
                          hintText: 'Security Code (***)',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Security code is required!';
                        }
                        if (!RegExp(r'\d{3}').hasMatch(value)) {
                          return 'Enter valid 3 digit security code!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formCheckout.currentState!.validate()) {
                        firstNameController.clear();
                        lastNameController.clear();
                        emailController.clear();
                        mobileNumberController.clear();
                        addressController.clear();
                        cityController.clear();
                        provinceController.clear();
                        countryController.clear();
                        postalCodeController.clear();
                        cardNumberController.clear();
                        cardHolderNameController.clear();
                        expiryDateController.clear();
                        securityCodeController.clear();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Order Confirmation'),
                              content: Text('Congratulations!! Your order has been placed successfully.'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('OK'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                    elevation: 8,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Products(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      padding:EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      elevation: 8,
                    ),
                    child: Text('Place Order'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Go Back"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      padding:EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      elevation: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
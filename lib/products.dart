import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprjgroup7/details.dart';
import 'package:flutterprjgroup7/toys.dart';
import 'package:flutterprjgroup7/checkout.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Toys> toyList = [];

    toyList.add(Toys("Racing Car", "Velocity Racers", 45.45, "images/racing_car.jpg", "Experience the thrill of high-speed racing with the Super Speed RC Car. This sleek and responsive remote-controlled car is designed for exciting races and precision control. With its aerodynamic design and powerful motor, it's the perfect choice for young speed enthusiasts who crave adrenaline-packed adventures."));
    toyList.add(Toys("Ludo Game", "Lego", 62.99, "images/ludo.jpg", "Ludo is a strategy board game for 2 to 4 players. The game is played on a square board divided into a cross-shaped path, forming a total of 76 squares. Each player has four tokens of a distinct color, and the objective is to move all four tokens from the starting area to the center of the board, known as home area."));
    toyList.add(Toys("Teddy Bear", "TeddyB", 99.99, "images/teddy_bear.jpg", "The Huggable Teddy Bear is an iconic and timeless soft toy cherished by children and adults alike. With its endearing design and plush construction, this teddy bear is the epitome of comfort and companionship. Available in a variety of colors, from classic brown to pastel hues, the teddy bear caters to individual preferences. This versatility allows for personalization, making it an ideal gift for occasion."));
    toyList.add(Toys("Dino Puzzle", "Monopoly", 23.99, "images/dino_puzzle.jpg", "Embark on a prehistoric adventure with the Dino Discovery Puzzle. This 3D puzzle allows young paleontologists to assemble their own dinosaur skeleton, fostering problem-solving skills and spatial awareness. The detailed pieces snap together to create an impressive model, making learning about dinosaurs a hands-on and enjoyable experience."));
    toyList.add(Toys("Unicorn Soft Toy", "Dreamland", 55.59, "images/unicorn_toy.jpg", "The Enchanted Unicorn Plush is a magical companion for imaginative play. With a soft and huggable design, shimmering horn, and a vibrant rainbow-colored mane, this plush brings a touch of enchantment to any playtime. It's the perfect cuddly friend for children who love fairytales and mythical creatures."));
    toyList.add(Toys("Delux Drawing Set", "Creative Creations", 64.89, "images/drawing_set.jpg", "Unleash creativity with the MegaArt Deluxe Drawing Set. This comprehensive art kit includes everything a young artist needs to express themselves. With a variety of colored pencils, markers, crayons, and sketch pads, kids can explore their artistic talents and create masterpieces in a rainbow of colors."));
    toyList.add(Toys("Musical Keyboard", "Harmony Play", 34.79, "images/piano.jpg", "Introduce the joy of music with the Musical Magic Keyboard. This interactive keyboard lights up as kids play, providing a visual and auditory delight. With various instrument sounds, rhythm options, and pre-recorded tunes, children can explore the world of music while having fun and developing their musical talents."));
    toyList.add(Toys("Cooking Set", "Little Chef", 29.99, "images/cooking_set.jpg", "Encourage culinary creativity with the Chef-in-Training Cooking Set. This pretend play kit includes mini pots, pans, and utensils, allowing young chefs to engage in imaginative cooking adventures. The realistic design and durable materials make it the perfect set for aspiring culinary artists to hone their cooking skills in a playful setting."));
    toyList.add(Toys("DIY Craft Kit", "Creative Creations", 76.89, "images/craft_kit.jpg", "The DIY Craft Kit is an exciting and versatile set designed to inspire creativity and hands-on artistic expression in children. Packed with a variety of materials and supplies, this kit empowers young minds to explore their imagination and create unique art projects.The kit includes a diverse selection of crafting materials such as colorful papers, fabrics, beads, buttons, sequins, and more. These elements encourage children to experiment with different textures and mediums."));
    toyList.add(Toys("Jump Rope", "Hello Kitty", 44.78, "images/jump_rope.jpg", "The Jump Rope is a classic and versatile piece of exercise equipment designed for cardiovascular fitness and fun physical activity. It consists of a length of rope with handles at each end, and its simplicity belies its effectiveness in promoting coordination, endurance, and overall health.The jump rope is crafted from durable materials such as nylon, leather, or PVC. These materials ensure longevity and resistance to wear, making it suitable for both indoor and outdoor use."));


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Our Products"),
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
        body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: toyList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details(toys: toyList[index])));
                },
                child: Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: toyList[index].image,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image(
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            image: AssetImage(toyList[index].image),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand : " + toyList[index].brand,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Name : " + toyList[index].name,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Price : " + toyList[index].price.toString() + "\$",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Details(toys: toyList[index]),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                              elevation: 8,
                            ),
                            child: Text("View Details"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
       )
    );
  }
}
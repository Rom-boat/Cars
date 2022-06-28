import 'package:flutter/material.dart';

class Car {
  final String name;
  final String sum;
  final Image images;

  Car({
    required this.name,
    required this.sum,
    required this.images,
  });
}

class CarListWidgets extends StatelessWidget {
  final _cars = [
    Car(
      name: 'GLC Купе',
      sum: 'Від: 1 470 524.27 грн',
      images: Image(
        image: AssetImage('images/606ed8c0840f7.png'),
      ),
    ),
    Car(
      name: 'CLA Shooting Brake',
      sum: 'Від: 953 981.40 грн',
      images: Image(
        image: AssetImage('images/606ed7fb08fec.png'),
      ),
    ),
    Car(
      name: 'G-Клас',
      sum: 'Від: 3 581 271.11 грн',
      images: Image(
        image: AssetImage('images/606ed885e7f9a.png'),
      ),
    ),
    Car(
      name: 'E-Клас Купе',
      sum: 'Від: 1 473 028.15 грн',
      images: Image(
        image: AssetImage('images/606ed83fca27f.png'),
      ),
    )
  ];
  CarListWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Модельний ряд'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _cars.length,
          itemExtent: 250,
          itemBuilder: (BuildContext context, int index) {
            final car = _cars[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    car.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    car.sum,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          car.images,
                        ],
                      ),
                    ),
                  ),
                  InkWell(borderRadius: BorderRadius.circular(20), onTap: () {})
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

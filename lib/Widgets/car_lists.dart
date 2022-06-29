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

class CarListWidgets extends StatefulWidget {
  CarListWidgets({Key? key}) : super(key: key);

  @override
  State<CarListWidgets> createState() => _CarListWidgetsState();
}

class _CarListWidgetsState extends State<CarListWidgets> {
  final _cars = [
    Car(
      name: 'Maybach GLS',
      sum: 'Від: 4 909 070.56 грн',
      images: Image(
        image: AssetImage('images/60706d4506b18.png'),
      ),
    ),
    Car(
      name: 'C-Клас Кабріо',
      sum: 'Від: 1 322 238.83 грн',
      images: Image(
        image: AssetImage('images/606ed9343718d.png'),
      ),
    ),
    Car(
      name: 'GLC Купе',
      sum: 'Від: 1 470 524.27 грн',
      images: Image(
        image: AssetImage('images/606ed8c0840f7.png'),
      ),
    ),
    Car(
      name: 'S-Клас Седан',
      sum: 'Від: 3 078 958.47 грн',
      images: Image(
        image: AssetImage('images/606ed7e35b1b4.png'),
      ),
    ),
    Car(
      name: 'Vito Tourer',
      sum: 'Від: 1 114 211.12 грн',
      images: Image(
        image: AssetImage('images/60b64938de78f.png'),
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
  var _filtereCars = <Car>[];
  final _searchController = TextEditingController();

  void _searhCars() {
    final qveri = _searchController.text;
    if (qveri.isNotEmpty) {
      _filtereCars = _cars.where(
        (Car car) {
          return car.name.toLowerCase().contains(qveri.toLowerCase());
        },
      ).toList();
    } else {
      _filtereCars = _cars;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searhCars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Модельний ряд'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 60),
              itemCount: _filtereCars.length,
              itemExtent: 300,
              itemBuilder: (BuildContext context, int index) {
                final car = _filtereCars[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                                      horizontal: 15, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              car.images,
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                          borderRadius: BorderRadius.circular(20), onTap: () {})
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                label: Text('Пошук'),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white.withAlpha(500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

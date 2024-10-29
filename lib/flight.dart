import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Flight extends StatefulWidget {
  @override
  _FlightState createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Text('Flight'),
          const Expanded(child: SizedBox(width: 5)),
          SvgPicture.asset('assets/notification.svg', width: 18, height: 25),
          SvgPicture.asset('assets/send.svg', width: 30, height: 35),
        ]),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian pertama, untuk penerbangan pertama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.flight, color: Colors.red),
                          SizedBox(width: 8),
                          Text("MU 788",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Text("The fastest",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("9:10 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Icon(Icons.airplanemode_active, color: Colors.grey),
                      Text("2:50 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("14 June, 2023",
                          style: TextStyle(color: Colors.grey)),
                      Text("11h 40m", style: TextStyle(color: Colors.grey)),
                      Text("15 June, 2023",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Divider(thickness: 1, height: 32),
                  
                  // Bagian kedua, untuk penerbangan kedua
                  Row(
                    children: [
                      Icon(Icons.flight, color: Colors.red),
                      SizedBox(width: 8),
                      Text("MU 787",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12:30 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Icon(Icons.airplanemode_active, color: Colors.grey),
                      Text("7:10 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("26 June, 2023",
                          style: TextStyle(color: Colors.grey)),
                      Text("12h 40m", style: TextStyle(color: Colors.grey)),
                      Text("27 June, 2023",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  // Kelas dan harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.airline_seat_recline_extra,
                              color: Colors.red),
                          SizedBox(width: 8),
                          Text("Business class",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                      Text("\$2,344.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promotion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

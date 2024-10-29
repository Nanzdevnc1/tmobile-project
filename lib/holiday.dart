import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Holiday extends StatefulWidget {
  @override
  _HolidayState createState() => _HolidayState();
}

class _HolidayState extends State<Holiday> {
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
          const Text('Destinations'),
          const Expanded(child: SizedBox(width: 5)),
          SvgPicture.asset('assets/notification.svg', width: 18, height: 25),
          SvgPicture.asset('assets/send.svg', width: 30, height: 35),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage('assets/indonesia.webp'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bali',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Pura Ulun Danu Bratan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/GWK.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bali',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'GWK',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/pu.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bali',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Pura Uluwatu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/pb.webp'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bali',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Pura Besakih',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Bromo.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawa',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Bromo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Kawah_Ijen.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawa',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Kawah Ijen',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Kepulauan_Seribu.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawa',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Kepulauan Seribu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Tumpak_Sewu.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawa',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Tumpak Sewu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Bukit_khayangan.webp'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sumatera',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Bukit Khayangan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Danau_toba.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sumatera',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Danau Toba',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Lhok_me.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sumatera',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Pantai Lhok Me',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Kalianda.webp'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sumatera',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Pesisi Kalianda',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Raja_ampat.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Papua',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Raja Ampat',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Lembah_baliem.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Papua',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Lembah Baliem',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Lorentz.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Papua',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Taman Nasional Lorentz',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('assets/Danau_sentani.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ]),
                  ),
                ),
                Positioned(
                    left: 30,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Papua',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/location.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Danau Sentani',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.carterOne(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ],
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

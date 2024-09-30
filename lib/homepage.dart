import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Menyimpan indeks dari kontainer yang sedang dipilih
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Warna dasar Scaffold yang tidak terlalu putih
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/location.svg',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 5),
            Text(
              'Bali, Indonesia',
              style: GoogleFonts.gowunBatang(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox(width: 5)),
            SvgPicture.asset('assets/notification.svg', width: 18, height: 25),
            SizedBox(width: 8),
            SvgPicture.asset('assets/send.svg', width: 30, height: 35),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack untuk gambar dengan teks dan gradasi gelap di samping kiri
            Stack(
              children: [
                // Gambar sebagai latar belakang
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/indonesia.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradasi gelap di samping kiri gambar
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(0.9), // Warna hitam transparan di kiri
                        Colors.transparent, // Transparan di kanan
                      ],
                    ),
                  ),
                ),
                // Teks di atas gambar dengan latar belakang gradasi
                Positioned(
                  left: 20,
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bali',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4), // Jarak kecil antara dua teks
                      Text(
                        'And Explore the world',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Book Now',
                          style: GoogleFonts.carterOne(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Categories',
                      style: GoogleFonts.baumans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            // SingleChildScrollView untuk scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  // Kontainer Holiday
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == 0 ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/holiday.svg',
                            width: 50,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text('Holiday'),
                        ],
                      ),
                    ),
                  ),
                  // Kontainer Rental
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == 1 ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/rental.svg',
                            width: 50,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text('Rental'),
                        ],
                      ),
                    ),
                  ),
                  // Kontainer Plane
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == 2 ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/plane.svg',
                            width: 50,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text('Plane'),
                        ],
                      ),
                    ),
                  ),
                  // Kontainer Hotels
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == 3 ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/hotel.svg',
                            width: 50,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text('Hotels'),
                        ],
                      ),
                    ),
                  ),
                  // Kontainer Others
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == 4 ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/other.svg',
                            width: 50,
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text('Others'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:final_project/flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'holiday.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Menyimpan indeks dari kontainer yang sedang dipilih
  int? selectedIndex;
  bool isLoved = false;
  bool isLoved1 = false;
  bool isLoved2 = false;

  int _selectedIndex = 0;

  // Dropdown value
  String selectedLocation = 'Bali, Indonesia';

  // List of available locations
  final List<String> locations = [
    'Bali, Indonesia',
    'Jawa, Indonesia',
    'Sumatera, Indonesia',
    'Papua, Indonesia',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFF5F5F5), // Warna dasar Scaffold yang tidak terlalu putih
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Row(
          mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran row dengan konten
          children: [
            SvgPicture.asset(
              'assets/location.svg',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 5), // Jarak antara ikon lokasi dan teks
            DropdownButton<String>(
              value: selectedLocation,
              isDense: true, // Membuat dropdown lebih kompak
              icon: Icon(Icons.arrow_drop_down,
                  size: 0), // Hilangkan segitiga dropdown
              underline: SizedBox(), // Hilangkan garis bawah
              style: GoogleFonts.gowunBatang(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              items: locations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
                      Colors.black
                          .withOpacity(0.9), // Warna hitam transparan di kiri
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
                      selectedIndex =
                          0; // Pastikan index diperbarui terlebih dahulu
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Holiday()), // Navigasi ke halaman Holiday
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.all(10.0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? Colors.pinkAccent
                          : Colors.white, // Kondisi perubahan warna
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
                      color:
                          selectedIndex == 1 ? Colors.pinkAccent : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/rental2.svg',
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
                      selectedIndex =
                          0; // Pastikan index diperbarui terlebih dahulu
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Flight()), // Navigasi ke halaman Holiday
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.all(10.0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 2 ? Colors.pinkAccent : Colors.white,
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
                      color:
                          selectedIndex == 3 ? Colors.pinkAccent : Colors.white,
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
                      color:
                          selectedIndex == 4 ? Colors.pinkAccent : Colors.white,
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Below are Several Beautiful',
                      style: GoogleFonts.baumans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Destinations in Bali',
                      style: GoogleFonts.baumans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox(width: 10)),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical:
                            8), // Padding lebih kecil untuk tombol 'Show More'
                  ),
                  child: Text(
                    'Show More',
                    style: GoogleFonts.carterOne(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12, // Ukuran font lebih kecil dari 'Book Now'
                    ),
                  ),
                ),
              ),
            ],
          ),

          Stack(
            children: [
              // Gambar sebagai latar belakang
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/GWK.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gradasi gelap di atas gambar
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black
                          .withOpacity(0.5), // Gradasi hitam transparan di atas
                      Colors.transparent, // Transparan di bawah
                    ],
                  ),
                ),
              ),

              // Teks dan ikon lokasi di kiri atas (gunakan ikon SVG)
              Positioned(
                top: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Sejajarkan vertikal
                  children: [
                    SvgPicture.asset(
                      'assets/place.svg', // Ganti dengan path ikon lokasi SVG Anda
                      width: 20,
                      height: 20,
                      color: Colors.white, // Pastikan warna sesuai
                    ),
                    SizedBox(width: 5), // Jarak antara ikon lokasi dan teks
                    Text(
                      'GWK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Ikon love di kanan atas dengan GestureDetector untuk menangani tap
              Positioned(
                top:
                    25, // Pastikan nilai top sama dengan ikon dan teks di sebelah kiri
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoved = !isLoved; // Toggle state ketika ikon di-tap
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/love.svg', // Ganti dengan path ikon love SVG Anda
                    width: 16, // Ukuran width untuk ikon love
                    height: 16, // Ukuran height untuk ikon love
                    color: isLoved
                        ? Colors.pink
                        : Colors.white, // Ubah warna sesuai state
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Gambar 1 (Pura Uluwatu)
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/pu.jpg'), // Ganti dengan gambar Pura Uluwatu
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Gradasi dan ikon love pada gambar 1
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/place.svg',
                            width: 15,
                            height: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                              width: 5), // Jarak antara ikon lokasi dan teks
                          Text(
                            'Pura Uluwatu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Teks diperkecil
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoved1 = !isLoved1;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/love.svg',
                          width: 14,
                          height: 14,
                          color: isLoved1 ? Colors.pink : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Gambar 2 (Pura Besakih)
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/pb.webp'), // Ganti dengan gambar Pura Besakih
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Gradasi dan ikon love pada gambar 2
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/place.svg',
                            width: 15,
                            height: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                              width: 5), // Jarak antara ikon lokasi dan teks
                          Text(
                            'Pura Besakih',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Teks diperkecil
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoved2 = !isLoved2;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/love.svg',
                          width: 14,
                          height: 14,
                          color: isLoved2 ? Colors.pink : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
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

  Widget _buildCategoryCard(String iconPath, String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(10.0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.pinkAccent : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 50,
              height: 40,
            ),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

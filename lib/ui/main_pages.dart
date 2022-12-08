import 'package:dafidea/ui/beranda/home_page.dart';
import 'package:dafidea/ui/profle/profile.dart';
import 'package:flutter/material.dart';
import '/shared/theme.dart';

class MainPage extends StatefulWidget {
  //dari stateless ke statefu
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex =
      0; //halaman pertama kali untuk muncul sekaligus membuat efek tombol berpindah

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return Container(
        decoration: BoxDecoration(color: Colors.black, boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0.0, 10.0))
        ]),
        child: ClipRRect(
          // borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          child: BottomAppBar(
            color: whiteColor,
            shape: CircularNotchedRectangle(),
            notchMargin: 6, //jarak antar buttom
            elevation: 0,
            //clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, //Merapihkan icon
              elevation: 0, //menghilangkan garis hitam
              backgroundColor: whiteColor,
              selectedItemColor: blueColor,
              unselectedItemColor: blackColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },

              items: [
                //membuat icon di navigasi
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    child: Image.asset(
                      'assets/ic_more.png',
                      width: 25,
                      color:
                          currentIndex == 0 ? purpleColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    child: Image.asset(
                      'assets/ic_edit_profile.png',
                      width: 25,
                      color: currentIndex == 1
                          ? purpleColor
                          : Color(0xff808191), //Ganti warna saat di klik
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white, //warna background
      bottomNavigationBar: customBottomNav(), //navigasi bawah
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Navigator.pushNamed(context, '/add-page');
        },
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
    );
  }
}

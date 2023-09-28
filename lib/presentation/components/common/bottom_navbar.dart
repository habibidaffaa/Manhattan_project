import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/color.dart';
import '../../pages/artikel_main_page.dart';
import '../../pages/galery_main_page.dart';
import '../../pages/home_page.dart';
import '../../pages/konsultasi_page.dart';
import '../../pages/varises_main_page.dart';
import '../../providers/button_providers.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider =
        Provider.of<ButtonProviders>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomNavigationBar(
          currentIndex: bottomNavBarProvider.currentIndex,
          onTap: (index) {
            bottomNavBarProvider.currentIndex = index;
            switch (index) {
              case 0:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                break;
              case 1:
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const VarisesMainPage()),
                );
                break;
              case 2:
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const KonsultasiPage()),
                );
                break;
              case 3:
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ArtikelMainPage()),
                );
                break;
              case 4:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GaleryMainPage()),
                );
                break;
              // Tambahkan kasus untuk halaman lainnya sesuai kebutuhan.
            }
          },
          selectedItemColor: BaseColors.primary600,
          unselectedItemColor: BaseColors.neutral500,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/home.png'),
                color: bottomNavBarProvider.currentIndex == 0
                    ? BaseColors.primary600
                    : BaseColors.neutral500,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(const AssetImage('assets/images/lamp-on.png'),
                  color: bottomNavBarProvider.currentIndex == 1
                      ? BaseColors.primary600
                      : BaseColors.neutral500),
              label: 'Varises',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/Button.png',
                  width: 24,
                  height: 24,
                  color: bottomNavBarProvider.currentIndex == 2
                      ? BaseColors.primary600
                      : BaseColors.neutral500),
              label: 'Konsultasi',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  const AssetImage('assets/images/archive-book.png'),
                  color: bottomNavBarProvider.currentIndex == 3
                      ? BaseColors.primary600
                      : BaseColors.neutral500),
              label: 'Artikel',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  const AssetImage('assets/images/gallery-favorite.png'),
                  color: bottomNavBarProvider.currentIndex == 4
                      ? BaseColors.primary600
                      : BaseColors.neutral500),
              label: 'Galeri',
            ),
          ],
        ),
      ],
    );
  }
}

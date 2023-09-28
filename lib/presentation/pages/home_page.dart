import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';
import '../components/common/app_navbar.dart';
import '../components/common/bottom_navbar.dart';
import '../components/common/skeleton_home_page.dart';
import 'artikel_main_page.dart';
import 'detail_artikel_main.dart';
import 'konsultasi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Inisialisasi _selectedIndex

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final controller = PageController(viewportFraction: 0.8);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(() {
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      body: isLoading
          ? const SkeletonHomePage()
          : ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      // left, top, right, bottom
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BaseColors.info700,
                          border: Border.all(
                            color: BaseColors.neutral200,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/image 3.png',
                                          width: 120,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Seminar Varises Indonesia',
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'inter',
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'dr. Niko Azhari Hidayat, Sp.BTKV(K)',
                                          style: AppTheme
                                              .appTextTheme.tinyNoneMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SmoothPageIndicator(
                                              controller: controller,
                                              count: 1,
                                              effect: WormEffect(
                                                dotHeight: 10,
                                                dotWidth:
                                                    28, // Ukuran tombol pertama
                                                dotColor: Colors.grey[300]!,
                                                activeDotColor:
                                                    BaseColors.neutral50,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            SmoothPageIndicator(
                                              controller: controller,
                                              count:
                                                  3, // Jumlah tombol bulat selanjutnya
                                              effect: WormEffect(
                                                dotHeight: 10,
                                                dotWidth:
                                                    10, // Ukuran tombol-tombol selanjutnya
                                                dotColor: Colors.grey[300]!,
                                                activeDotColor:
                                                    BaseColors.neutral50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: Image.asset(
                                      'assets/images/image 2.png',
                                      width: 130,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: BaseColors.neutral100,
                      border: Border.all(
                        color: BaseColors.neutral200,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Frame 6.png',
                            width: 300,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Konsultasi Yuk!',
                            style: AppTheme.appTextTheme.largeNoneMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Jika anda punya keluhan dengan kulit anda, jangan ragu untuk konsultasi dengan kami.',
                            style: AppTheme.appTextTheme.smallNormalReguler,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const KonsultasiPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color(0xFFEC53B8),
                              padding: const EdgeInsets.all(
                                  0), // Sesuaikan padding sesuai kebutuhan
                              elevation:
                                  2, // Sesuaikan tinggi elevasi sesuai kebutuhan
                            ),
                            child: Ink(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Konsultasi Sekarang',
                                      style: AppTheme
                                          .appTextTheme.smallNoneMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Artikel Terbaru',
                            style: AppTheme.appTextTheme.largeNoneMedium!
                                .copyWith(color: BaseColors.neutral950),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ArtikelMainPage(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: BaseColors.neutral50,
                                border: Border.all(
                                  color: BaseColors.primary200,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lihat Semua',
                                      style: AppTheme
                                          .appTextTheme.tinyTightMedium!
                                          .copyWith(
                                              color: BaseColors.primary500),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: BaseColors.primary500,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BaseColors.neutral100,
                          border: Border.all(
                            color: BaseColors.neutral50,
                          ),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/artikel1.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: BaseColors.primary500,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Saran Dokter',
                                      style: AppTheme
                                          .appTextTheme.xSmallNoneReguler!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailArtikelMain(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Pentingnya Penanganan dan Pemberian Obat Varises Esofagus yang Tepat',
                                      style: AppTheme
                                          .appTextTheme.largeNoneMedium!
                                          .copyWith(
                                              color: BaseColors.neutral950),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Varises esofagus adalah pembengkakan atau pelebaran pembuluh darah pada...',
                                      style: AppTheme
                                          .appTextTheme.smallNormalReguler!
                                          .copyWith(
                                              color: BaseColors.neutral600),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_rounded,
                                          color: BaseColors.neutral600,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '12 Agustus 2021',
                                          style: AppTheme
                                              .appTextTheme.smallNoneReguler!
                                              .copyWith(
                                                  color: BaseColors.neutral500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

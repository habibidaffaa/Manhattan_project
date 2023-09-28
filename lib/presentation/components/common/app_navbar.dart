import 'package:flutter/material.dart';
import '../../../common/app_theme.dart';
import '../../../common/color.dart';
import '../../pages/about_main_page.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Padding(
        // left, top, right, bottom
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/image 1.png',
              width: 130,
              height: 130,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: BaseColors.neutral200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/id Indonesia.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'ID',
                        style: AppTheme.appTextTheme.xSmallNoneMedium!
                            .copyWith(color: BaseColors.neutral950),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutMainPage()),
                    );
                  },
                  child: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

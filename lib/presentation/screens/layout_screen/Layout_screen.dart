import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/services/cache_helper.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/core/utils/background.dart';
import 'package:smart_home_app/generated/l10n.dart';
import 'package:smart_home_app/presentation/cubits/app/app_cubit.dart';
import 'package:smart_home_app/presentation/cubits/layout/layout_cubit.dart';
import 'package:smart_home_app/presentation/screens/home_screen/home_screen.dart';
import 'package:smart_home_app/presentation/screens/sensor_reading_screen/sensor_reading_screen.dart';
import 'package:smart_home_app/presentation/screens/sensor_screen/sensor_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  final _pages = const [HomeScreen(), SensorsScreen(), SensorReadingScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: Stack(
              children: [
                const Background(),
                Column(
                  children: [
                    AppSize.verticalSpacer(40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text('Smartora', style: AppTextStyles.titleLarge),
                        BlocBuilder<AppCubit, AppState>(
                          builder: (context, state) {
                            return TextButton(
                              child: Text(
                                CacheHelper.sharedPreferences.getString(
                                          'lang',
                                        ) ==
                                        'ar'
                                    ? 'انجليزي'
                                    : 'Arabic',
                                style: const TextStyle(color: AppColors.white),
                              ),
                              onPressed: () {
                                BlocProvider.of<AppCubit>(context).changLang();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(child: _pages[currentIndex]),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<LayoutCubit>().changeTab(index),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey,
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.devices_other),
                  label: S.of(context).devices,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sensors),
                  label: S.of(context).sensors,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.area_chart),
                  label: S.of(context).analytics,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

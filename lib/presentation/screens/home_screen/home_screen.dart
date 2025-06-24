import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/core/utils/background.dart';
import 'package:smart_home_app/presentation/cubits/home/home_cubit.dart';
import 'package:smart_home_app/presentation/screens/device_screen/device_screen.dart';
import 'package:smart_home_app/presentation/screens/sensor_screen/sensor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _pages = const [DevicesScreen(), SensorsScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: Stack(
              children: [
                const Background(),
                Column(
                  children: [
                      AppSize.verticalSpacer(40.0),
           Text('Smartora',
              style: AppTextStyles.getTextTheme(context).headlineLarge?.copyWith(
             
              )),
                    Expanded(child: _pages[currentIndex]),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<HomeCubit>().changeTab(index),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.devices_other),
                  label: 'الأجهزة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sensors),
                  label: 'المستشعرات',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/data/datasources/firebase_device_datasource.dart';
import 'package:smart_home_app/data/datasources/weather_remote_datasource.dart';
import 'package:smart_home_app/data/repositories/device_repository_impl.dart';
import 'package:smart_home_app/data/repositories/weather_repository_impl.dart';
import 'package:smart_home_app/presentation/cubits/home/home_cubit.dart';
import 'package:smart_home_app/presentation/cubits/home/home_state.dart';
import 'package:smart_home_app/presentation/widgets/device_card.dart';
import 'package:smart_home_app/presentation/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => HomeCubit(
            DeviceRepositoryImpl(FirebaseDeviceDatasource()),
            WeatherRepositoryImpl(WeatherRemoteDataSource()),
          )..init(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            final weather = state.weather;

            return Column(
              children: [
                if (weather != null) WeatherWidget(),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.devices.length,
                    itemBuilder: (context, index) {
                      final device = state.devices[index];
                      return DeviceCardItem(device: device);
                    },
                  ),
                ),
              ],
            );
          } else if (state is HomeError) {
            log('Error loading devices: ${state.message}');
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No Devices'));
        },
      ),
    );
  }
}

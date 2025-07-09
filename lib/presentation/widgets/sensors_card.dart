import 'package:iconsax/iconsax.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/domain/entities/sensor_entity.dart';
import 'package:smart_home_app/presentation/cubits/sensore/sensor_cubit.dart';
import 'package:smart_home_app/presentation/cubits/sensore/sensor_state.dart';

class SensorsCardItem extends StatelessWidget {
  const SensorsCardItem({super.key, required this.sensors});

  final SensorEntity sensors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorCubit, SensorState>(
  
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius + 2),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                AppColors.primary,
                AppColors.secondary,
                AppColors.tertiary,
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
           
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      getIcon(sensors.sensorType),
                      color:
                        AppColors.white,
                    ), 
                    AppSize.horizontalSpacer(8.0),
                     Text(
                      sensors.sensorType,
                      style: AppTextStyles.titleSmall.copyWith(
                        color:
                           AppColors.white,
                      ),
                    ),
                  ],
                ),
                AppSize.verticalSpacer(4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'location: ${sensors.location}',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.grey,
                          ),
                      
                        ),
                         Text(
                      'value: ${sensors.value} ${sensors.unit}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    ],
                  ),
                   
                AppSize.verticalSpacer(4.0),
                Row(
                  children: [
                    Text(
                      'status: ${sensors.severity}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    const Spacer(),
                   Icon(
                    sensors.severity == 'critical' ? Iconsax.danger : sensors.severity == 'warning' ? Iconsax.warning_2 :Iconsax.location_tick,
                      color:   sensors.severity == 'critical' ? AppColors.red : sensors.severity == 'warning' ? AppColors.yellow : AppColors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

getIcon(String sensor){
  switch (sensor) {
    case 'dht11_humidity':
      return Icons.water_drop;
    case 'dht11_temp':
      return Icons.thermostat;
    case 'ldr':
      return Icons.wb_sunny;
    case 'mq2':
      return Icons.smoking_rooms_rounded;
    case 'fc-28':
      return Icons.grass;
    case 'ultrasonic':
      return Icons.social_distance;
    default:
      return Icons.device_unknown;
  }
}
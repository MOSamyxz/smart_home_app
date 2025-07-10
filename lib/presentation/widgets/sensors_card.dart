import 'package:iconsax/iconsax.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/domain/entities/sensor_entity.dart';
import 'package:smart_home_app/generated/l10n.dart';
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
          height: 150,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
         
                Row(
                  children: [
                    Icon(
                      getIcon(sensors.sensorType),
                      color:
                        AppColors.white,
                    ), 
                    AppSize.horizontalSpacer(8.0),
                     Text(
                      getSensorName(sensors.sensorType , context),
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                AppSize.verticalSpacer(4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${S.of(context).location}: ${getLocation(sensors.location, context)}',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.grey,
                          ),
                      ),
                       Text(
                      '${S.of(context).value}: ${sensors.value} ${sensors.unit}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    ],
                  ),
                   
                AppSize.verticalSpacer(4.0),
                Row(
                  children: [
                    Text(
                      '${S.of(context).status}: ${getSeverity(sensors.severity, context)}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    const Spacer(),
                   Icon(
                    sensors.severity == 'critical' ? Iconsax.danger : sensors.severity == 'warning' ? Iconsax.warning_2 :Iconsax.location_tick,
                      color:   sensors.severity == 'critical' ? AppColors.red : sensors.severity == 'warning' ? AppColors.yellow : AppColors.green,
                  size: 30,
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

getSensorName(String sensor, BuildContext context) {
  switch (sensor) {
    case 'dht11_humidity':
      return S.of(context).humidity_sensor;
    case 'dht11_temp':
      return S.of(context).temperature_sensor;
    case 'ldr':
      return S.of(context).light_sensor;
    case 'mq2':
      return S.of(context).gas_sensor;
    case 'fc-28':
      return S.of(context).soil_moisture_sensor;
    case 'ultrasonic':
      return S.of(context).ultrasonic_sensor;
    default:
      return 'Unknown Sensor';
  }
}
String getLocation (String device, BuildContext context) {
  switch (device) {
    case 'living_room':
      return S.of(context).living_room;
    case 'kitchen':
      return S.of(context).kitchen;
    case 'garage_door':
      return S.of(context).garage_door;
    case 'garden':
      return S.of(context).garden;
    case 'window':
      return S.of(context).window;
    default:
      return '';
  }
}
String getSeverity( String severity , BuildContext context) {
  switch (severity) {
  
    case 'warning':
      return S.of(context).warning;
    case 'info':
      return S.of(context).info;
    default:
      return 'Unknown Severity';
  }
}
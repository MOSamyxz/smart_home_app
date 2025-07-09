import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/domain/usecases/sensor_usecase.dart';
import 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorUsecase sensorUsecase;
 
  SensorCubit(this.sensorUsecase) : super(SensorInitial());


  StreamSubscription? _sensorsSubscription;

void streamSensors() {
  _sensorsSubscription?.cancel();
  _sensorsSubscription = sensorUsecase.streamAllSensors().listen((sensors) {
    emit(SensorLoaded(
      sensors,
    ));
  });
}
@override
Future<void> close() {
  _sensorsSubscription?.cancel();
  return super.close();
}

}

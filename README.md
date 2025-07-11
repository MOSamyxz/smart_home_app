# Smart Home IoT System with Blockchain Security

A modern Flutter mobile app that connects to an ESP32-powered smart home system, monitors sensors, controls devices, and displays real-time data via Firebase Realtime Database.

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-Mobile-blue.svg?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-Language-0175C2.svg?logo=dart&logoColor=white)](https://dart.dev/)
[![ESP32](https://img.shields.io/badge/ESP32-Hardware-blue.svg)](https://www.espressif.com/en/products/socs/esp32)
[![Firebase](https://img.shields.io/badge/Firebase-Backend-FFCA28.svg?logo=firebase&logoColor=black)](https://firebase.google.com/)

*An advanced Smart Home automation system integrating IoT sensors, real-time monitoring, device control, and blockchain-secured transaction logging.*

</div>

---
## 🧠 Overview

Smartora is a modern smart home app built with Flutter using Clean Architecture and Cubit state management.
The app connects to Firebase Realtime Database to display sensor readings and control devices like fans, LEDs, pumps, and the garage door — all with a sleek dark UI and multilingual support.

---

## ✨ Features
🔐 Firebase Authentication (email & password)

🌡️ Real-time sensor display: temperature, humidity, gas, light, soil, distance

💡 Control devices remotely: Fan, LED, Pump, Buzzer, Garage

📶 Live updates from Firebase Realtime Database

🌓 Dark Theme UI

🌍 Multilingual support (Arabic 🇪🇬 & English 🇺🇸)

📊 Charts with fl_chart

---

## 🏗️ Project Structure
```
lib/
├── core/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── cubits/
│   ├── screens/
│   └── widgets/
└── main.dart
```
Based on Clean Architecture + Cubit (Bloc package), making the app scalable, testable, and well-organized.

---

## 🔧 Getting Started

1. Clone the repository
```
git clone https://github.com/your-username/smartora_flutter.git
cd smartora_flutter
```
2. Install dependencies
```
flutter pub get
```
3. Firebase setup

- Go to [Firebase Console](https://firebase.google.com/)
- Create a new project
- Enable Authentication > Email/Password
- Create a Realtime Database
- Download and add your google-services.json to android/app/
4. Run the app
  ```
  flutter run
  ```

---

## 🔗 Firebase Structure
```
/devices/
/devicesCommands/
/latestSensors/
/sensors/
```
- /latestSensors/: Real-time values displayed in the app
- /devices/: Current device states
- /devicesCommands/: Write commands from app → hardware

---

## 🛠️ Used Packages
```
| Package                                               | Purpose                          |
| ----------------------------------------------------- | -------------------------------- |
| `flutter_bloc`                                        | State management                 |
| `firebase_core`, `firebase_auth`, `firebase_database` | Firebase services                |
| `fl_chart`                                            | charts                           |
| `intl`, `flutter_localizations`                       | Multi-language support           |
```

---

## 🌍 Language Support

✅ English
✅ Arabic

Easily switchable and fully localized using flutter_localizations.

---

## 🎯 Future Features

- Push notifications via FCM
- Room-based device grouping
- Scheduled actions (e.g. auto-turn off)
- Offline cache for full app experience

---


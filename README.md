# 🌊 Biorhythm Calculator

A beautiful, interactive Flutter application that calculates and visualizes your biorhythm cycles. Track your physical, emotional, and intellectual patterns with detailed analysis and mobile-friendly charts.

## ✨ Features

- **📊 Interactive Charts**: Smooth, touch-friendly biorhythm visualization
- **📅 Date Selection**: Easy birthdate and analysis date pickers
- **🔍 Smart Analysis**: Conditional detailed descriptions based on critical points
- **🌍 Multi-language**: Full support for English and Hungarian
- **📱 Mobile-First**: Responsive design optimized for all devices
- **🎨 Modern UI**: Clean light gray theme with Material Design 3
- **⚡ Performance**: Optimized with tree-shaken icons and efficient rendering

## 🧬 Biorhythm Cycles

The app tracks three core biorhythm cycles:

- **🏃 Physical Cycle (23 days)**: Energy, strength, and physical well-being
- **❤️ Emotional Cycle (28 days)**: Mood, creativity, and emotional stability  
- **🧠 Intellectual Cycle (33 days)**: Mental clarity, decision-making, and analytical thinking

## 🎯 Smart Analysis

The app provides detailed insights only when relevant:

- **Peak Analysis**: Shows detailed descriptions 1 day before, during, and after cycle peaks
- **Trough Analysis**: Provides guidance during low periods
- **Zero Crossing Analysis**: Insights during critical transition periods
- **Clean Interface**: No information overload - only shows what matters

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Dart SDK (3.0+)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/biorhythm-flutter-app.git
cd biorhythm-flutter-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Build for Production

**Web:**
```bash
flutter build web --release
```

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🌐 Localization

The app supports:
- **English** (en)
- **Hungarian** (hu)

Language can be toggled using the button in the app bar.

## 📱 Supported Platforms

- ✅ Web (Chrome, Firefox, Safari, Edge)
- ✅ Android (API 21+)
- ✅ iOS (11.0+)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🛠️ Built With

- **Flutter** - UI framework
- **fl_chart** - Beautiful charts
- **intl** - Internationalization
- **Material Design 3** - Modern UI components

## 📈 Chart Features

- **Touch/Tap Interactions**: Get exact values by touching the chart
- **Color-coded Lines**: Physical (red), Emotional (blue), Intellectual (green)
- **Date Markers**: Easy-to-read date labels
- **Percentage Display**: All values shown as percentages with 2 decimal precision
- **Responsive Legend**: Clear identification of each cycle

## 🔮 How Biorhythms Work

Biorhythms are based on the theory that our lives are influenced by rhythmic biological cycles:

1. **Physical Cycle**: Affects energy levels, strength, and physical capabilities
2. **Emotional Cycle**: Influences mood, feelings, and creative abilities
3. **Intellectual Cycle**: Impacts mental functions, logic, and decision-making

Each cycle follows a sinusoidal pattern from your birth date, helping you understand your natural rhythms.

## 🎨 Design Philosophy

- **Minimalist**: Clean, uncluttered interface
- **Intuitive**: Easy to use without instructions
- **Accessible**: Works great on all devices and screen sizes
- **Fast**: Optimized performance with smooth animations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

Created with ❤️ using Flutter

---

*Discover your natural rhythms and optimize your daily life with biorhythm insights!*

## Installation

### Web Version
The app is built for web and can be found in the `build/web` directory after running:
```bash
flutter build web
```

### Mobile Installation (iOS)

#### Quick Start
1. **Connect your iPhone** via USB or ensure it's on the same WiFi network
2. **Run the setup script:**
   ```bash
   ./setup_ios.sh
   ```
3. **Install on device:**
   ```bash
   flutter run --release -d "Kornel's iPhone"
   # or
   flutter run --release -d "Renata iPhone-ja"
   ```

#### Detailed Instructions
For complete step-by-step instructions, see [iOS_INSTALLATION_GUIDE.md](iOS_INSTALLATION_GUIDE.md)

**Prerequisites:**
- Xcode installed (available from Mac App Store)
- Apple ID for device signing
- iPhone connected and trusted

**Available Devices:**
- Kornel's iPhone (iOS 18.5)
- Renata iPhone-ja (iOS 18.5)
- macOS desktop version
- Web version (Chrome)

### Android Installation
```bash
flutter build apk --release
# Install the APK on your Android device
```

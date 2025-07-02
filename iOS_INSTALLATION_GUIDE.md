# iOS Installation Guide for Biorhythm Calculator

This guide will help you install the Biorhythm Calculator app on your iPhone for testing and personal use.

## Prerequisites

### 1. Install Xcode
- Download and install Xcode from the Mac App Store
- Xcode is required for iOS development and deployment
- Make sure you have the latest version (at least Xcode 14+)

### 2. Apple Developer Account
- You need an Apple ID to sign apps for your device
- For personal testing, a free Apple ID is sufficient
- For App Store distribution, you'll need a paid Apple Developer account ($99/year)

### 3. Flutter iOS Dependencies
Ensure Flutter is properly set up for iOS development:

```bash
# Check Flutter setup
flutter doctor

# Install iOS deployment tools if needed
flutter precache --ios
```

## Step-by-Step Installation

### Step 1: Prepare Your Device

1. **Enable Developer Mode on iPhone:**
   - Connect your iPhone to your Mac via USB
   - Open Xcode
   - Go to Window > Devices and Simulators
   - Select your device and click "Use for Development"
   - Follow the prompts to enable Developer Mode

2. **Trust Your Computer:**
   - On your iPhone, go to Settings > General > VPN & Device Management
   - Find your computer and tap "Trust"

### Step 2: Configure the Project

1. **Open the iOS project in Xcode:**
   ```bash
   cd /Users/kornelkaulics/work/biorhytm
   open ios/Runner.xcworkspace
   ```

2. **Configure Bundle Identifier:**
   - In Xcode, select the "Runner" project in the navigator
   - Select the "Runner" target
   - Go to "Signing & Capabilities" tab
   - Change the Bundle Identifier to something unique, like:
     `com.yourname.biorhythm` (replace 'yourname' with your name)

3. **Configure Signing:**
   - In the same "Signing & Capabilities" tab
   - Check "Automatically manage signing"
   - Select your Apple ID team from the dropdown
   - If you don't see your team, click "Add Account" and sign in with your Apple ID

### Step 3: Build and Install

#### Option A: Using Xcode (Recommended for beginners)

1. **Select your device:**
   - In Xcode, click on the device selector next to the play button
   - Choose your connected iPhone from the list

2. **Build and run:**
   - Click the play button (▶️) in Xcode
   - The app will build and install automatically on your device

#### Option B: Using Flutter CLI

1. **List available devices:**
   ```bash
   flutter devices
   ```

2. **Build and install:**
   ```bash
   # Build and install on connected iPhone
   flutter run --release
   
   # Or build for a specific device
   flutter run --release -d "Your iPhone Name"
   ```

### Step 4: Trust the Developer Certificate

After installation, you'll need to trust the developer certificate on your iPhone:

1. Go to Settings > General > VPN & Device Management
2. Find your developer certificate under "Developer App"
3. Tap on it and select "Trust"
4. Confirm by tapping "Trust" again

### Step 5: Launch the App

The Biorhythm Calculator app should now appear on your iPhone's home screen and can be launched normally.

## Troubleshooting

### Common Issues and Solutions

1. **"Developer Mode Required" Error:**
   - Enable Developer Mode in iPhone Settings > Privacy & Security > Developer Mode
   - Restart your iPhone after enabling

2. **Signing Errors:**
   - Make sure your Bundle Identifier is unique
   - Check that your Apple ID is properly configured in Xcode
   - Try cleaning the build folder: Product > Clean Build Folder in Xcode

3. **Device Not Recognized:**
   - Ensure your iPhone is unlocked and connected via USB
   - Try a different USB cable
   - Restart both your Mac and iPhone

4. **Flutter Build Errors:**
   ```bash
   # Clean Flutter build
   flutter clean
   flutter pub get
   
   # Clear iOS build cache
   cd ios
   rm -rf build/
   cd ..
   ```

5. **"App Installation Failed" Error:**
   - Check available storage on your iPhone
   - Try uninstalling any previous version of the app
   - Restart your iPhone and try again

### Advanced Build Options

For production-ready builds:

```bash
# Build release version
flutter build ios --release

# Build with specific configuration
flutter build ios --release --dart-define=ENVIRONMENT=production
```

## Testing the App

Once installed, test all features:

1. **Date Selection:** Test birthdate and analysis date pickers
2. **Language Toggle:** Switch between English and Hungarian
3. **Chart Interaction:** Touch the chart to see tooltips
4. **Biorhythm Calculations:** Verify calculations are correct
5. **Responsive Design:** Test in both portrait and landscape modes

## App Store Preparation (Optional)

If you want to distribute via the App Store:

1. **Paid Apple Developer Account Required**
2. **App Store Connect Setup**
3. **App Review Process**
4. **Additional Requirements:**
   - Privacy Policy
   - Screenshots for different device sizes
   - App description and metadata
   - Age rating and category selection

## Maintenance

To update the app:

1. Make changes to your Flutter code
2. Increment the version number in `pubspec.yaml`
3. Rebuild and reinstall using the same process

## Support

If you encounter issues:

1. Check Flutter documentation: https://docs.flutter.dev/deployment/ios
2. Check Xcode documentation for iOS development
3. Verify your development environment with `flutter doctor`

---

**Note:** This app is configured for personal use. For commercial distribution, additional steps and Apple Developer Program membership are required.

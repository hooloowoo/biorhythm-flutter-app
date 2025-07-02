# 📱 Publishing Guide for Biorhythm Calculator

## ✅ Build Status
- ✅ Android APK built successfully: `build/app/outputs/flutter-apk/app-release.apk` (21.6MB)
- ⏳ iOS build (requires Xcode and Apple Developer Account)

## 🤖 Google Play Store Publishing

### Prerequisites
1. **Google Play Console Account** ($25 one-time fee)
   - Sign up at: https://play.google.com/console/

2. **App Signing Key** (for production)
   ```bash
   # Generate a signing key
   keytool -genkey -v -keystore ~/biorhythm-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias biorhythm
   ```

3. **Create key.properties file**
   ```
   # android/key.properties
   storePassword=<your-keystore-password>
   keyPassword=<your-key-password>
   keyAlias=biorhythm
   storeFile=<path-to-keystore-file>
   ```

### Build for Production
```bash
# Build App Bundle (recommended)
flutter build appbundle --release

# Or build APK
flutter build apk --release
```

### Play Store Steps
1. **Create app in Play Console**
   - App name: "Biorhythm Calculator"
   - Package name: `com.biorhythm.calculator`

2. **Upload APK/Bundle**
   - Upload the built file to Internal Testing first
   - Test thoroughly, then promote to Production

3. **Store Listing**
   - Use content from `play_store_metadata.md`
   - Add screenshots (required)
   - Upload app icon (512x512px)

4. **Content Rating**
   - Complete questionnaire (should be "Everyone")

5. **Pricing & Distribution**
   - Set as Free
   - Select target countries

## 🍎 Apple App Store Publishing

### Prerequisites
1. **Apple Developer Account** ($99/year)
   - Enroll at: https://developer.apple.com/programs/

2. **Xcode** (latest version)
   - Download from Mac App Store

3. **Bundle Identifier**
   - Use: `com.biorhythm.calculator`

### iOS Build Process
```bash
# Build for iOS (requires Mac)
flutter build ios --release

# Open in Xcode
open ios/Runner.xcworkspace
```

### Xcode Steps
1. **Configure Signing**
   - Select your Apple Developer Team
   - Set Bundle Identifier: `com.biorhythm.calculator`

2. **Build for Archive**
   - Product → Archive
   - Upload to App Store Connect

### App Store Connect
1. **Create app listing**
   - Use content from `app_store_metadata.md`
   - Add screenshots for all device sizes
   - Upload app icon (1024x1024px)

2. **App Review Information**
   - Add contact details
   - Demo account (not needed for this app)

3. **Submit for Review**
   - Usually takes 24-48 hours

## 📱 Required Assets

### App Icons (Create these!)
- **iOS**: 1024x1024px (App Store)
- **Android**: 512x512px (Play Store)
- Use biorhythm wave design with app name

### Screenshots (Required!)
Take screenshots on various device sizes:
- **iOS**: iPhone 6.7", 6.5", 5.5" and iPad 12.9"
- **Android**: Phone and Tablet

### Screenshots to Take:
1. Main app with birth date selected
2. Biorhythm chart showing curves
3. Analysis description with detailed text
4. Language toggle (English/Hungarian)
5. Date selector interface

## 🎨 Marketing Assets

### Feature Graphics (Play Store)
- 1024x500px banner image
- Show app interface with biorhythm charts

### App Previews (Optional)
- Short videos showing app functionality
- 15-30 seconds demonstrating key features

## 🔧 Configuration Checklist

### ✅ Completed
- [x] App name and description
- [x] Package/Bundle identifier updated
- [x] Version number set (1.0.0+1)
- [x] Android APK built successfully
- [x] Localization support (English, Hungarian)
- [x] Metadata files created

### ⏳ Remaining Tasks
- [ ] Create app icons (1024x1024 and 512x512)
- [ ] Take app screenshots
- [ ] Create signing key for Android
- [ ] Set up iOS certificates and provisioning
- [ ] Build iOS app in Xcode
- [ ] Create store accounts (Google Play, App Store)
- [ ] Upload apps to stores

## 💰 Publishing Costs
- **Google Play**: $25 one-time registration fee
- **Apple App Store**: $99/year developer program
- **Total first year**: $124

## ⏱️ Timeline
- **Google Play**: 1-3 days review time
- **Apple App Store**: 24-48 hours review time
- **Setup time**: 2-4 hours for first-time publishers

## 📞 Next Steps
1. Create app icons using design tool
2. Take screenshots on different devices
3. Register developer accounts
4. Set up signing keys/certificates
5. Upload and submit apps

## 🆘 Support Resources
- [Google Play Console Help](https://support.google.com/googleplay/android-developer/)
- [App Store Connect Help](https://developer.apple.com/help/app-store-connect/)
- [Flutter Publishing Guide](https://docs.flutter.dev/deployment)

**Good luck with your app launch! 🚀**

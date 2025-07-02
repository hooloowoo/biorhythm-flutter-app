#!/bin/bash

# iOS Setup Script for Biorhythm Calculator
# This script helps prepare your environment for iOS development

set -e

echo "🍎 Biorhythm Calculator - iOS Setup"
echo "=================================="

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: Please run this script from the biorhytm project root"
    exit 1
fi

echo "📱 Checking Flutter iOS setup..."

# Check Flutter doctor
echo "Running flutter doctor..."
flutter doctor

echo ""
echo "📋 Flutter devices:"
flutter devices

echo ""
echo "🔧 Setting up iOS dependencies..."
flutter precache --ios
flutter pub get

echo ""
echo "🧹 Cleaning previous builds..."
flutter clean
cd ios
if [ -d "build" ]; then
    rm -rf build/
    echo "Cleaned iOS build directory"
fi
cd ..

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Connect your iPhone via USB"
echo "2. Open Xcode: open ios/Runner.xcworkspace"
echo "3. Configure signing with your Apple ID"
echo "4. Select your device and press the play button"
echo ""
echo "Or use Flutter CLI:"
echo "flutter run --release"
echo ""
echo "📖 For detailed instructions, see iOS_INSTALLATION_GUIDE.md"

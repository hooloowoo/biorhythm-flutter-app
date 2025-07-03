#!/bin/bash

# ========================================
# 📸 Android Screenshot Helper Script
# ========================================

echo "📱 Biorhythm Calculator - Android Screenshot Helper"
echo "=================================================="

# Check if emulator is running
if ! adb devices | grep -q "emulator-5554"; then
    echo "❌ Android emulator not found!"
    echo "💡 Start the emulator first:"
    echo "   flutter emulators --launch Pixel_2_API_34"
    exit 1
fi

echo "✅ Android emulator detected"

# Check if app is installed
if ! adb shell pm list packages | grep -q "eu.highball.biorhythm"; then
    echo "❌ Biorhythm Calculator app not installed!"
    echo "💡 Install the app first:"
    echo "   flutter install -d emulator-5554"
    exit 1
fi

echo "✅ Biorhythm Calculator app found"

# Create screenshots directory
mkdir -p screenshots/android/phone
echo "📁 Created screenshots directory"

# Function to take screenshot
take_screenshot() {
    local name=$1
    local description=$2
    
    echo ""
    echo "📸 Ready to take screenshot: $name"
    echo "   Description: $description"
    echo "   Press ENTER when the screen is ready..."
    read
    
    # Take screenshot
    adb shell screencap -p /sdcard/screenshot_temp.png
    adb pull /sdcard/screenshot_temp.png "screenshots/android/phone/${name}.png"
    adb shell rm /sdcard/screenshot_temp.png
    
    if [ -f "screenshots/android/phone/${name}.png" ]; then
        echo "✅ Screenshot saved: screenshots/android/phone/${name}.png"
    else
        echo "❌ Failed to save screenshot"
    fi
}

# Launch the app
echo ""
echo "🚀 Launching Biorhythm Calculator..."
adb shell am start -n eu.highball.biorhythm/eu.highball.biorhythm.MainActivity

sleep 3

echo ""
echo "📸 Screenshot Session Starting"
echo "=============================="
echo ""
echo "📋 Follow these steps for each screenshot:"
echo "1. Set up the screen as described"
echo "2. Press ENTER when ready"
echo "3. Screenshot will be taken automatically"
echo ""

# Screenshot 1: Home screen (no birth date)
take_screenshot "01_home_screen" "App home screen with no birth date set"

echo ""
echo "🎯 Next: Tap 'Select Birth Date' button"

# Screenshot 2: Date picker
take_screenshot "02_birth_date_picker" "Date picker dialog open"

echo ""
echo "🎯 Next: Select a birth date (e.g., Jan 15, 1990) and close picker"

# Screenshot 3: Chart with data
take_screenshot "03_biorhythm_chart" "Biorhythm chart with three colored curves"

echo ""
echo "🎯 Next: Scroll down to see the analysis section"

# Screenshot 4: Analysis section
take_screenshot "04_detailed_analysis" "Detailed biorhythm analysis with percentages"

echo ""
echo "🎯 Next: Tap the language toggle button (🌍) to switch to Hungarian"

# Screenshot 5: Hungarian language
take_screenshot "05_hungarian_language" "App interface in Hungarian language"

echo ""
echo "🎯 Next: Tap on the chart to show tooltip (optional)"

# Screenshot 6: Chart interaction
echo "📸 Optional screenshot - Chart interaction"
echo "   Take this if you can show the tooltip on chart tap"
echo "   Press ENTER to take it, or Ctrl+C to skip"
read
take_screenshot "06_chart_interaction" "Chart with tooltip showing percentage values"

echo ""
echo "🎉 Screenshot session completed!"
echo "================================"
echo ""
echo "📂 Screenshots saved to: screenshots/android/phone/"
echo "📱 Files created:"
ls -la screenshots/android/phone/

echo ""
echo "📋 Next steps:"
echo "1. Review all screenshots for quality"
echo "2. Resize if needed for Google Play Store"
echo "3. Upload to Google Play Console"
echo "4. Add captions for each screenshot"
echo ""
echo "💡 Tips:"
echo "• Keep screenshots under 8MB each"
echo "• Use 16:9 aspect ratio when possible"
echo "• Ensure text is readable and clear"
echo ""
echo "✅ Ready for Google Play Store submission!"

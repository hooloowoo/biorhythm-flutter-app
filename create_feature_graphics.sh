#!/bin/bash

# Feature Graphics Generator for Google Play Store
# Creates 1024x500 banner graphics for the Biorhythm Calculator app

echo "🎨 Feature Graphics Generator for Google Play Store"
echo "=================================================="

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick not found. Installing via Homebrew..."
    brew install imagemagick
fi

# Create feature graphics directory
GRAPHICS_DIR="screenshots/android/feature_graphics"
mkdir -p "$GRAPHICS_DIR"

# Feature Graphics dimensions (Google Play requirement)
WIDTH=1024
HEIGHT=500

echo "📐 Creating Feature Graphics (${WIDTH}x${HEIGHT})"

# Create main feature graphic with gradient background
convert -size ${WIDTH}x${HEIGHT} \
  gradient:'#2E7D32-#66BB6A' \
  -gravity center \
  \( -size 400x400 xc:white -fill white -draw "roundrectangle 20,20 380,380 40,40" \) \
  -composite \
  \( assets/icon/app_icon_512.png -resize 300x300 \) \
  -geometry +50+100 -composite \
  \( -pointsize 64 -font Arial-Bold -fill white -annotate +420+150 "Biorhythm" \) \
  \( -pointsize 64 -font Arial-Bold -fill white -annotate +420+220 "Calculator" \) \
  \( -pointsize 28 -font Arial -fill '#E8F5E8' -annotate +420+280 "Track Your Physical, Emotional" \) \
  \( -pointsize 28 -font Arial -fill '#E8F5E8' -annotate +420+310 "and Intellectual Cycles" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+360 "✨ Beautiful Charts & Analysis" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+390 "🌍 English & Hungarian" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+420 "📱 Free & No Ads" \) \
  "$GRAPHICS_DIR/feature_graphic_main.png"

echo "✅ Created: feature_graphic_main.png"

# Create alternative feature graphic with chart visualization
convert -size ${WIDTH}x${HEIGHT} \
  gradient:'#1565C0-#42A5F5' \
  -gravity center \
  \( -size 360x280 xc:'rgba(255,255,255,0.9)' -fill white -draw "roundrectangle 10,10 350,270 20,20" \) \
  -geometry +50+110 -composite \
  \( assets/icon/app_icon_512.png -resize 200x200 \) \
  -geometry +80+150 -composite \
  \( -pointsize 56 -font Arial-Bold -fill white -annotate +450+150 "Master Your" \) \
  \( -pointsize 56 -font Arial-Bold -fill white -annotate +450+210 "Natural Rhythms" \) \
  \( -pointsize 26 -font Arial -fill '#E3F2FD' -annotate +450+270 "Optimize your daily life with" \) \
  \( -pointsize 26 -font Arial -fill '#E3F2FD' -annotate +450+300 "personalized biorhythm insights" \) \
  \( -pointsize 22 -font Arial-Bold -fill '#FFD54F' -annotate +450+350 "🔬 Science-Based Calculations" \) \
  \( -pointsize 22 -font Arial-Bold -fill '#FFD54F' -annotate +450+380 "📊 Interactive Charts" \) \
  \( -pointsize 22 -font Arial-Bold -fill '#FFD54F' -annotate +450+410 "📈 Peak Performance Timing" \) \
  "$GRAPHICS_DIR/feature_graphic_alt.png"

echo "✅ Created: feature_graphic_alt.png"

# Create minimalist feature graphic
convert -size ${WIDTH}x${HEIGHT} \
  gradient:'#37474F-#78909C' \
  -gravity center \
  \( assets/icon/app_icon_512.png -resize 240x240 \) \
  -geometry +100+130 -composite \
  \( -pointsize 72 -font Arial-Bold -fill white -annotate +400+180 "Biorhythm" \) \
  \( -pointsize 48 -font Arial -fill '#B0BEC5' -annotate +400+240 "Calculator" \) \
  \( -pointsize 32 -font Arial -fill '#CFD8DC' -annotate +400+300 "Discover your optimal days for" \) \
  \( -pointsize 32 -font Arial -fill '#CFD8DC' -annotate +400+340 "peak performance & creativity" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#4CAF50' -annotate +400+390 "Free Download • No Registration" \) \
  "$GRAPHICS_DIR/feature_graphic_minimal.png"

echo "✅ Created: feature_graphic_minimal.png"

# Create Hungarian version
convert -size ${WIDTH}x${HEIGHT} \
  gradient:'#4A148C-#8E24AA' \
  -gravity center \
  \( -size 360x280 xc:'rgba(255,255,255,0.1)' -fill white -draw "roundrectangle 10,10 350,270 20,20" \) \
  -geometry +50+110 -composite \
  \( assets/icon/app_icon_512.png -resize 220x220 \) \
  -geometry +70+140 -composite \
  \( -pointsize 58 -font Arial-Bold -fill white -annotate +420+160 "Bioritmus" \) \
  \( -pointsize 58 -font Arial-Bold -fill white -annotate +420+220 "Kalkulátor" \) \
  \( -pointsize 28 -font Arial -fill '#F3E5F5' -annotate +420+280 "Kövesd nyomon fizikai, érzelmi" \) \
  \( -pointsize 28 -font Arial -fill '#F3E5F5' -annotate +420+310 "és szellemi ciklusaidat" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+360 "✨ Gyönyörű grafikonok" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+390 "🎯 Személyre szabott elemzés" \) \
  \( -pointsize 24 -font Arial-Bold -fill '#FFD54F' -annotate +420+420 "🆓 Ingyenes és reklám nélkül" \) \
  "$GRAPHICS_DIR/feature_graphic_hungarian.png"

echo "✅ Created: feature_graphic_hungarian.png"

# Verify file sizes and dimensions
echo ""
echo "📋 Feature Graphics Summary:"
echo "=============================="
for file in "$GRAPHICS_DIR"/*.png; do
    if [ -f "$file" ]; then
        size=$(identify -format "%wx%h" "$file")
        filesize=$(du -h "$file" | cut -f1)
        filename=$(basename "$file")
        echo "📄 $filename: $size ($filesize)"
    fi
done

echo ""
echo "📁 Location: $GRAPHICS_DIR/"
echo ""
echo "📝 Google Play Store Requirements:"
echo "• Dimensions: 1024 x 500 pixels"
echo "• File size: Under 1MB"
echo "• Format: PNG or JPEG"
echo ""
echo "✅ All feature graphics are ready for upload!"
echo ""
echo "💡 Choose the version that best represents your app:"
echo "   • feature_graphic_main.png - Professional with features"
echo "   • feature_graphic_alt.png - Focus on optimization"
echo "   • feature_graphic_minimal.png - Clean and simple"
echo "   • feature_graphic_hungarian.png - Hungarian market"

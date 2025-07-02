#!/bin/bash

# ========================================
# 🎨 Biorhythm App Icon Generator
# ========================================
# This script helps you create the required PNG icon from the SVG template

echo "🎨 Biorhythm App Icon Generator"
echo "==============================="

# Check if we're in the right directory
if [ ! -f "assets/icon/biorhythm_icon.svg" ]; then
    echo "❌ Error: SVG file not found. Please run this from the project root."
    exit 1
fi

echo "📁 Found SVG template: assets/icon/biorhythm_icon.svg"

# Method 1: Using ImageMagick (if available)
if command -v convert &> /dev/null; then
    echo "🔧 Converting SVG to PNG using ImageMagick..."
    convert -background none -size 1024x1024 assets/icon/biorhythm_icon.svg assets/icon/app_icon.png
    
    if [ -f "assets/icon/app_icon.png" ]; then
        echo "✅ PNG icon created successfully!"
        echo "📏 Verifying dimensions..."
        
        # Check if identify command is available
        if command -v identify &> /dev/null; then
            SIZE=$(identify -format "%wx%h" assets/icon/app_icon.png)
            echo "   Icon size: $SIZE"
            
            if [ "$SIZE" = "1024x1024" ]; then
                echo "✅ Perfect! Icon is exactly 1024x1024px"
            else
                echo "⚠️  Warning: Icon size is $SIZE, should be 1024x1024"
            fi
        fi
        
        echo ""
        echo "🎯 Next steps:"
        echo "1. Uncomment the image_path in pubspec.yaml"
        echo "2. Run: flutter pub run flutter_launcher_icons:main"
        echo "3. Test the iOS build"
        
    else
        echo "❌ Failed to create PNG file"
        exit 1
    fi
    
# Method 2: Using Safari/Preview (macOS)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 macOS detected - using built-in tools..."
    echo ""
    echo "📋 Manual steps for macOS:"
    echo "1. Open assets/icon/biorhythm_icon.svg in Safari"
    echo "2. Right-click and 'Save As' → choose PNG format"
    echo "3. Save as 'app_icon.png' in assets/icon/ folder"
    echo "4. In Preview, open the PNG and resize to exactly 1024x1024px"
    echo ""
    echo "🔧 Opening SVG in Safari now..."
    open -a Safari "file://$(pwd)/assets/icon/biorhythm_icon.svg"
    
# Method 3: Online converter
else
    echo "🌐 Suggested online conversion method:"
    echo ""
    echo "📋 Steps:"
    echo "1. Go to: https://svgtopng.com/ or https://convertio.co/svg-png/"
    echo "2. Upload: assets/icon/biorhythm_icon.svg"
    echo "3. Set size to: 1024x1024 pixels"
    echo "4. Download as: app_icon.png"
    echo "5. Place in: assets/icon/app_icon.png"
    echo ""
    echo "📂 Opening icon folder..."
    if command -v open &> /dev/null; then
        open assets/icon/
    elif command -v xdg-open &> /dev/null; then
        xdg-open assets/icon/
    fi
fi

echo ""
echo "📱 Alternative: Professional Icon Services"
echo "   • Fiverr: $5-20 for custom app icons"
echo "   • 99designs: Professional designers"
echo "   • Canva: DIY with templates"
echo ""
echo "💡 Remember: Your icon should be unique and represent your biorhythm app!"

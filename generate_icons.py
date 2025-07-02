#!/usr/bin/env python3
"""
Biorhythm App Icon Generator
Creates app icons with biorhythm wave patterns for all required sizes
"""

import math
import os
from PIL import Image, ImageDraw

def create_biorhythm_icon(size):
    """Create a biorhythm icon with three sine waves"""
    # Create a new image with a gradient background
    img = Image.new('RGBA', (size, size), (255, 255, 255, 0))
    draw = ImageDraw.Draw(img)
    
    # Background gradient (blue to light blue)
    for y in range(size):
        alpha = int(255 * (1 - y / size * 0.3))
        color = (70, 130, 180, alpha)  # Steel blue
        draw.line([(0, y), (size, y)], fill=color)
    
    # Add a circular background
    margin = size // 8
    circle_size = size - 2 * margin
    draw.ellipse([margin, margin, margin + circle_size, margin + circle_size], 
                 fill=(255, 255, 255, 240), outline=(70, 130, 180, 255), width=max(1, size // 100))
    
    # Draw biorhythm waves
    center_x = size // 2
    center_y = size // 2
    wave_width = circle_size * 0.7
    wave_height = circle_size * 0.15
    
    # Calculate points for three waves
    points_physical = []
    points_emotional = []
    points_intellectual = []
    
    num_points = max(50, size // 4)
    for i in range(num_points):
        x = i * wave_width / (num_points - 1)
        angle = (i / (num_points - 1)) * 4 * math.pi  # Two full cycles
        
        # Physical cycle (23 days) - Red
        y_physical = center_y - wave_height + wave_height * math.sin(angle)
        points_physical.append((center_x - wave_width/2 + x, y_physical))
        
        # Emotional cycle (28 days) - Blue  
        y_emotional = center_y + wave_height * math.sin(angle * 23/28)
        points_emotional.append((center_x - wave_width/2 + x, y_emotional))
        
        # Intellectual cycle (33 days) - Green
        y_intellectual = center_y + wave_height + wave_height * math.sin(angle * 23/33)
        points_intellectual.append((center_x - wave_width/2 + x, y_intellectual))
    
    # Draw the waves with thickness
    line_width = max(2, size // 50)
    
    # Physical wave (red)
    for i in range(len(points_physical) - 1):
        draw.line([points_physical[i], points_physical[i + 1]], 
                  fill=(220, 20, 60, 255), width=line_width)
    
    # Emotional wave (blue)
    for i in range(len(points_emotional) - 1):
        draw.line([points_emotional[i], points_emotional[i + 1]], 
                  fill=(30, 144, 255, 255), width=line_width)
    
    # Intellectual wave (green)
    for i in range(len(points_intellectual) - 1):
        draw.line([points_intellectual[i], points_intellectual[i + 1]], 
                  fill=(50, 205, 50, 255), width=line_width)
    
    # Add small dots at wave intersections for visual interest
    dot_size = max(1, size // 80)
    for i in range(0, len(points_physical), len(points_physical) // 8):
        if i < len(points_physical):
            x, y = points_physical[i]
            draw.ellipse([x - dot_size, y - dot_size, x + dot_size, y + dot_size], 
                        fill=(220, 20, 60, 255))
    
    return img

def generate_all_icons():
    """Generate all required icon sizes for iOS and Android"""
    
    # iOS sizes
    ios_sizes = [
        (20, "Icon-App-20x20@1x.png"),
        (40, "Icon-App-20x20@2x.png"),
        (60, "Icon-App-20x20@3x.png"),
        (29, "Icon-App-29x29@1x.png"),
        (58, "Icon-App-29x29@2x.png"),
        (87, "Icon-App-29x29@3x.png"),
        (40, "Icon-App-40x40@1x.png"),
        (80, "Icon-App-40x40@2x.png"),
        (120, "Icon-App-40x40@3x.png"),
        (120, "Icon-App-60x60@2x.png"),
        (180, "Icon-App-60x60@3x.png"),
        (76, "Icon-App-76x76@1x.png"),
        (152, "Icon-App-76x76@2x.png"),
        (167, "Icon-App-83.5x83.5@2x.png"),
        (1024, "Icon-App-1024x1024@1x.png"),
    ]
    
    # Android sizes
    android_sizes = [
        (48, "ic_launcher.png"),   # mdpi
        (72, "ic_launcher.png"),   # hdpi
        (96, "ic_launcher.png"),   # xhdpi
        (144, "ic_launcher.png"),  # xxhdpi
        (192, "ic_launcher.png"),  # xxxhdpi
    ]
    
    android_dirs = [
        "android/app/src/main/res/mipmap-mdpi",
        "android/app/src/main/res/mipmap-hdpi", 
        "android/app/src/main/res/mipmap-xhdpi",
        "android/app/src/main/res/mipmap-xxhdpi",
        "android/app/src/main/res/mipmap-xxxhdpi",
    ]
    
    # Create iOS icons
    ios_dir = "ios/Runner/Assets.xcassets/AppIcon.appiconset"
    print(f"Generating iOS icons in {ios_dir}/")
    
    for size, filename in ios_sizes:
        icon = create_biorhythm_icon(size)
        filepath = os.path.join(ios_dir, filename)
        icon.save(filepath, "PNG")
        print(f"Created {filename} ({size}x{size})")
    
    # Create Android icons
    print(f"\nGenerating Android icons...")
    
    for i, (size, filename) in enumerate(android_sizes):
        icon = create_biorhythm_icon(size)
        filepath = os.path.join(android_dirs[i], filename)
        icon.save(filepath, "PNG")
        print(f"Created {android_dirs[i]}/{filename} ({size}x{size})")
    
    print(f"\n✅ All app icons generated successfully!")
    print(f"🎨 Icons feature biorhythm wave patterns in red, blue, and green")

if __name__ == "__main__":
    generate_all_icons()

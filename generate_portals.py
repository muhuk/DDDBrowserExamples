#!/usr/bin/env python3
import math

files = [
    'retry', 'slow', 'luau-pingpong', 'luau-gamemode', 'metadata-html', 'metadata-json',
    'metadata-both', 'metadata-full', 'point-light', 'directional-light', 'spot-light',
    'all-lights', 'lights-shadows', 'portal-source', 'portal-destination', 'portal-invalid-world',
    'portal-invalid-url', 'portal-auto-trigger', 'scene_valid', 'scene_with_metadata',
    'scene_with_gamemode', 'scene_metadata_minimal', 'scene_complex', 'scene_multiple_lights',
    'scene_single_entity', 'scene_with_scripts'
]

radius = 18
n = len(files)

for i, f in enumerate(files):
    angle_deg = i * 360.0 / n
    angle_rad = math.radians(angle_deg)
    x = radius * math.cos(angle_rad)
    z = radius * math.sin(angle_rad)
    rot_y = 180.0 - angle_deg
    print('        {')
    print(f'          "id": "portal-{f}",')
    print('          "type": "portal",')
    print(f'          "position": {{"x": {x:.2f}, "y": 0.0, "z": {z:.2f}}},')
    print(f'          "rotation": {{"x": 0.0, "y": {rot_y:.2f}, "z": 0.0}},')
    print('          "scale": {"x": 2.0, "y": 2.0, "z": 1.0},')
    print('          "portal": {')
    print(f'            "destinationUrl": "./{f}.html",')
    print('            "radius": 3.0,')
    print('            "autoTrigger": false,')
    print('            "manualTrigger": true,')
    print('            "scriptTrigger": false')
    print('          }')
    print('        },')


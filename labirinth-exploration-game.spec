# -*- mode: python ; coding: utf-8 -*-
from glob import glob

panda3d_dlls = [(dll, 'panda3d') for dll in glob('.venv/Lib/site-packages/panda3d/*.dll')]

a = Analysis(
    ['main.py'],
    pathex=[],
    binaries=panda3d_dlls,
    datas=[
        ('assets', 'assets'),
        ('.venv/Lib/site-packages/panda3d/etc', 'panda3d/etc'),
        ('.venv/Lib/site-packages/ursina/fonts', 'ursina/fonts'),
        ('.venv/Lib/site-packages/ursina/models', 'ursina/models'),
        ('.venv/Lib/site-packages/ursina/models_compressed', 'ursina/models_compressed'),
        ('.venv/Lib/site-packages/ursina/textures', 'ursina/textures'),
        ('.venv/Lib/site-packages/ursina/shaders', 'ursina/shaders'),
        ('.venv/Lib/site-packages/ursina/audio', 'ursina/audio'),
    ],
    hiddenimports=[
        'numpy',
        'ursina.models.procedural.cube',
        'ursina.models.procedural.plane',
        'ursina.models.procedural.quad',
        'ursina.models.procedural.sphere',
        'ursina.models.procedural.circle',
        'ursina.models.procedural.capsule',
        'ursina.models.procedural.cone',
        'ursina.models.procedural.cylinder',
        'ursina.models.procedural.grid',
        'ursina.models.procedural.pipe',
        'ursina.models.procedural.terrain',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=['rthook_ursina.py'],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='labirinth-exploration-game',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='labirinth-exploration-game',
)

import sys
import os
from pathlib import Path

if getattr(sys, 'frozen', False):
    meipass = Path(sys._MEIPASS)

    # Patch ursina application paths to point into _MEIPASS
    try:
        from ursina import application
        application.package_folder                   = meipass / 'ursina'
        application.internal_models_folder           = meipass / 'ursina' / 'models'
        application.internal_models_compressed_folder = meipass / 'ursina' / 'models_compressed'
        application.internal_scripts_folder          = meipass / 'ursina' / 'scripts'
        application.internal_textures_folder         = meipass / 'ursina' / 'textures'
        application.internal_shaders_folder          = meipass / 'ursina' / 'shaders'
        application.internal_fonts_folder            = meipass / 'ursina' / 'fonts'
        application.internal_audio_folder            = meipass / 'ursina' / 'audio'
        application.compressed_models_folder         = meipass / 'ursina' / 'models_compressed'
    except Exception as e:
        print(f'[rthook_ursina] warning: {e}')

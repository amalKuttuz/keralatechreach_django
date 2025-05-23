#!/usr/bin/env python
"""
Script to manage the file upload directories and create symbolic links
between the PHP and Django applications during the transition period.
"""
import os
import sys
import shutil
import argparse
from pathlib import Path


def setup_directories():
    """
    Create necessary directories for file uploads.
    """
    # Get the base directory
    base_dir = Path(__file__).resolve().parent
    
    # Define the directory structure
    media_dir = base_dir / 'media'
    php_upload_dir = base_dir / 'PHP' / 'upload'
    
    directories = {
        'media': [
            'questions',
            'notes_upload',
            'profiles',
            'gallery',
            'news',
            'initiatives',
            'tmp'
        ],
        'php_upload': [
            'notes'
        ]
    }
    
    # Create media directories
    for dir_name in directories['media']:
        dir_path = media_dir / dir_name
        if not dir_path.exists():
            print(f"Creating directory: {dir_path}")
            dir_path.mkdir(parents=True, exist_ok=True)
    
    # Create PHP upload directories if they don't exist
    for dir_name in directories['php_upload']:
        dir_path = php_upload_dir / dir_name
        if not dir_path.exists():
            print(f"Creating directory: {dir_path}")
            dir_path.mkdir(parents=True, exist_ok=True)
    
    print("Directory structure set up successfully.")


def create_symlinks(force=False):
    """
    Create symbolic links from PHP upload directories to Django media directories.
    This helps in the transition period where both applications need access to the same files.
    
    Args:
        force (bool): If True, remove existing symlinks and recreate them.
    """
    # Get the base directory
    base_dir = Path(__file__).resolve().parent
    
    # Define the symbolic link mappings (source -> target)
    symlinks = {
        base_dir / 'media' / 'questions': base_dir / 'PHP' / 'upload',
        base_dir / 'media' / 'notes_upload': base_dir / 'PHP' / 'upload' / 'notes'
    }
    
    for target, source in symlinks.items():
        if not source.exists():
            print(f"Source directory does not exist: {source}")
            continue
            
        if target.is_symlink() or target.exists():
            if not force:
                print(f"Target already exists: {target}. Use --force to overwrite.")
                continue
            else:
                if target.is_dir() and not target.is_symlink():
                    print(f"Removing existing directory: {target}")
                    shutil.rmtree(target)
                else:
                    print(f"Removing existing symlink: {target}")
                    target.unlink()
        
        # Create symbolic link
        print(f"Creating symlink: {source} -> {target}")
        os.symlink(source, target, target_is_directory=True)
    
    print("Symbolic links created successfully.")


def copy_files():
    """
    Copy files from PHP upload directories to Django media directories.
    This is used when symbolic links are not possible (e.g., different servers).
    """
    # Get the base directory
    base_dir = Path(__file__).resolve().parent
    
    # Define the copy mappings (source -> target)
    copy_mappings = {
        base_dir / 'PHP' / 'upload': base_dir / 'media' / 'questions',
        base_dir / 'PHP' / 'upload' / 'notes': base_dir / 'media' / 'notes_upload'
    }
    
    for source, target in copy_mappings.items():
        if not source.exists():
            print(f"Source directory does not exist: {source}")
            continue
            
        if not target.exists():
            target.mkdir(parents=True, exist_ok=True)
        
        # Copy files (only new or updated)
        print(f"Copying files from {source} to {target}")
        for item in source.glob('*.*'):
            if item.is_file():
                dest_file = target / item.name
                # Check if the destination file exists and has the same modification time
                if not dest_file.exists() or os.path.getmtime(item) > os.path.getmtime(dest_file):
                    print(f"  Copying {item.name}")
                    shutil.copy2(item, dest_file)
    
    print("Files copied successfully.")


def set_permissions():
    """
    Set appropriate permissions for the media directories.
    """
    # Get the base directory
    base_dir = Path(__file__).resolve().parent
    
    # Define the directories to set permissions on
    directories = [
        base_dir / 'media',
        base_dir / 'media' / 'questions',
        base_dir / 'media' / 'notes_upload',
        base_dir / 'media' / 'profiles',
        base_dir / 'media' / 'gallery',
        base_dir / 'media' / 'news',
        base_dir / 'media' / 'tmp',
    ]
    
    for directory in directories:
        if directory.exists():
            print(f"Setting permissions on {directory}")
            # Set directory permissions to 755 (rwxr-xr-x)
            os.chmod(directory, 0o755)
            
            # Set file permissions to 644 (rw-r--r--)
            for item in directory.glob('*.*'):
                if item.is_file():
                    os.chmod(item, 0o644)
    
    print("Permissions set successfully.")


def main():
    """
    Main function to parse arguments and run the appropriate command.
    """
    parser = argparse.ArgumentParser(description='Manage file uploads and directory structure.')
    parser.add_argument('command', choices=['setup', 'symlink', 'copy', 'permissions', 'all'],
                        help='Command to run')
    parser.add_argument('--force', action='store_true', help='Force overwrite of existing symlinks')
    
    args = parser.parse_args()
    
    if args.command == 'setup' or args.command == 'all':
        setup_directories()
    
    if args.command == 'symlink' or args.command == 'all':
        create_symlinks(args.force)
    
    if args.command == 'copy' or args.command == 'all':
        copy_files()
    
    if args.command == 'permissions' or args.command == 'all':
        set_permissions()


if __name__ == '__main__':
    main() 
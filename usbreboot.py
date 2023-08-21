#!/usr/bin/env python3
import os
import subprocess
import time

# Path to the configuration file
CONFIG_FILE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "usbreboot.conf")
print(CONFIG_FILE_PATH)
def read_usb_id_from_config():
    """Read the USB ID from the configuration file."""
    try:
        with open(CONFIG_FILE_PATH, 'r') as f:
            return f.readline().strip()
    except FileNotFoundError:
        print(f"Error: Configuration file not found at {CONFIG_FILE_PATH}.")
        exit(1)

USB_ID = read_usb_id_from_config() # Read the USB ID from the configuration file.
print(USB_ID)

def get_usb_devices():
    """Check if the USB with the given ID is connected."""
    s = subprocess.check_output('lsusb').decode('utf-8')
    return USB_ID in s

def main():
    while True:
        if get_usb_devices():
            print(f"USB drive {USB_ID} detected. Rebooting...")
            os.system("sudo reboot now")
        time.sleep(5)

if __name__ == "__main__":
    main()


#!/bin/bash

# Directory where the configuration file will be saved
CONFIG_DIR=$(pwd)
CONFIG_FILE="$CONFIG_DIR/usbreboot.conf"

underline() {
    tput smul; echo "$1"; tput rmul
}

message() {
    echo -e "\n\n\n\n\n-----------------"
    echo "$1"
    echo "-----------------"
}

prompt() {
    echo ""
    underline "$1"
    echo ""
}

# DISCLAIMER
clear
message "DISCLAIMER"
echo "The user of this software acknowledges that they are receiving this software on an 'as is' basis and the user is not relying on the accuracy or functionality of the software for any purpose. The user further acknowledges that any use of this software will be at the user's own risk and the copyright holder accepts no responsibility whatsoever arising from the use or application of the software."
echo ""
echo "This software is provided 'as is', without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software."
echo ""
echo "This software is freeware and can be freely shared and distributed as long as it remains unchanged and is not used for commercial purposes."
echo ""

prompt "Do you acknowledge the above disclaimer and wish to continue? (yes/no): "
read ack

if [[ "$ack" != "yes" ]]; then
    echo "Exiting the program."
    exit 1
fi

# Ask the user to connect the USB device they want to use
message "Welcome to the USB Reboot Configuration Tool!"
prompt "First, please connect the USB device you'd like to use for rebooting the machine."
read -p "Press [Enter] once you've connected the device..."

while true; do
    # Display connected USB devices
    message "Connected USB Devices:"
    sudo lsusb | nl

    # Ask the user if they see their device
    prompt "Do you see the recently connected device in the list? (yes/no): "
    read response

    if [[ "$response" == "yes" ]]; then
        echo ""
        underline "Enter the number of the USB device you just connected: "
        read choice

        # Extract the ID and description of the selected device
        usb_data=$(sudo lsusb | sed "${choice}q;d")
        usb_id=$(echo $usb_data | awk '{print $6}')
        usb_description=$(echo $usb_data | cut -d':' -f3- | sed 's/^ //')

        # Confirm with the user
        message "You selected: $usb_description"

        prompt "Please confirm the details below:"
        echo "Device: $usb_description"
        echo "Warning: If this device stays connected during boot, the machine will reboot continuously."
        echo "This will send the command 'sudo reboot now' when this specific device is detected."
        echo "Choosing a wrong ID could cause a continuous reboot loop!"

        prompt "Is this correct? (yes/no): "
        read confirm

        if [[ "$confirm" == "yes" ]]; then
            echo "$usb_id" > "$CONFIG_FILE"
            message "Device ID saved in $CONFIG_FILE."

            prompt "Next Steps:"
            echo "1. Unplug the selected USB first."
            echo "2. Add the following line to your crontab:"
            echo ""
            underline "@reboot /usr/bin/python3 $CONFIG_DIR/usbreboot.py &"
            echo ""
            echo "3. Execute: sudo crontab -e to edit the crontab."
            echo "4. Reboot to apply changes."
            echo "5. Once the machine starts, you can plug in the USB to trigger a reboot."
	    echo ""
            break
        else
            message "Not saved. Please select the device again."
        fi

    elif [[ "$response" == "no" ]]; then
        # Rescan connected devices
        prompt "Please ensure your device is properly connected. Then press [Enter] to rescan."
        read -p ""
    else
        message "Invalid response. Please answer with 'yes' or 'no'."
    fi
done

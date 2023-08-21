# USB Reboot for Raspberry PI 🔄

A simple and clever tool to reboot your halted system when the network goes down and there's no other means of recovery. Especially handy for Raspberry PI (or any other device) setups that have physical access but aren't connected to any screen or keyboard.

Do you often find your Raspberry PI (or any other device) in a state where the system is halted and the network is unreachable? This tool allows you to use a designated USB drive to initiate a system reboot, providing a quick and easy recovery method.

## 🚀 Features

- **Plug to Reboot**: Simply plug in your designated USB drive and the system will reboot.
- **Safe and Reliable**: Only the specified USB drive ID will trigger the reboot.
- **No Additional Hardware**: Utilizes the existing USB ports, no additional hardware required.

## 🛠 Setup and Usage

### 1. **Setting up the Tool**

- Clone this repository:
  ```bash
  git clone https://github.com/SurceBeats/USBReboot.git
  cd USBReboot
  ./configure.sh

Follow the prompts to select your designated USB drive.

### 2. **Usage**
Whenever you want to reboot the system:
Ensure that your designated USB drive isn't already plugged in.
If your Raspberry PI (or any other device) becomes unreachable through the network, simply plug in the designated USB drive into any available USB port.
The system will detect the drive and initiate a reboot.

### 📄 License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/SurceBeats/USBReboot/blob/main/LICENSE)https://github.com/SurceBeats/USBReboot/blob/main/LICENSE file for details.

### ⚠️ Disclaimer
This software is provided "as-is" without any warranty or assurances. While this tool is designed to be reliable and safe, the creator holds no responsibility for any damages or losses arising from its use. Please use this tool responsibly and ensure you've read and understood its operation before deployment. Always remember to keep backups and avoid using this tool in critical environments without thorough testing.



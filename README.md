# USB Reboot for Raspberry PI 🔄

A simple and clever tool to reboot your halted system when the network goes down and there's no other means of recovery. Especially handy for Raspberry PI setups that have physical access but aren't connected to any screen or keyboard.

Do you often find your Raspberry PI in a state where the system is halted and the network is unreachable? This tool allows you to use a designated USB drive to initiate a system reboot, providing a quick and easy recovery method.

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

Follow the prompts to select your designated USB drive.


# **Android Device Debloater Script**

## **Overview**
The **Android Device Debloater Script** is a batch script designed to help users easily remove unwanted bloatware apps from their Android devices. The script utilizes ADB (Android Debug Bridge) to uninstall apps listed in a `debloat.txt` file, logs the uninstallation process, and provides a simple user interface for confirmation before proceeding.

With this script, you can quickly clean up your Android device by removing pre-installed apps that you don't use, freeing up valuable storage and improving performance.

---

## **Features**

- **Device Detection**: Automatically detects your Android device and displays key information like the device model, brand, and software version.
- **User Confirmation**: Prompts you for confirmation before uninstalling any apps to avoid accidental uninstalls.
- **Batch Uninstallation**: Removes apps listed in the `debloat.txt` file using ADB commands.
- **Logging**: Logs all actions, including successes and failures, into a `debloater_log.txt` file for tracking and debugging.
- **Simple Interface**: Text-based, easy-to-use batch script that works on Windows.
- **Exit Prompt**: After the process, it prompts you to press Enter to exit, ensuring you’ve seen the results.

---

## **How It Works**

1. **Device Information Retrieval**:  
   The script detects if your Android device is connected via USB, retrieves key details (such as device model and Android version), and displays them.

2. **Uninstallation Process**:  
   The script asks for your confirmation (`y` or `n`) before it proceeds with the uninstallation of the apps listed in `debloat.txt`. If you confirm, it proceeds to uninstall each app, logging success or failure.

3. **Logging**:  
   Every action, including detected devices and the results of each uninstallation, is logged in a `debloater_log.txt` file located in the same directory as the script.

4. **Exit**:  
   After completing the uninstallation process, it asks you to press Enter to exit, ensuring you have seen the log and the results of the debloating process.

---

## **Requirements**

- **Windows OS**: This script is written for Windows and uses batch scripting (`.bat`).
- **ADB (Android Debug Bridge)**: ADB must be installed and accessible from your command line. You can download it from [here](https://developer.android.com/studio).
- **Android Device**: You must have an Android device connected via USB with **USB Debugging enabled**. Make sure to authorize the connection when prompted on your device.

---

## **Setup**

1. **Install ADB**:
   - Download and install ADB from [here](https://developer.android.com/studio).
   - Ensure ADB is added to your system's PATH.

2. **Enable USB Debugging**:
   - On your Android device, go to **Settings** > **About Phone** > tap **Build Number** 7 times to unlock Developer Options.
   - In **Developer Options**, enable **USB Debugging**.

3. **Connect Your Device**:
   - Connect your Android device via USB to your computer.
   - Make sure the device is detected by running the following command in your command line:
     ```bash
     adb devices
     ```

4. **Prepare `debloat.txt`**:
   - Create a text file named `debloat.txt` in the same directory as the batch script.
   - List the package names of the apps you wish to remove (one per line). For example:
     ```txt
     com.android.bloatware1
     com.android.bloatware2
     com.google.android.gm
     ```

---

## **Usage**

1. **Run the Script**:
   - Double-click `debloater.bat` to launch the script.
   
2. **Device Information**:
   - The script will display details about your connected device (model, brand, software version).

3. **User Confirmation**:
   - The script will ask: "Are you ready to uninstall the apps listed in `debloat.txt`?"
   - Type `y` to proceed or `n` to exit.

4. **Uninstallation**:
   - If you confirm, the script will begin uninstalling each app listed in `debloat.txt` and log the process in `debloater_log.txt`.

5. **Exit**:
   - After completing the process, it will ask you to press Enter to exit the script.

---

## **Log Files**

The script logs the following details:
- **Device Information**: Model, brand, software version.
- **Uninstallation Success/Failure**: Each app’s uninstallation attempt is recorded.
- **User Actions**: Any confirmation inputs and choices you make are logged.

The log file will be named `debloater_log.txt` and stored in the same folder as the script.

---

## **Example of `debloat.txt`**

```txt
com.android.bloatware1
com.android.bloatware2
com.google.android.gm
com.samsung.android.messaging
com.amazon.amazonvideo

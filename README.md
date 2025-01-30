# Zephyr Meetup Project

This project demonstrates building and running a Zephyr-based application across multiple platforms, including Nordic's **nRF52DK**, ST's **Nucleo H563ZI**, and the **native simulation** environment.

## 📦 Building the Project

### **For nRF52DK (nRF52832)**
```sh
west build --board nrf52dk/nrf52832 app --pristine
```

### **For Nucleo H563ZI**
```sh
west build --board nucleo_h563zi app --pristine
```

### **For Native Simulation**
```sh
west build --board native_sim app --pristine
```
Run the simulation:
```sh
west build --target run
```

## 🛠️ Configuring the Kernel and Drivers
Modify kernel configurations interactively:
```sh
west build --target menuconfig
```

To enable logging, add the following configuration:
```sh
CONFIG_LOG=y
```

To use GPIO testing via the shell, ensure these options are enabled:
```sh
CONFIG_SHELL=y
CONFIG_GPIO_SHELL=y
```

## 🛠️ GPIO Testing via Shell

To interact with the shell, first connect to the UART interface using a terminal emulator such as `minicom`, `screen`, or `picocom`. For example:
```sh
minicom --device /dev/ttyACM0 --baudrate 115200
```

Once connected, you can use the following commands to control GPIO pins:
Enable GPIO control in Zephyr’s shell (`uart:~$`):

1. Configure GPIO pin **18** as output:
   ```sh
   gpio conf gpio@50000000 18 o
   ```
2. Set pin **18** LOW:
   ```sh
   gpio set gpio@50000000 18 0
   ```
3. Set pin **18** HIGH:
   ```sh
   gpio set gpio@50000000 18 1
   ```

### 📝 Logging
Set the main log level to **0** for minimal output:
```sh
kernel log-level main 0
```

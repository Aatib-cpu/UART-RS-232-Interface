# UART-RS-232-Interface

## Overview

The UART (Universal Asynchronous Receiver/Transmitter) peripheral enables serial communication between the FPGA and external devices. This documentation provides an overview of the UART peripheral, its features, configuration options, usage guidelines, and support information.

## Features

- **Serial Communication**: The UART peripheral facilitates asynchronous serial communication with external devices.
  
- **Configurable Parameters**: user can configure the baud rate as per their communication requirements.
  
- **Transmit and Receive modules**: The UART peripheral includes separate modules for transmitting and receiving data, allowing for efficient data transfer.

## Configuration

To configure the UART peripheral, user has to pass configuration frame which is mentioned below to update the value of the configuration register of UART. 

    
1. `BAUD_RATE`: It Specifies the baud rate for serial communication. To configure the baud rate of uart we have to pass the value of clk_per_bit as the configuration value which can be calculated as per above formula -

    ```
    Formula :
        clks per bit = (system clk) / (baud rate)
    ```
    
    Example:

    Configuration frame :
    Let's assume the system clk frequency is 50MHz and the slave id of uart is 1,the configuration id to configure baud-rate is 0, and we want to configure it to run on baud rate of 115200 bps. 
    hence,
    ```
        clks_per_bit = 50000000/115200
        clks_per_bit = 434 = 0x1B2
    ```
    Thus, the configuration register will be -
    ```
    00 00 01 B2
    ```

> **_NOTE:_**  It is mandatory to configure the parameters after uploading or refreshing the bitstream into the FPGA. By default value of all the configuration register will be 0.

## Data Frame
Example:

Data frame :
To write 4 bytes (0x41 0x42 0x43 0x44) on uart -
```
41 42 43 44
```

## Usage
**Data Transmission and Reception**: UART transmit and receive interfaces used to send and receive data over the serial interface.

## Support

This documentation provides an overview of the UART peripheral, including its features, configuration options, usage guidelines, and support information.

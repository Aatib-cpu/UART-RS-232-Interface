# UART-RS-232-Interface

<img src="https://github.com/Aatib-cpu/UART-RS-232-Interface/blob/main/uart_serial_data_stream.png" alt="logo" style="width: 80%;">

## Overview

UART (Universal Asynchronous Receiver/Transmitter) is a hardware communication protocol that enables asynchronous serial data transmission, meaning no shared clock signal is required between the sender and receiver. The UART peripheral facilitates serial communication between the FPGA and external devices. Important terms in UART:

**Baud Rate**: It defines the number of bit transfer per second. For example if baud-rate is 9600 means 9600 bits transfer in one second. To configure the baud rate of uart we have to pass the value of clk_per_bit as the configuration value which can be calculated as per above formula -
```
Formula : clks per bit = (system clk) / (baud rate)
```
clock per bit defines the number of clock counts for each bit transfer.
    
Example:

Configuration frame :
Let's assume the system clk frequency is 100MHz and the slave id of uart is 1,the configuration id to configure baud-rate is 0, and we want to configure it to run on baud rate of 9600 bps. 
hence,
    ```
        clks_per_bit = 100000000/9600
        clks_per_bit = 10417
        in code, clk_per_bit = 32'd10417;
    ```

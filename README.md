# BlitzScan: Fast Network Scanner

## Overview

This Bash script provides a lightning-fast and efficient way to scan your network for active hosts, claiming to be 2x faster than Angry IP Scanner. Its speed prowess lies in a combination of efficient loop iteration and optimized use of the `ping` command with tailored arguments.

## Technical Features

* **Rapid IP address iteration:** Efficiently explores the specified IP range using the `seq` command.
* **Optimized ping parameters:** Leverages specific `ping` arguments to prioritize speed:
    * **Interface targeting (-I $int):** Focuses the scan on the desired network segment.
    * **Flood ping mode (-f):** Unleashes a torrent of ICMP echo requests.
    * **Zero interval (-i 0):** Eliminates delays between ping packets.
    * **Minimal packet size (-s 0):** Reduces network overhead (adjust based on your network).
    * **Reduced request count (-c 2):** Balances speed with reliability.
    * **Short timeout (-w 1):** Moves on quickly from unresponsive hosts.
* **Logging results:** Logs ping results and ARP information for further analysis.
* **User-friendly interface:** Provides clear prompts for user input and displays scan results.

## Usage
Clone the repository:

```bash
git clone https://github.com/giruu/BlitzScan.git
```
Navigate to the cloned directory:

```bash
cd BlitzScan
```
1. Make the script executable: `chmod +x BlitzScan.sh`
2. Run the script: `./BlitzScan.sh`
3. Follow the prompts to enter the interface and IP range.

## Dependencies

- `ping` and `arp` commands (standard on most Linux systems)

## Notes

- Adjust the `ping` parameters if needed for your specific network environment.
- The script optionally displays a logo if the "Logo" subdirectory and "introxt_logo" file are present.

This updated documentation provides a more technical perspective on the script's inner workings, empowering users to understand and fine-tune its behavior for optimal performance in their specific network context.


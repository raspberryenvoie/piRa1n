# v5.2
### Added
- Create a new `pi` user if it doesn't exist: installing piRa1n will work if the there is no `pi` user.
### Changed
- Cleaned up a lot of code
- piRa1n-web v2.0
- Use Armbian instead of Raspbian for the Banana Pi M2 Zero for better compatibility with USB ports.

# v5.1
### Changed
- Updated checkra1n to 0.11 beta

# v5.0.2 - 2020-07-31
### Fixed
- Startup script not saving the log to /var/www/html

# v5.0.1 - 2020-07-24
### Changed
- piRa1n-web v1.3.1

# v5 - 2020-07-23
### Added
- Odysseyra1n script
### Changed
- piRa1n-web v1.3

# v4 - 2020-07-21
### Added
- Option: auto recovery mode (automatically puts the iDevice into recovery mode)
### Changed
- Renamed checkra1n executable to checkra1n
- Use bash in most of scripts instead of sh
- Use apt-get instead of apt to support cli
- piRa1n-web v1.2

# v3.1 - 2020-07-05
### Added
- Colon in uninstall_piRa1n.sh when asking for confirmation
### Changed
- piRa1n-web v1.1
### Fixed
- Indentations in config.sh and uninstall_piRa1n.sh.

# v3 - 2020-05-28
### Added
- [piRa1n-web](https://github.com/raspberryenvoie/piRa1n-web) (a web interface to configure and update piRa1n)
- Verbose boot
- Script to update piRa1n and checkra1n
### Changed
- Improved the config script

# v2.1 - 2020-05-25
### Changed
- Updated checkra1n to 0.10.2 beta

# v2
### Added
- [piRa1n OS](https://github.com/raspberryenvoie/piRa1n-OS) - a quick and easy installer
### Changed
- Switched to Raspbian Lite instead of Raspbian with desktop

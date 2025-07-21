Remote Desktop Connection Manager
https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%253D%253D&auto=format&fit=crop&w=1200&h=400&q=80

A powerful command-line utility for managing Remote Desktop connections with secure credential handling and customizable settings. Perfect for IT administrators and power users who frequently connect to multiple remote systems.

batch
rdp_manager.bat
1. Connect to remote PC
2. Help / Instructions
3. Settings
4. Exit
Features
🔒 Secure Credential Handling: Automatically stores and deletes credentials

🎨 Customizable Interface: Change text colors and display settings

⚡ Quick Connections: Fast connection setup with history

🔧 RDP Configuration: Control fullscreen mode and resolution

📋 Helpful Guides: Built-in connection troubleshooting

🧹 Auto Cleanup: Always removes credentials after session

Getting Started
Prerequisites
Windows 10 or newer

Remote Desktop enabled on target systems

Network connectivity between systems

Installation
Download the latest release:

batch
git clone https://github.com/Kieranmcm07/Remote-Desktop-CMD.git
Run the manager:

batch
cd Remote-Desktop-CMD
rdp_manager.bat
First Connection
batch
1. Select "Connect to remote PC"
2. Enter remote IP/hostname
3. Enter username (DOMAIN\user or user@domain.com)
4. Enter password
Key Features
Feature	Description	Command Example
Secure Creds	Auto store/delete credentials	cmdkey /generic:TERMSRV/...
Color Themes	8 color schemes for CLI	color 0a (Green)
Display Control	Fullscreen/windowed modes	mstsc /f or /w:1024 /h:768
Connection History	Saves recent hosts	Auto-complete in future runs
Help Guide	Built-in troubleshooting	Access via main menu
Settings Customization
Customize your RDP experience through the settings menu:

batch
[ SETTINGS CUSTOMIZATION ]
1. Change text color
2. Configure RDP display
3. Clear saved credentials

[ TEXT COLOR OPTIONS ]
1. Green (Default)  4. Yellow      7. Light Purple
2. Blue            5. Magenta    8. Bright White
3. Cyan            6. Light Red
Troubleshooting
Common solutions for connection issues:

Can't connect?

Verify Remote Desktop is enabled on target PC

Check network connectivity (ping remote-pc)

Ensure firewall allows RDP (TCP port 3389)

Credential errors?

Use correct format: DOMAIN\username or user@domain.com

Try IP address instead of hostname

Display issues?

Adjust resolution in settings menu

Toggle fullscreen mode

License
This project is licensed under the MIT License - see LICENSE for details.

Created by Kieranmcm07
https://img.shields.io/github/stars/Kieranmcm07/Remote-Desktop-CMD?style=social
https://img.shields.io/github/license/Kieranmcm07/Remote-Desktop-CMD
https://img.shields.io/github/v/release/Kieranmcm07/Remote-Desktop-CMD

Contribution
Contributions welcome! Please submit PRs for:

Additional authentication methods

Connection profile management

Enhanced logging features

Multi-monitor support

bash
# Build instructions
fork https://github.com/Kieranmcm07/Remote-Desktop-CMD
Create feature branch (git checkout -b feature/improvement)
Commit changes (git commit -am 'Add new feature')
Push branch (git push origin feature/improvement)
Open Pull Request
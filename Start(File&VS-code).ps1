# Get the directory of the script
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Change to the script's directory
Set-Location -Path $scriptDirectory

# Run 'code .' to open the script's directory in Visual Studio Code
code .

# Open the script's directory in File Explorer
Start-Process explorer.exe $scriptDirectory

exit



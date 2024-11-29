function Show-HiddenFiles {
    [CmdletBinding(DefaultParameterSetName = "On")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "On")]
        [System.Management.Automation.SwitchParameter]
        $On,

        [Parameter(Mandatory = $true, ParameterSetName = "Off")]
        [System.Management.Automation.SwitchParameter]
        $Off
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "On") { $Value = 1 }
        if ($PSCmdlet.ParameterSetName -eq "Off") { $Value = 2 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name Hidden -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}


Show-HiddenFiles -Off

$dir_path = Get-Location

$password_file = Get-Item $dir_path'\password.txt' -Force
$password_file.Attributes = 'Hidden'
Move-Item -Path $dir_path'\password.txt' -Destination $dir_path'\level 2 - extract here!\password.txt'

$OOP_file = Get-Item $dir_path'\Bruteforce_OOP.py' -Force
$OOP_file.Attributes = 'Hidden'
Move-Item -Path $dir_path'\Bruteforce_OOP.py' -Destination $dir_path'\level 2 - extract here!\Bruteforce_OOP.py'

$web_file = Get-Item $dir_path'\website' -Force
$web_file.Attributes = 'Hidden'
Move-Item -Path $dir_path'\website' -Destination $dir_path'\level 2 - extract here!\website'

$chrome_driver = Get-Item $dir_path'\level 2 - extract here!\chromedriver.exe' -Force
$chrome_driver.attributes = 'Hidden'

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 2 /f

pip --proxy http://10.0.0.10:80 install selenium
pip --proxy http://10.0.0.10:80 install webdriver-manager
pip --proxy http://10.0.0.10:80 install packaging

Remove-Item -Path $dir_path'\Read_Me_Team!.pdf' -Force
Remove-Item -Path $dir_path'\automation.ps1' -Force
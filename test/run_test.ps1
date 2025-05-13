param (
    $testPath
)

if (-not(Test-Path -Path $testPath -PathType Leaf))
{
    Write-Error ("run_test: cannot find test file : " + $testPath);
    exit 1;
}

# using scoop to install pester
mkdir C:\TMP;
powershell.exe -ExecutionPolicy RemoteSigned `Invoke-WebRequest 'https://get.scoop.sh' -outfile C:\TMP\install.ps1;
C:\TMP\install.ps1 -RunAsAdmin;
scoop install pester;

$config = New-PesterConfiguration;
$config.Run.Path = "$testPath";

Invoke-Pester -CI -Configuration $config;

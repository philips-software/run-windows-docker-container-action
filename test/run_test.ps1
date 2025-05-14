param (
    $testPath
)

if (-not(Test-Path -Path $testPath -PathType Leaf))
{
    Write-Error ("run_test: cannot find test file : " + $testPath);
    exit 1;
}

Install-PackageProvider NuGet -Force;
If ($? -ne "True" ) { Throw };
Install-Module -Force Pester;
If ($? -ne "True" ) { Throw };

$config=New-PesterConfiguration;
If ($? -ne "True" ) { Throw };
$config.Run.Exit=$true;
If ($? -ne "True" ) { Throw };
$config.Run.Path="$testPath";
If ($? -ne "True" ) { Throw };

Invoke-Pester -Configuration $config;
If ($? -ne "True" ) { Throw };

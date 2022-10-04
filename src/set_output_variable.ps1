
# set github output with name and value
param (
    $name,
    $val = '@'
)

$invovationPath =  "$PSScriptRoot";
$trimArg        = "$invovationPath" + "\trim_arg.ps1";

$trimmed_name = & $trimArg -arg $name;
$trimmed_val  = & $trimArg -arg $val;

if ( ${trimmed_val}.Trim(' ') -ne "" )
{
    Write-Output "::set-output name=$trimmed_name::$trimmed_val";
}

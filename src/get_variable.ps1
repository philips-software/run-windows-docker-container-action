
# get value value or defaultvalue
param (
    $defaultVal,
    $setVal="@"
)

$invovationPath  = "$PSScriptRoot";
$trimArg         = "$invovationPath" + "\trim_arg.ps1";

$trimmed_val     = & $trimArg -arg $setVal;

if ( $trimmed_val -eq "" )
{
    return "$defaultval";
}
else
{
    return "$setVal";
};

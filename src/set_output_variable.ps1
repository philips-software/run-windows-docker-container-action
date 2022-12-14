
# set github output with name and value
param (
    $name,
    $val = '@'
)

$invovationPath =  "$PSScriptRoot";
$trimArg        = "$invovationPath" + "\trim_arg.ps1";

$trimmed_name = & $trimArg -arg $name;
$trimmed_val  = & $trimArg -arg $val;

function toGitHub  {
    param(
        $output_name,
        $output_value
    )
    "$output_name=$output_value" >> $env:GITHUB_OUTPUT;
}

if ( ${trimmed_val}.Trim(' ') -ne "" )
{
    toGitHub -output_name "$trimmed_name" -output_value "$trimmed_val";
}

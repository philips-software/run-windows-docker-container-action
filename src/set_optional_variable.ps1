
# sets argument to value if not empty
param (
    $argument_name,
    $setVal="@"
)

$invovationPath =  "$PSScriptRoot";
$trimArg        = "$invovationPath" + "\trim_arg.ps1";

$name = & $trimArg -arg $argument_name;
$val = & $trimArg -arg $setVal;

$arg = "";
if ( $val -ne "" )
{
    $arg = $arg + " " + $name + " " + $val;
}
return $arg;


#split comma separated string to extra arguments with name "argument_name"
#
# for example : split_to_args.ps1 -argument_name @--env -env_arrays "@name1, name2"
# returns: "--env name1 --env name2"
param (
    $argument_name,
    $env_arrays="@"
)
$invovationPath       = "$PSScriptRoot";
$trimArg              = "$invovationPath" + "\trim_arg.ps1";

$trimmed_argument_name = & $trimArg -arg $argument_name;
$trimmed_env_arrays    = & $trimArg -arg $env_arrays;

$arg = "";
if ( $trimmed_env_arrays -ne "" )
{
    $EnvArray=${trimmed_env_arrays}.Split(",");
    For($i=0; $i -lt $EnvArray.Length; $i++)
    {
        $arg = $arg + " " + $trimmed_argument_name + " " + $EnvArray[$i];
    }
};
return $arg;

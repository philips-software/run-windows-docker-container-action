
param(
  $envNames,
  $entryPoint,
  $extraArgs
)

$invovationPath =  "$PSScriptRoot";
$setoutputVariable       = "$invovationPath" + "\set_output_variable.ps1";
$splitToArgs             = "$invovationPath" + "\split_to_args.ps1";
$setOptionalVariable     = "$invovationPath" + "\set_optional_variable.ps1";
$trimArg                 = "$invovationPath" + "\trim_arg.ps1";


$args_env = & "$splitToArgs" -argument_name "@--env" -env_arrays "$envNames";
$args_entrypoint = & "$setOptionalVariable" -argument_name "@--entrypoint" -setVal "$entryPoint";
$eargs = & "$trimArg" -arg "$extraArgs";
$allargs = "@" + "${eargs}" + " " + "${args_env}" + " " + "${args_entrypoint}";
& "$setoutputVariable" -name extra_args -val "$allargs";

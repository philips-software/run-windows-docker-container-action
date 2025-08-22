
param(
    $githubWorkSpace,
    $workspacePath,
    $mappingPath,
    $workPath
)

$invovationPath    = "$PSScriptRoot";
$getVariable       = "$invovationPath" + "\get_variable.ps1";
$setoutputVariable = "$invovationPath" + "\set_output_variable.ps1";

$work_space_path = & "$getVariable" -defaultVal "$githubWorkSpace" -setVal "$workspacePath";
$mapping_path    = & "$getVariable" -defaultVal "$work_space_path" -setVal "$mappingPath";
$work_path       = & "$getVariable" -defaultVal "$mapping_path"    -setVal "$workPath";

& "$setoutputVariable" -replace "" -name workspace_path -val "$work_space_path";
& "$setoutputVariable" -name mapping_path   -val "$mapping_path";
& "$setoutputVariable" -name work_path      -val "$work_path";

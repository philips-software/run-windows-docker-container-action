$invocationPath = $PSScriptRoot
$setOutputVariable = Join-Path $invocationPath "set_output_variable.ps1"
$splitToArgs = Join-Path $invocationPath "split_to_args.ps1"
$trimArg = Join-Path $invocationPath "trim_arg.ps1"

$defaultGitHubEnvVars = @(
    "CI", "GITHUB_ACTION", "GITHUB_ACTION_PATH", "GITHUB_ACTION_REPOSITORY",
    "GITHUB_ACTIONS", "GITHUB_ACTOR", "GITHUB_API_URL", "GITHUB_BASE_REF",
    "GITHUB_ENV", "GITHUB_EVENT_NAME", "GITHUB_EVENT_PATH", "GITHUB_HEAD_REF",
    "GITHUB_JOB", "GITHUB_OUTPUT", "GITHUB_PATH", "GITHUB_REF", "GITHUB_REF_NAME",
    "GITHUB_REF_PROTECTED", "GITHUB_REF_TYPE", "GITHUB_REPOSITORY",
    "GITHUB_REPOSITORY_OWNER", "GITHUB_RETENTION_DAYS", "GITHUB_RUN_ATTEMPT",
    "GITHUB_RUN_ID", "GITHUB_RUN_NUMBER", "GITHUB_SERVER_URL", "GITHUB_SHA",
    "GITHUB_STEP_SUMMARY", "GITHUB_WORKFLOW", "GITHUB_WORKSPACE", "RUNNER_ARCH",
    "RUNNER_DEBUG", "RUNNER_NAME", "RUNNER_OS", "RUNNER_TEMP", "RUNNER_TOOL_CACHE"
)

$defaultGitHubEnv = & $splitToArgs -argument_name "--env" -env_arrays $defaultGitHubEnvVars
$trimmedArgs = & $trimArg -arg $defaultGitHubEnv
& $setOutputVariable -name "default_environment_variables" -val "@$trimmedArgs"

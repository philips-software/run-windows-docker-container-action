
Describe "assign_default_environment_variables" {
    BeforeEach{
        function toGitHub () {
            param(
                $output_name,
                $output_value
            )
            Write-Output "$output_name=$output_value";
        }
        Mock toGitHub -MockWith { Write-Output "$output_name=$output_value";}
    }

    Context "when processing default GitHub environment variables" {
        It "should output all default GitHub environment variables as --env arguments" {
            $result = .\assign_default_environment_variables.ps1

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

            # Assert: Verify the output contains all default environment variables
            foreach ($envVar in $defaultGitHubEnvVars) {
                $result | Should -Match "--env $envVar"
            }

            # Assert: Verify the output variable is set correctly
            $result | Should -Match "default_environment_variables=@"
        }
    }
}

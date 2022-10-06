Describe "workspace_path" {
    Context "when workspace path is set to test" {
        It "current directory should be github workspace" {
            $current = $env:TEST_MAPPING_PATH
            Write-Output $pwd | Should -BeLike $current
        }
    }

    Context "when workspace path is set to test" {
        It "current directory should contain tests" {
            $test_file = "$pwd" + "\workspace_path.Tests.ps1"
            $test_file | Should -Exist
        }
    }

    Context "when workspace path is set to test" {
        It "high level files should not exist" {
            $test_file = $env:TEST_MAPPING_PATH + "\README.md"
            $test_file | Should -Not -Exist
        }
    }
}

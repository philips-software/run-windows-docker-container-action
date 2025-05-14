Describe "run_default" {
    Context "when no workspace, mapping, work path is used" {
        It "current directory should be github workspace path" {
            $currentdir = "$pwd"
            $github_workspace = "$env:TEST_MAPPING_PATH"
            Write-Output $currentdir | Should -BeLike $github_workspace
        }
    }

    Context "when no workspace, mapping, work path is used" {
        It "work directory directory should point to github workspace path" {
            $testfile = "$env:TEST_MAPPING_PATH" + "\test\run_default.Tests.ps1"
            $testfile | Should -Exist
        }
    }

    Context "default GitHub Action paths should be available" {
        It "GITHUB_EVENT_PATH should exist" {
            "$env:GITHUB_EVENT_PATH" | Should -Exist
        }
    }
}

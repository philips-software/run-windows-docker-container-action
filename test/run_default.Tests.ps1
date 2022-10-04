Describe "run_default" {
    Context "when no workspace, mapping, work path is used" {
        It "current directory should be github workspace path" {
            $currentdir = "$pwd"
            $github_workspace = "$env:GITHUB_WORKSPACE"
            Write-Output $currentdir | Should -Be $github_workspace
        }
    }

    Context "when no workspace, mapping, work path is used" {
        It "work directory directory should point to github workspace path" {
            $testfile = "$env:GITHUB_WORKSPACE" + "\test\run_default.Tests.ps1"
            $testfile | Should -Exist
        }
    }
}

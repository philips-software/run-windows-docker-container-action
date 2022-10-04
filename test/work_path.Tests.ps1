Describe "work_path" {
    Context "when work_space to c:\temp and mapping is not used" {
        It "current directory should be c:\temp" {
            Write-Output $pwd | Should -Be "c:\temp"
        }
    }

    Context "when work_space to c:\temp and mapping is not used" {
        It "work directory directory should not point to workspace" {
            "c:\temp\test\work_path.Tests.ps1" | Should -Not -Exist
        }
    }
}

Describe "mapping_path" {
    Context "when mapping to c:\mapping and work_space to c:\temp" {
        It "current directory should be c:\temp" {
            Write-Output $pwd | Should -Be "c:\temp"
        }
    }

    Context "when mapping to c:\mapping and work_space to c:\temp" {
        It "mapping directory should point to workspace" {
            "c:\mapping\test\mapping_path.Tests.ps1" | Should -Exist
        }
    }
}

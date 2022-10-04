Describe "environment" {
    Context "when environments are set" {
        It "TEST1 should be passed" {
            Write-Output $env:TEST1 | Should -Be "Test1"
        }
    }

    Context "when environments are set" {
        It "TEST2 should be passed" {
            Write-Output $env:TEST2 | Should -Be "Test2"
        }
    }

    Context "when secret environments are set" {
        It "TEST3 should be passed" {
            Write-Output $env:TEST3 | Should -Be "this-is-secret"
        }
    }
}

Describe "default environment" {
    Context "default environment should always be set" {
        It "CI should be true" {
            Write-Output $env:CI | Should -Be "true"
        }
    }
}

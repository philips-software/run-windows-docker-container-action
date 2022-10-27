Describe "set_output_variable" {
    Context "when val is not used" {
        It "it should return empty" {
            $name = 'theName'
            .\set_output_variable.ps1 -name $name | Should -BeNullOrEmpty
        }
    }

    Context "when val is prefix" {
        It "it should return empty" {
            $name = 'theName'
            $val = '@'
            .\set_output_variable.ps1 -name $name -val $val | Should -BeNullOrEmpty
        }
    }

    Context "when val is prefix and value" {
        It "it should return output" {
            $name = '@theName'
            $val = '@value'
            .\set_output_variable.ps1 -name $name -val $val | Should -Be "`"theName=value`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when val is  value" {
        It "it should return output" {
            $name = 'theName'
            $val = 'value'
            .\set_output_variable.ps1 -name $name -val $val | Should -Be "`"theName=value`" >> `$GITHUB_OUTPUT"
        }
    }
}

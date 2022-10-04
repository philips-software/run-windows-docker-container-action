Describe "set_output_variable" {
    Context "when setVal is not used" {
        It "it should return empty" {
            $name = '@--name'
            .\set_optional_variable.ps1 -argument_name $name | Should -Be ""
        }
    }

    Context "when setVal is prefix" {
        It "it should return empty" {
            $name = '@--name'
            $val = '@'
            .\set_optional_variable.ps1 -argument_name $name -setVal $val | Should -Be ""
        }
    }

    Context "when setVal is value" {
        It "it should return argument with value" {
            $name = '@--name'
            $val = 'value'
            .\set_optional_variable.ps1 -argument_name $name -setVal $val | Should -Be " --name $val"
        }
    }

    Context "when setVal is value with prefix" {
        It "it should return argument with value" {
            $name = '@--name'
            $val = '@value'
            .\set_optional_variable.ps1 -argument_name $name -setVal $val | Should -Be " --name value"
        }
    }
}

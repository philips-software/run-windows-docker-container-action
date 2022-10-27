Describe "set_output_variable" {
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
            .\set_output_variable.ps1 -name $name -val $val | Should -Be "theName=value"
        }
    }

    Context "when val is  value" {
        It "it should return output" {
            $name = 'theName'
            $val = 'value'
            .\set_output_variable.ps1 -name $name -val $val | Should -Be "theName=value"
        }
    }

}

Describe "split_to_args" {
    Context "when env_arrays is not used" {
        It "it should return empty" {
            $name = 'name'
            .\split_to_args.ps1 -argument_name $name | Should -Be ""
        }
    }

    Context "when env_arrays is empty" {
        It "it should return empty" {
            $name = 'name'
            $env_arrays = '@'
            .\split_to_args.ps1 -argument_name $name -env_arrays $env_arrays | Should -Be ""
        }
    }

    Context "when env_arrays is has one value" {
        It "it should return argument list" {
            $name = '@--name'
            $env_arrays = '@NAME2'
            .\split_to_args.ps1 -argument_name $name -env_arrays $env_arrays | Should -Be " --name NAME2"
        }
    }

    Context "when env_arrays is has more values" {
        It "it should return argument list" {
            $name = '@--name'
            $env_arrays = '@NAME2,NAME3'
            .\split_to_args.ps1 -argument_name $name -env_arrays $env_arrays | Should -Be " --name NAME2 --name NAME3"
        }
    }

    Context "when env_arrays is has more values" {
        It "it should return argument list" {
            $name = '@--name'
            $env_arrays = '@NAME2, NAME3  , NAME4'
            .\split_to_args.ps1 -argument_name $name -env_arrays $env_arrays | Should -Be " --name NAME2 --name  NAME3   --name  NAME4"
        }
    }
}

Describe "parse_input_extra_args" {
    Context "when nothing set" {
        It "it should return nothing" {
            .\parse_input_extra_args.ps1  | Should -BeNullOrEmpty
        }
    }

    Context "when envNames set" {
        It "it should return envNames" {
            $envNames = '@NAME1, NAME2'
            .\parse_input_extra_args.ps1 -envNames $envNames | Should -Be `
                            "`"extra_args=  --env NAME1 --env  NAME2 `" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when entrypoint set" {
        It "it should return entrypoint" {
            $entryPoint = '@pwsh.exe'
            .\parse_input_extra_args.ps1 -entryPoint $entryPoint | Should -Be `
                            "`"extra_args=   --entrypoint pwsh.exe`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when extra_args set" {
        It "it should return extra args" {
            $extraArgs = '@--test 123456'
            .\parse_input_extra_args.ps1 -extraArgs $extraArgs | Should -Be `
                            "`"extra_args=--test 123456  `" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when extra_args and entrypoint set" {
        It "it should return extra args and entrypoint" {
            $entryPoint = '@pwsh.exe'
            $extraArgs = '@--test 123456'
            .\parse_input_extra_args.ps1 -entryPoint $entryPoint -extraArgs $extraArgs | Should -Be `
                            "`"extra_args=--test 123456   --entrypoint pwsh.exe`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when envNames and entrypoint set" {
        It "it should return envNames and entrypoint" {
            $entryPoint = '@pwsh.exe'
            $envNames = '@NAME1,NAME2'
            .\parse_input_extra_args.ps1 -entryPoint $entryPoint -envNames $envNames | Should -Be `
                            "`"extra_args=  --env NAME1 --env NAME2  --entrypoint pwsh.exe`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when envNames and entrypoint and extra args set" {
        It "it should return envNames and entrypoint and extra args" {
            $entryPoint = '@pwsh.exe'
            $envNames = '@NAME1,NAME2'
            $extraArgs = '@--test 123456'
            .\parse_input_extra_args.ps1 -entryPoint $entryPoint -envNames $envNames -extraArgs $extraArgs | Should -Be `
                            "`"extra_args=--test 123456  --env NAME1 --env NAME2  --entrypoint pwsh.exe`" >> `$GITHUB_OUTPUT"
        }
    }
}

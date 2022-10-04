Describe "trim_arg" {
    Context "when parameter has no @ prefix" {
        It "it should return unchanged arg" {
            $val = 'value'
            .\trim_arg.ps1 -arg $val | Should -Be "$val"
        }
    }

    Context "when parameter has @ prefix" {
        It "it should return trimmed arg" {
            $val = '@value'
            .\trim_arg.ps1 -arg $val | Should -Be "value"
        }
    }

    Context "when parameter has @ postfix" {
        It "it should return unchanged arg" {
            $val = 'value@'
            .\trim_arg.ps1 -arg $val | Should -Be "$val"
        }
    }

    Context "when parameter has double @ prefix" {
        It "it should return trimmed arg" {
            $val = '@@value'
            .\trim_arg.ps1 -arg $val | Should -Be "value"
        }
    }
}

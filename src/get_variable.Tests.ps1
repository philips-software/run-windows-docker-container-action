Describe "get_variable" {
    Context "when parameter setVal is empty" {
        It "it should return defaultVal" {
            $defaultVal = 'default'
            .\get_variable.ps1 -defaultVal $defaultVal -setVal "@" | Should -Be "$defaultVal"
        }
    }

    Context "when parameter setVal is not empty" {
        It "it should return setVal" {
            $defaultVal = 'default'
            $val = 'value'
            .\get_variable.ps1 -defaultVal $defaultVal -setVal $val | Should -Be "$val"
        }
    }

    Context "when parameter setVal is not used" {
        It "it should return defaultVal" {
            $defaultVal = 'default'
            .\get_variable.ps1 -defaultVal $defaultVal | Should -Be "$defaultVal"
        }
    }
}

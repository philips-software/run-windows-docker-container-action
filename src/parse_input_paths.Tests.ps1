Describe "parse_input_paths" {
    Context "when workspace, mapping, work not set" {
        It "it should return gitworkspace" {
            $githubWorkSpace = '@github_work_space'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace | Should -Be `
                            "`"workspace_path=github_work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=github_work_space`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=github_work_space`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when mapping, work not set" {
        It "it should return workspace path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace  | Should -Be `
                            "`"workspace_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=work_space`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when work not set" {
        It "it should return workspace, mapping path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $mapping = '@mapping'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -mappingPath $mapping  | Should -Be `
                            "`"workspace_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=mapping`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=mapping`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when all set" {
        It "it should return workspace, mapping, work path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $mapping = '@mapping'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -mappingPath $mapping -workPath $work | Should -Be `
                            "`"workspace_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=mapping`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=work`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when mapping not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -workPath $work | Should -Be `
                            "`"workspace_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=work_space`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=work`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when workspace not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $mapping = '@mapping'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -mappingPath $mapping -workPath $work | Should -Be `
                            "`"workspace_path=github_work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=mapping`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=work`" >> `$GITHUB_OUTPUT"
        }
    }

    Context "when workspace and work not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $mapping = '@mapping'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -mappingPath $mapping | Should -Be `
                            "`"workspace_path=github_work_space`" >> `$GITHUB_OUTPUT", `
                            "`"mapping_path=mapping`" >> `$GITHUB_OUTPUT", `
                            "`"work_path=mapping`" >> `$GITHUB_OUTPUT"
        }
    }
}

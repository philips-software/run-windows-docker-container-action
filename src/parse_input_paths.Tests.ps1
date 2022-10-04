Describe "parse_input_paths" {
    Context "when workspace, mapping, work not set" {
        It "it should return gitworkspace" {
            $githubWorkSpace = '@github_work_space'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace | Should -Be `
                            "::set-output name=workspace_path::github_work_space", `
                            "::set-output name=mapping_path::github_work_space", `
                            "::set-output name=work_path::github_work_space"
        }
    }

    Context "when mapping, work not set" {
        It "it should return workspace path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace  | Should -Be `
                            "::set-output name=workspace_path::work_space", `
                            "::set-output name=mapping_path::work_space", `
                            "::set-output name=work_path::work_space"
        }
    }

    Context "when work not set" {
        It "it should return workspace, mapping path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $mapping = '@mapping'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -mappingPath $mapping  | Should -Be `
                            "::set-output name=workspace_path::work_space", `
                            "::set-output name=mapping_path::mapping", `
                            "::set-output name=work_path::mapping"
        }
    }

    Context "when all set" {
        It "it should return workspace, mapping, work path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $mapping = '@mapping'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -mappingPath $mapping -workPath $work | Should -Be `
                            "::set-output name=workspace_path::work_space", `
                            "::set-output name=mapping_path::mapping", `
                            "::set-output name=work_path::work"
        }
    }

    Context "when mapping not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $workSpace = '@work_space'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -workspacePath $workSpace -workPath $work | Should -Be `
                            "::set-output name=workspace_path::work_space", `
                            "::set-output name=mapping_path::work_space", `
                            "::set-output name=work_path::work"
        }
    }

    Context "when workspace not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $mapping = '@mapping'
            $work = '@work'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -mappingPath $mapping -workPath $work | Should -Be `
                            "::set-output name=workspace_path::github_work_space", `
                            "::set-output name=mapping_path::mapping", `
                            "::set-output name=work_path::work"
        }
    }

    Context "when workspace and work not set" {
        It "it should return workspace, work path" {
            $githubWorkSpace = '@github_work_space'
            $mapping = '@mapping'
            .\parse_input_paths.ps1 -githubWorkSpace $githubWorkSpace -mappingPath $mapping | Should -Be `
                            "::set-output name=workspace_path::github_work_space", `
                            "::set-output name=mapping_path::mapping", `
                            "::set-output name=work_path::mapping"
        }
    }
}

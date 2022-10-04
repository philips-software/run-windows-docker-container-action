## Arguments

Arguments to these scripts should have a prefix `@`

This is done for two reasons:

* standard powershell scripts cannot handle empty arguments. 
By using this prefix arguments are never empty.
* standard powershell scripts cannot handle arguments with `-` prefix. 
By using this prefix, arguments to the scripts never have this prefix.

## Tests

Run tests with `Pester` on this directory.

`Invoke-Pester`

See https://pester.dev/

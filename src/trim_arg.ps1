
# remove trailing '@' from argument
param (
    $arg
)
return ${arg}.TrimStart('@');

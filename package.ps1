[regex]$regex = 'Version="(\d\.\d)"'
$ver = $regex.Match((Get-Content .\toc.xml)).Groups[1].Value
git archive --output=ShutUpMeg-$ver.zip --prefix="ShutUpMeg/" master
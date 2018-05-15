$file = Get-ChildItem -Path cluster-state/Deployment/$ENV:DEPLOYMENT
$newName = "$($ENV:IMAGE_NAME):$(Get-Content -Raw -Path source/metadata/tag)"
$string = (Get-Content -Raw -Path $file.FullName) -replace "image: .*", "image: $newName"
$string | Set-Content $file.FullName
Copy-Item -Recurse -Path source/* -Destination out/

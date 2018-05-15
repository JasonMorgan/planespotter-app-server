$file = Get-ChildItem -Path cluster-repo/Deployment/$ENV:DEPLOYMENT
$file
$newName = "$($ENV:IMAGE_NAME):$(Get-Content -Raw -Path source/metadata/tag)"
$newName
$string = (Get-Content -Raw -Path $file.FullName) -replace "image: .*", "image: $newName"
$string
$string | Set-Content $file.FullName
Copy-Item -Recurse -Path source/* -Destination out/
cat out/Deployment/$ENV:DEPLOYMENT

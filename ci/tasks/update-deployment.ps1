$file = Get-ChildItem -Path cluster-repo/Deployment/$ENV:DEPLOYMENT
$newName = "$($ENV:IMAGE_NAME):$(Get-Content -Raw -Path source/ci/metadata/tag)"
$string = (Get-Content -Raw -Path $file.FullName) -replace "image: .*", "image: $newName"
$string | Set-Content $file.FullName
Copy-Item -Recurse -Path cluster-repo/* -Destination out/
cd out
git add .
git commit -m "Updated via Concourse."

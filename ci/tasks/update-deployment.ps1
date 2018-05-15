$file = Get-ChildItem -Path cluster-repo/Deployment/$ENV:DEPLOYMENT
$file
$newName = "$($ENV:IMAGE_NAME):$(Get-Content -Raw -Path bump/ci/metadata/tag)"
$newName
$string = (Get-Content -Raw -Path $file.FullName) -replace "image: .*", "image: $newName"
$string
$string | Set-Content $file.FullName
Copy-Item -Recurse -Path cluster-repo/* -Destination out/
cd out
git add .
git commit -m "Updated via Concourse."
Get-ChildItem out
cat out/Deployment/$ENV:DEPLOYMENT

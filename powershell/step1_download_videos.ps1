# Create the videos directory
$videosDir = "./videos"
if (-not (Test-Path -Path $videosDir)) {
    New-Item -ItemType Directory -Path $videosDir
}

# Create the trainval directory inside videos
$trainvalDir = Join-Path $videosDir "trainval"
if (-not (Test-Path -Path $trainvalDir)) {
    New-Item -ItemType Directory -Path $trainvalDir
}

# Change to the trainval directory
Set-Location -Path $trainvalDir

# Download the trainval file
Invoke-WebRequest -Uri "https://s3.amazonaws.com/ava-dataset/trainval/_-Z6wFjXtGQ.mkv" -OutFile "_-Z6wFjXtGQ.mkv"

# Change to the videos directory
Set-Location -Path $videosDir

# Create the test directory inside videos
$testDir = Join-Path $videosDir "test"
if (-not (Test-Path -Path $testDir)) {
    New-Item -ItemType Directory -Path $testDir
}

# Change to the test directory
Set-Location -Path $testDir

# Download the test file
Invoke-WebRequest -Uri "https://s3.amazonaws.com/ava-dataset/test/--205wugM18.mkv" -OutFile "--205wugM18.mkv"

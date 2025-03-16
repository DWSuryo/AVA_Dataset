# Define directories
$annotationsDir = "./annotations"
$frameListsDir = "./frame_lists"

# Create directories if they don't exist
if (-not (Test-Path -Path $annotationsDir)) {
    New-Item -ItemType Directory -Path $annotationsDir
}
if (-not (Test-Path -Path $frameListsDir)) {
    New-Item -ItemType Directory -Path $frameListsDir
}

# Change directory to frame_lists
Set-Location -Path $frameListsDir

# Download frame list files
Invoke-WebRequest -Uri "https://dl.fbaipublicfiles.com/video-long-term-feature-banks/data/ava/frame_lists/train.csv" -OutFile "train.csv"
Invoke-WebRequest -Uri "https://dl.fbaipublicfiles.com/video-long-term-feature-banks/data/ava/frame_lists/val.csv" -OutFile "val.csv"

# Go back to the parent directory and then to annotations
Set-Location -Path ..
Set-Location -Path $annotationsDir

# Download annotation files
Invoke-WebRequest -Uri "https://dl.fbaipublicfiles.com/video-long-term-feature-banks/data/ava/annotations/ava_train_predicted_boxes.csv" -OutFile "ava_train_predicted_boxes.csv"
Invoke-WebRequest -Uri "https://dl.fbaipublicfiles.com/video-long-term-feature-banks/data/ava/annotations/ava_val_predicted_boxes.csv" -OutFile "ava_val_predicted_boxes.csv"
Invoke-WebRequest -Uri "https://dl.fbaipublicfiles.com/video-long-term-feature-banks/data/ava/annotations/ava_test_predicted_boxes.csv" -OutFile "ava_test_predicted_boxes.csv"

# Create and navigate to ava_v2.2 directory
$avaV22Dir = "ava_v2.2"
if (-not (Test-Path -Path $avaV22Dir)) {
    New-Item -ItemType Directory -Path $avaV22Dir
}
Set-Location -Path $avaV22Dir

# Download and unzip ava_v2.2.zip
Invoke-WebRequest -Uri "https://s3.amazonaws.com/ava-dataset/annotations/ava_v2.2.zip" -OutFile "ava_v2.2.zip"
Expand-Archive -Path "ava_v2.2.zip" -DestinationPath "."

# Go back to the annotations directory and then to ava_v2.1 directory
Set-Location -Path ..
$avaV21Dir = "ava_v2.1"
if (-not (Test-Path -Path $avaV21Dir)) {
    New-Item -ItemType Directory -Path $avaV21Dir
}
Set-Location -Path $avaV21Dir

# Download and unzip ava_v2.1.zip
Invoke-WebRequest -Uri "https://s3.amazonaws.com/ava-dataset/annotations/ava_v2.1.zip" -OutFile "ava_v2.1.zip"
Expand-Archive -Path "ava_v2.1.zip" -DestinationPath "."

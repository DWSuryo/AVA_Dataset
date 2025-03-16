# Define input and output directories
$IN_DATA_DIR = "./videos/trainval/"
$OUT_DATA_DIR = "./videos_15min"

# Create output directory if it doesn't exist
if (-not (Test-Path -Path $OUT_DATA_DIR)) {
    Write-Output "$OUT_DATA_DIR doesn't exist. Creating it."
    New-Item -ItemType Directory -Path $OUT_DATA_DIR
}

# Process each video in the input directory
Get-ChildItem -Path $IN_DATA_DIR -File | ForEach-Object {
    $video = $_.FullName
    $out_name = Join-Path $OUT_DATA_DIR $_.Name
    
    # If the output file does not exist, process the video
    if (-not (Test-Path -Path $out_name)) {
        ffmpeg -ss 900 -t 901 -i $video -strict -2 $out_name
    }
}

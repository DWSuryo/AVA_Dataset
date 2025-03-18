# Define input and output directories
$IN_DATA_DIR = "./videos_15min"
$OUT_DATA_DIR = "./frames"

# Create output directory if it doesn't exist
if (-not (Test-Path -Path $OUT_DATA_DIR)) {
    Write-Output "$OUT_DATA_DIR doesn't exist. Creating it."
    New-Item -ItemType Directory -Path $OUT_DATA_DIR
}

# Process each video in the input directory
Get-ChildItem -Path $IN_DATA_DIR -File | ForEach-Object {
    $video = $_.FullName
    $video_name = $_.Name

    # Remove file extension
    if ($video_name -like "*.webm") {
        $video_name = $video_name.Substring(0, $video_name.Length - 5)
    } else {
        $video_name = $video_name.Substring(0, $video_name.Length - 4)
    }

    $out_video_dir = Join-Path $OUT_DATA_DIR $video_name
    New-Item -ItemType Directory -Path $out_video_dir -Force

    $out_name = Join-Path $out_video_dir "$video_name""_%06d.jpg"

    # Process video with ffmpeg
    ffmpeg -i $video -r 30 -q:v 1 $out_name
}

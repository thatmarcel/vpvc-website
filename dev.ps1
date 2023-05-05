while (1) {
    if (Test-Path .\dist) { Remove-Item -Force -Recurse .\dist\* }
    Copy-Item .\src\* -Destination .\dist -Recurse
    cd src
    tailwindcss -i .\input.css -o ..\dist\generated.css
    cd ..

    $LastWriteTime = (Get-Item .\src\index.html).LastWriteTime

    while ((Get-Item .\src\index.html).LastWriteTime -eq $LastWriteTime) {
        sleep 1
    }

    echo "Observed changes, applying..."
}
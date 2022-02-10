$ReceivedDmarcFolder = 'C:\Users\munka\OneDrive - Block Solutions Ltd\Internal\DMARC'
$InboundDmarcFolder = 'C:\Users\munka\OneDrive\GitHub\Personal\dmarc-visualizer\files'

$ReceivedDmarcFiles = Get-ChildItem $ReceivedDmarcFolder

if ($ReceivedDmarcFiles.Count -gt 0){
    $ReceivedDmarcFiles | Move-Item -Destination $InboundDmarcFolder
    docker start dmarc-visualizer_parsedmarc_1
    $status = docker wait dmarc-visualizer_parsedmarc_1
    if ($status -eq 0){
        Get-ChildItem $InboundDmarcFolder | Remove-Item -Force
    }
}


param(
    [string]$TextFile,
    [string]$OutputFile
)

Add-Type -AssemblyName System.Speech

$text = Get-Content -Path $TextFile -Raw

$synth = New-Object System.Speech.Synthesis.SpeechSynthesizer

$synth.Rate = 0
$synth.Volume = 100

$synth.SetOutputToWaveFile($OutputFile)

$synth.Speak($text)

$synth.SetOutputToNull()

$synth.Dispose()

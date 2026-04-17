$ErrorActionPreference = 'Stop'

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Resolve-Path (Join-Path $scriptRoot '..')
$renderCv = Join-Path $repoRoot '.venv\Scripts\rendercv.exe'

if (-not (Test-Path $renderCv)) {
  throw 'RenderCV executable not found. Expected .venv\\Scripts\\rendercv.exe in the repository root.'
}

$OutputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

Push-Location $repoRoot
try {
  & $renderCv render _data/cv.yml --settings assets/rendercv/settings.yaml --output-folder assets/rendercv/rendercv_output
}
finally {
  Pop-Location
}
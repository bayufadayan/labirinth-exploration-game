<#
activate_venv.ps1 — activate venv named "activate"
Dot-source this script to activate in the current PowerShell session:
  . .\activate_venv.ps1
#>

Write-Host "(Tip: dot-source this script to activate in the current session:)" -ForegroundColor Yellow
Write-Host ". .\activate_venv.ps1" -ForegroundColor Cyan

$paths = @(
  ".\activate\Scripts\Activate.ps1",
  ".\.venv\Scripts\Activate.ps1",
  ".\venv\Scripts\Activate.ps1",
  ".\env\Scripts\Activate.ps1"
)

foreach ($p in $paths) {
  if (Test-Path $p) {
    . $p
    Write-Host "Activated virtualenv: $p"
    return
  }
}

$ans = Read-Host "No virtualenv 'activate' found. Create a new venv named 'activate' now? [Y/n]"
if ($ans -eq '') { $ans = 'Y' }
if ($ans -match '^[Yy]') {
  if (Get-Command python -ErrorAction SilentlyContinue) {
    python -m venv activate
  } elseif (Get-Command python3 -ErrorAction SilentlyContinue) {
    python3 -m venv activate
  } else {
    Write-Error "No Python found. Install Python first."
    return
  }

  if (Test-Path ".\activate\Scripts\Activate.ps1") {
    . ".\activate\Scripts\Activate.ps1"
    Write-Host "Created and activated './activate'."
    return
  } else {
    Write-Error "Created venv but could not find activation script."
    return
  }
} else {
  Write-Host "Aborted. To create a venv manually run: python -m venv activate"
  return
}

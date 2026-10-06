# Assembler Script: Merges all parts and validates 100% uniqueness
$ErrorActionPreference = 'Stop'

Write-Host "--- Assembling Sprint MCQ Bank (750 Questions) ---" -ForegroundColor Cyan

$global:AllQuestions = [System.Collections.Specialized.OrderedDictionary]::new()

function Add-Q($day, $num, $diff, $q, $o0, $o1, $o2, $o3, $ans, $exp) {
    $dStr = [string]$day
    if (-not $global:AllQuestions.Contains($dStr)) {
        $global:AllQuestions[$dStr] = [System.Collections.ArrayList]@()
    }
    $obj = [PSCustomObject]@{
        id = "d${day}_q${num}"
        diff = $diff
        q = $q
        opts = @($o0, $o1, $o2, $o3)
        ans = [int]$ans
        exp = $exp
    }
    [void]$global:AllQuestions[$dStr].Add($obj)
}

$scriptDir = $PSScriptRoot
. "$scriptDir\gen_part1.ps1"
. "$scriptDir\gen_day5_to_10.ps1"
. "$scriptDir\gen_day7_to_10.ps1"
. "$scriptDir\gen_days11_to_15.ps1"
. "$scriptDir\gen_days14_to_17.ps1"
. "$scriptDir\gen_days18_to_20.ps1"
. "$scriptDir\gen_days21_to_25.ps1"
. "$scriptDir\gen_days23_to_25.ps1"
. "$scriptDir\gen_days26_to_30.ps1"

Write-Host "Total Days Loaded: $($global:AllQuestions.Count)" -ForegroundColor Green

# Validation
$totalQuestions = 0
$allQuestionTexts = [System.Collections.Generic.HashSet[string]]::new()
$duplicateCount = 0

for ($d = 1; $d -le 30; $d++) {
    $dStr = [string]$d
    if (-not $global:AllQuestions.Contains($dStr)) {
        Write-Error "Missing Day $d!"
    }
    $dayList = $global:AllQuestions[$dStr]
    $qCount = $dayList.Count
    $totalQuestions += $qCount
    if ($qCount -ne 25) {
        Write-Warning "Day $d has $qCount questions instead of 25!"
    }

    foreach ($item in $dayList) {
        if ($allQuestionTexts.Contains($item.q)) {
            Write-Warning "Duplicate question detected: $($item.q)"
            $duplicateCount++
        } else {
            [void]$allQuestionTexts.Add($item.q)
        }

        if ($item.opts.Count -ne 4) {
            Write-Error "Question $($item.id) has $($item.opts.Count) options instead of 4!"
        }
        if ($item.ans -lt 0 -or $item.ans -gt 3) {
            Write-Error "Question $($item.id) has invalid answer index $($item.ans)!"
        }
        if ([string]::IsNullOrWhiteSpace($item.exp)) {
            Write-Error "Question $($item.id) is missing an explanation!"
        }
    }
}

Write-Host "Total Questions: $totalQuestions" -ForegroundColor Green
Write-Host "Unique Questions: $($allQuestionTexts.Count)" -ForegroundColor Green
$statusColor = if ($duplicateCount -eq 0) { 'Green' } else { 'Red' }
Write-Host "Duplicate Count: $duplicateCount" -ForegroundColor $statusColor

if ($duplicateCount -gt 0) {
    Write-Error "Found duplicates! Aborting."
}

# Output to PlaceEdge/js/sprint_mcqs.js
$targetPath = Join-Path (Split-Path $scriptDir -Parent) "js\sprint_mcqs.js"
$json = $global:AllQuestions | ConvertTo-Json -Depth 5 -Compress
$finalContent = "/* 750 Unique Placement Interview MCQs (25 Distinct Questions Per Day, Zero Repetition) */`nconst SPRINT_MCQ_BANK = " + $json + ";`n"

[System.IO.File]::WriteAllText($targetPath, $finalContent, [System.Text.Encoding]::UTF8)
Write-Host "Successfully generated: $targetPath" -ForegroundColor Green
Write-Host "File size: $((Get-Item $targetPath).Length) bytes" -ForegroundColor Cyan

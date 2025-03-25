# Define the list of repositories
$repos = @(
    "", # Define repositories here add under the , for more than one repo
)

# Define the limit for the number of runs to fetch
$runLimit = 100

# Iterate over each repository
foreach ($repoName in $repos) {
    Write-Host "Fetching the list of workflow runs for repository: $repoName..." -ForegroundColor Cyan
    
    # Fetch the list of workflow runs (with limit) from the GitHub repository
    try {
        $workflowRuns = gh run list --repo $repoName --limit $runLimit --json databaseId | ConvertFrom-Json
        Write-Host "Total workflow runs found: $($workflowRuns.Count)" -ForegroundColor Green
        
        # Iterate over each workflow run to delete it
        foreach ($run in $workflowRuns) {
            $runId = $run.databaseId
            Write-Host "Checking for workflow run with ID: $runId..." -ForegroundColor Yellow
            
            # Try deleting the workflow run and log success/failure
            try {
                Write-Host "Deleting workflow run with ID: $runId..." -ForegroundColor Yellow
                gh run delete "$runId" --repo $repoName
                Write-Host "Successfully deleted workflow run with ID: $runId." -ForegroundColor Green
            } catch {
                Write-Host "Error deleting workflow run with ID: $runId. Error: $_" -ForegroundColor Red
            }
        }
    } catch {
        Write-Host "Error fetching workflow runs for $repoName. Error: $_" -ForegroundColor Red
    }
}

Write-Host "`nWorkflow run deletion process complete for all repositories." -ForegroundColor Magenta
Write-Host "Press any key to exit..." -ForegroundColor Magenta
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null

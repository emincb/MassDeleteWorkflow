# MassDeleteWorkflow
Github Workflow Cleaner
# GitHub Workflow Run Cleanup Script

## Overview
A PowerShell script designed to automatically delete workflow runs across multiple GitHub repositories. This utility helps manage and clean up GitHub Actions workflow run history, reducing clutter and optimizing repository maintenance.

## Features
- Bulk delete workflow runs across multiple repositories
- Configurable run limit
- Detailed logging with color-coded output
- Error handling for robust execution

## Prerequisites
- GitHub CLI (`gh`) installed
- Authentication to GitHub CLI
- Appropriate permissions on target repositories

## Usage
1. Configure the list of repositories in the script
2. Set the desired workflow run limit
3. Run the script to automatically delete workflow runs

## Caution
- Deleted workflow runs cannot be recovered
- Ensure you have the necessary permissions before running
- Review and modify the repository list carefully

## Performance
- Efficiently processes multiple repositories
- Provides real-time feedback on deletion process

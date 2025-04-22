Write-Host "----------"
Write-Host " "
Write-Host "Welcome to User/OU Management"
Write-Host "There are several scripts available that can be run."
Write-Host "Provided are the file names, params, and a brief description of their use."
Write-Host " "


Write-Host "----------"
Write-Host "Script: add_ou.ps1"
Write-Host "Expected Params: [string] path, [string] dc"
Write-Host "Description: Adds a new OU to the AD with the specified path and Domain Controller."

Write-Host "----------"
Write-Host "Script: add_user.ps1"
Write-Host "Expected Params: [string] name, [string] path, [string] dc"
Write-Host "Description: Adds a new User to the AD with the specified name, OU delegation and Domain Controller."

Write-Host "----------"
Write-Host "Script: add_user_ou.ps1"
Write-Host "Expected Params: [string] name, [string] path, [string] dc"
Write-Host "Description: Adds a new User and OU to the AD. Assigns the new User to the newly created OU."

Write-Host "----------"
Write-Host "Script: help_user_management.ps1"
Write-Host "Expected Params: None"
Write-Host "Description: Gives a list of all available scripts to use. What you're reading now!"

Write-Host "----------"
Write-Host "Script: list_user_ou.ps1"
Write-Host "Expected Params: None"
Write-Host "Description: Lists all named Users and OUs in the AD."

Write-Host "----------"
Write-Host "Script: move_user.ps1"
Write-Host "Expected Params: [string] name, [string] oldPath, [string] newPath, [string] dc"
Write-Host "Description: Moves the specified user from it's original OU to a new OU."

Write-Host "----------"
Write-Host "Script: remove_ou.ps1"
Write-Host "Expected Params: [string] path, [string] dc"
Write-Host "Description: Removes the specified OU with the specified path and Domain Controller."

Write-Host "----------"
Write-Host "Script: remove_user.ps1"
Write-Host "Expected Params: [string] name"
Write-Host "Description: Removes the specified User from the AD."

Write-Host "----------"
Write-Host "Script: remove_user_ou.ps1"
Write-Host "Expected Params: [string] name, [string] path, [string] dc"
Write-Host "Description: Removes both the specified User AND OU from the AD. Both will be deleted using this script."
Write-Host "----------"

Write-Host "-END OF LIST-"
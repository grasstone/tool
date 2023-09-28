@echo off
setlocal enabledelayedexpansion

set "csvFile=repoinfo.csv"
set "token=token"
set "githubServer=https://gitserver/api/v3/repos/CIMS"
set "proxyServer=proxy





for /F "usebackq tokens=1,2 delims=," %%A in ("%csvFile%") do (
    set "repoName=%%A"
    set "topicName=%%B"
    
    curl -L -X PUT -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %token%" -H "X-GitHub-Api-Version: 2022-11-28" "%githubServer%/!repoName!/topics" -d "{\"names\":[\"!topicName!\"]}" --proxy %proxyServer%
)

endlocal
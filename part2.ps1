Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -OutFile "firefox_installer.exe"
Start-Process -FilePath "firefox_installer.exe" -ArgumentList "/S" -Wait

$firefoxPath = (Get-ChildItem -Path "$Env:ProgramFiles\Mozilla Firefox" -Directory).FullName

$firefoxDriverPath = "$firefoxPath\geckodriver.exe"
$driver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver($firefoxDriverPath)

$websites = @(
    "https://www.google.com",
    "https://www.youtube.com",
    "https://www.facebook.com",
    "https://www.amazon.com",
    "https://www.wikipedia.org",
    "https://www.twitter.com",
    "https://www.instagram.com",
    "https://www.github.com",
    "https://www.linkedin.com",
    "https://www.netflix.com"
)

foreach ($website in $websites) {
    $driver.Navigate().GoToUrl($website)
    Write-Host "Opened: $website"
}


$driver.Quit()

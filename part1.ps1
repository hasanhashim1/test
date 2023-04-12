Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "chrome_installer.exe"
Start-Process -FilePath "chrome_installer.exe" -ArgumentList "/silent /install" -Wait

$chromePath = (Get-ChildItem -Path "$Env:ProgramFiles(x86)\Google\Chrome\Application" -Directory).FullName

$chromeDriverPath = "$chromePath\chromedriver.exe"
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($chromeDriverPath)

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

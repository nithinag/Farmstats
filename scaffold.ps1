$baseDir = "d:\PROJECTS\FARMSTATS"

$rootDirs = "android", "ios", "linux", "macos", "windows", "web", "assets", "test", "integration_test", "tool", "scripts"
foreach ($dir in $rootDirs) {
    New-Item -ItemType Directory -Force -Path "$baseDir\$dir" | Out-Null
    Set-Content -Path "$baseDir\$dir\README.md" -Value "<!-- Placeholder for $dir specific files -->"
}

$libDirs = @{
    "lib\app" = "/// Entry point and root application widgets.";
    "lib\config" = "/// Environment configurations and global settings.";
    "lib\core" = "/// Foundation of the app: constants, errors, network, theme, and pure utils.";
    "lib\shared" = "/// Reusable cross-feature widgets and extensions.";
    "lib\data" = "/// Global data layer implementations (e.g., secure storage).";
    "lib\database" = "/// Local SQLite database using Drift: Tables, DAOs, and Migrations."
}

foreach ($key in $libDirs.Keys) {
    New-Item -ItemType Directory -Force -Path "$baseDir\$key" | Out-Null
    Set-Content -Path "$baseDir\$key\placeholder.dart" -Value $libDirs[$key]
}

$features = "dashboard", "expenses", "income", "inventory", "batch", "labour", "reports", "analytics", "backup", "settings"
$layers = @{
    "presentation" = "UI screens, local widgets, and Riverpod UI controllers.";
    "application" = "Riverpod Notifiers, Use Cases, and State definitions.";
    "domain" = "Pure business logic, Entities, and Repository Interfaces.";
    "data" = "DTOs and Repository Implementations specific to this feature."
}

foreach ($feature in $features) {
    foreach ($key in $layers.Keys) {
        $path = "$baseDir\lib\features\$feature\$key"
        New-Item -ItemType Directory -Force -Path $path | Out-Null
        $desc = $layers[$key]
        Set-Content -Path "$path\placeholder.dart" -Value "/// Placeholder for $feature feature - $key layer.`n/// Purpose: $desc"
    }
}

Set-Content -Path "$baseDir\README.md" -Value "# FARMSTATS`nOffline-First Smart Sericulture Farm Management System."
Set-Content -Path "$baseDir\pubspec.yaml" -Value "name: farmstats`ndescription: FarmOS - Sericulture Farm Management System.`npublish_to: 'none'`nversion: 1.0.0+1`nenvironment:`n  sdk: '>=3.0.0 <4.0.0'`ndependencies:`n  flutter:`n    sdk: flutter"
Set-Content -Path "$baseDir\analysis_options.yaml" -Value "include: package:flutter_lints/flutter.yaml"
Set-Content -Path "$baseDir\.gitignore" -Value "# Flutter/Dart/Pub`n.dart_tool/`n.packages`nbuild/`n.flutter-plugins`n.flutter-plugins-dependencies`n.pub-cache/`n.pub/`n/android/app/src/main/java/"
Set-Content -Path "$baseDir\CHANGELOG.md" -Value "# Changelog`n`n## [1.0.0] - Initial Scaffold"
Set-Content -Path "$baseDir\LICENSE" -Value "MIT License (Placeholder)"

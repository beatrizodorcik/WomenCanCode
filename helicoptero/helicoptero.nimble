# Package

version = "0.1.0"
author = "Your Name"
description = "helicoptero"
license = "?"

# Deps
requires "nim >= 1.2.0"
requires "nico >= 0.2.5"

srcDir = "src"

task runr, "Runs helicoptero for current platform":
 exec "nim c -r -d:release -o:helicoptero src/main.nim"

task rund, "Runs debug helicoptero for current platform":
 exec "nim c -r -d:debug -o:helicoptero src/main.nim"

task release, "Builds helicoptero for current platform":
 exec "nim c -d:release -o:helicoptero src/main.nim"

task debug, "Builds debug helicoptero for current platform":
 exec "nim c -d:debug -o:helicoptero_debug src/main.nim"

task web, "Builds helicoptero for current web":
 exec "nim js -d:release -o:helicoptero.js src/main.nim"

task webd, "Builds debug helicoptero for current web":
 exec "nim js -d:debug -o:helicoptero.js src/main.nim"

task deps, "Downloads dependencies":
 exec "curl https://www.libsdl.org/release/SDL2-2.0.12-win32-x64.zip -o SDL2_x64.zip"
 exec "unzip SDL2_x64.zip"
 #exec "curl https://www.libsdl.org/release/SDL2-2.0.12-win32-x86.zip -o SDL2_x86.zip"

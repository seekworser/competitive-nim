# Package
version       = "0.1.0"
author        = "seekworser"
description   = "Library for competitive programing language"
license       = "CC0"
srcDir        = "src"
# skipDirs      = @["verify", ".verify-helper"]
skipFiles = @["lib"]

backend       = "cpp"

# Dependencies
requires "nim >= 1.0.0"

# after install:
#     if defined(linux):
#         exec("ln -s ./atcoder/extra lib")

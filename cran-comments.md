## Resubmission

This is a resubmission of bluebike v0.0.1 that fixes:

## Test environments
- local macOS install, R 4.1.3
- win-builder (release, devel, oldrelease)
- GitHub Actions
  - ubuntu-latest
- Rhub via devtools::check_rhub(env_vars=c(R_COMPILE_AND_INSTALL_PACKAGES = "always"))

## R CMD check results

❯ checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Ziyue Yang <zyang2k@gmail.com>'
  
  New submission

❯ checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'

0 errors ✔ | 0 warnings ✔ | 2 notes ✖

## Resubmission

This is a resubmission of bluebike v0.0.2 that fixes:
  please unwrap the examples if they are executable in < 5 sec, or replace 
\dontrun{} with \donttest{}.

## Test environments
- local macOS install, R 4.1.3
- win-builder (release, devel, oldrelease)
- GitHub Actions
  - ubuntu-latest
- Rhub via devtools::check_rhub(env_vars=c(R_COMPILE_AND_INSTALL_PACKAGES = "always"))

## R CMD check results

* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Ziyue Yang <zyang2k@gmail.com>’

New submission

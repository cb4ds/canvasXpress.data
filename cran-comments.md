## Comments from Maintainer

**resubmission comments**

Per request for better information on the dataset(s) in this package: 

Updated attribution and informaton for the dataset GSE9750, and created a more reusable preparation script.  
Second dataset exData was removed until it can be sourced publicly and documented.

**initial comments**

This is a new package - it is a split off of the data from the canvasXpress R package, as that package reached the 5MB limit as of the latest release (1.25.6).  

The version number matches the version of the canvasXpress R package as of the data split so starts at a larger version than perhaps expected.  Versions as of 1.26.7 of the canvasXpress package will depend on this package.  That package is being prepared and tested for this update but will require that this package is in CRAN prior to submission of the next version.

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.4.4  
* R 3.5.3  
* R 3.6.2

Travis-CI (ubuntu 16.04.6)

* R 3.5.3
* R 3.6.2
* R devel (2020-01-20 r77680)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release()  
* devtools::check_win_oldrelease()  


RHub

* devtools::check_rhub()

---  
    
## R CMD check results
    
    
```
devtools::check()  

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

---  
    
## Reverse dependencies
    
    
**NONE**
    
```
pdb <- available.packages()
tools::package_dependencies(packages = c('canvasxpress.data'),
                            db = pdb, reverse = TRUE)

$canvasXpress.data 
NULL
```

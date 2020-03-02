## Comments from Maintainer

This is a new package - it is a split off of the data from the canvasXpress R package, as that package reached the 5MB limit as of the latest release (1.25.6).  

The version number matches the version of the canvasXpress R package as of the data split so starts at a larger version than perhaps expected.  Versions as of 1.27.1+ of the canvasXpress package will depend on this package.  That package is being prepared and tested for this update but will require that this package is in CRAN prior to submission of the next version.

Per review request for better information on the dataset(s) in this package in previous reviews I have updated attribution and informaton for the dataset GSE9750, and created a more reusable preparation script.  In addition the second dataset exData was removed until it can be sourced publicly and documented.

Per review request I have fixed the README.md links (our website was literally just revamped 2 days ago!).  Thanks for pointing that out!  I have incremented the package with the notation in the third version component adding -1 to designate that this minor bugfix was made, however I did not increment the base 3rd component of the version as it will become out of sync with the canvasXpress package that it is paired with.

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.4.4  
* R 3.5.3  
* R 3.6.2

Travis-CI (ubuntu 16.04.6)

* R 3.5.3
* R 3.6.2
* R devel (2020-03-02 r77886)

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

Note: The canvasXpress package will suggest the use of this package
    
```
pdb <- available.packages()
tools::package_dependencies(packages = c('canvasxpress.data'),
                            db = pdb, reverse = TRUE)

$canvasXpress.data 
NULL
```

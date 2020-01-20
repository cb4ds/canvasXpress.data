## Comments from Maintainer

This is a new package - it is a split off of the data from the canvasXpress R package, as that package reached the 5MB limit as of the latest release (1.25.6).  

The version number matches the version of the canvasXpress R package as of the data split so starts at a larger version than perhaps expected.  

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.4.4  
* R 3.5.3  
* R 3.6.2

Travis-CI (ubuntu 16.04.6)

* R 3.5.3
* R 3.6.1
* R devel (2019-12-18 r77599)

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
tools::package_dependencies(packages = c('periscope'),
                            db = pdb, reverse = TRUE)

$canvasXpress  
character(0)  
```

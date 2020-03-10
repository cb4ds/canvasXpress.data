## Comments from Maintainer

This is a new package - it is a split off of the data from the canvasXpress R package, as that package reached the 5MB limit as of the latest release (1.25.6).  

The version number matches the version of the canvasXpress R package as of the data split so starts at a larger version than perhaps expected.  After this package's approval the canvasXpress package will be updated to suggest this package and depend on the datasets for the shiny examples as well as the automated testthat tests.

Per review requests the following changes have been made:  

* better information on the dataset(s) in this package in previous reviews:  I have updated attribution and informaton for the dataset GSE9750, and created a more reusable data preparation script.
* reference the DOI links in the DESCRIPTION file's description section
* fix the README.md links and differentiate the original and cleaned datasets

Note on dataset output format: the GSE9750 data set is being used to showcase taking this type of raw data, which is in a very difficult (but common!) format and making it ready for visualization in canvasXpress.  canvasXpress is built for visualizing genomics data like this, but takes a very specific set of distinct data components (x, y, and z in the cleaned dataset format) that correspond to the primary data (gene expression, numeric, usually very large), metadata about the samples (in this case cells), and metadata about the genes.  I've updated the descriptions and references on the datasets to explain the manipulations made to the dataset for the GSE9750_cleaned format and also added the original, undoctored data so that users can easily get the data and make comparisons, etc should they want to.  Since this is being used in an example shiny application in the canvasXpress data package for this purpose the cleaned dataset is purposely being formatted this way and is in list format as it does not make sense to separate the three parts of the list.  I hope that making the original dataset available helps alleviate concerns about the 3-component list format for the cleaned dataset.

The package does have a NOTE on size, it is 7mb.  This is unavoidable due to the size of the data we are using and is the primary reason it was split off of the htmlwidget canvasXpress package.

Thanks again for your consideration.

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.4.4  
* R 3.5.3  
* R 3.6.2

Travis-CI (ubuntu 16.04.6)

* R 3.5.3
* R 3.6.2
* R devel (2020-03-06 r77913)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release()  
* devtools::check_win_oldrelease()  


RHub

* devtools::check_rhub(interactive = F)

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

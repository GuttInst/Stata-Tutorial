* Program:  Stata Tutorial Preliminary Data Transformation
* Project:  Stata Tutorial
* Program task: 

	/* Purpose: Import the CCC dataset, recode one variable, decode one variable, 
		   and save a new version of the CCC dataset.
				
		   This code transforms the dataset to prepare for the Stata tutorial. 
		   The code might not make sense now but we will cover all of these 
		   concepts in the tutorial!
	
	*/

use "../Data/37067-0001-Data.dta", clear
	       
gen     LASTSEX1 = .
replace LASTSEX1=1 if LASTSEX == 1
replace LASTSEX1=2 if LASTSEX == 2
replace LASTSEX1=.a if LASTSEX == 3 | LASTSEX == 4
label define LASTSEX1 1 "Less than six months ago" 2 "More than six months ago" .a "Don't know"
label values LASTSEX1 LASTSEX1 

decode INTVLANG, gen(INTVLANG1)

save "../Data/CCC_Messy.dta", replace
	
* Date Created: 2023-07-14
* Written by: AM
		
* System set-up
	clear all                                // clear everything in memory
	capture log close                        // close any open log files
	set more off                             // allow program to scroll freely
 
* Set linesize.
	set linesize 90
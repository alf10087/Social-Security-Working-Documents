# Social-Security-Working-Documents
Working files for research project on the regressivity of U.S. Social Security.
Format: Stata
Created by: alf10087

Filename | What it does 
---|---------
Adjust to Inflation | Quick script to adjust any column of USD amounts into 2003 USD.
IRR | Once I have all the data cleaned, I estimate the IRR for Social Security, in order to measure its regressivity
Median IRR | Same IRR as in the previous script, but dividing each value over its median, to get a centered result
Merges and Probabilities | Merge the probabilities of surviving per each year, using U.S. mortality rates
Merges, Probabilities and Expected | Same as the previous file, but also adding the life expectancy of each person
SS Master | Master file that loads the required data sets from the U.S. Labor Department

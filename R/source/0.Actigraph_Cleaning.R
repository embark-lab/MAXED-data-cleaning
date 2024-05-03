library(GGIR)

# list the folders starting with 'MAXED_ in the data/Actigraph folder
folders <- list.files("data/Actigraph", pattern = "MAXED_", full.names = TRUE)
#make a folder called 'RAW' in the data/Actigraph folder
dir.create("data/Actigraph/RAW", showWarnings = FALSE)

serials <- c('MOS2E05200619', 'MOS2E05200220', 'MOS2E05200258', 'MOS2E05200280', 'MOS2E05200692')

# in each of the folders, check if the serial number is in any of the file names. if so, replace it with the name of the folder
for (folder in folders){
  files <- list.files(folder, full.names = TRUE)
  for (file in files){
    for (serial in serials){
      if (grepl(serial, file)){
        file.rename(file, gsub(serial, basename(folder), file))
      }
    }
  }
}

# for each of the maxed folders, copy the files ending in RAW.csv to the RAW folder
for (folder in folders){
  files <- list.files(folder, pattern = "RAW.csv", full.names = TRUE)
  for (file in files){
    file.copy(file, "data/Actigraph/RAW")
  }
}

g.shell.GGIR(
  mode = c(1,2,3,4,5), #run GGIR 
  datadir = "data/Actigraph/RAW", 
  outputdir ="data/Actigraph/GGIR_output",
  do.report = c(2,5), #include report for parts 2 and 5
  do.enmo = TRUE, #calculate ENMO
  acc.metric = 'ENMO', #use ENMO for GGIR
  
  #=================
  # Part 2
  #+=================
  strategy = 1, #GGIR default strategy 
  #Value = 1 means select data based on hrs.del.start, hrs.del.end, and maxdur
  #Decided on strategy 1 for default 5/5/2021 KS, DP, RA. Allows for us to pre-emptively set acceleromter initialization time when giving out accelerometer. Assumption of 0 hrs needed to be deleted. Can adjust in this step if necessary/aberrant data.
  mvpathreshold = c(100.6), #MVPA threshold
  hrs.del.start = 0, #GGIR default hours to delete at the beginning of a file
  hrs.del.end = 0, #GGIR default hours to delete at the end of a file
  maxdur = 10, #max number of days 
  bout.metric = 4, #metric for calculating bouts. using recommended default of 4 per GGIR manual
  excludefirstlast = FALSE, #do not exclude first and last days from recording
  
  #==============
  # part 3+4
  #==============
# not running sleep analysis  
  #=================
  #Part 5
  #=================
  threshold.lig = 44.8, 
  threshold.mod = 100.6, 
  threshold.vig = 428.8,
  
  #light, mod, vig thresholds: 40, 100, 400 - default
  #light, mod, vig thresholds: 44.8, 100.6, 428.8 - Hildebrandt
  
  overwrite = TRUE, #overwrite previous files
  desiredtz = "America/Chicago", #time zone
  includedaycrit = 10, #10 hours of valid data per day is acceptable.
  #PMC3543867 - Consesus in literature around 10h/day
  #PMC3457743 - >12h/day can negatively affect sample size
  # Decisioned KS, DP, RA 5/5/2021
  
  #bout duration below. All are set to defaults currently: 
  boutdur.mvpa = c(1,5,10), boutdur.in = c(10,20,30), boutdur.lig = c(1,5,10),
  
  #add citations
  
  #bout criteria is a number between 0 and 1 and defines what fraction of a bout needs to be above mvpa threshold for it to count as a bout. Default is 0.8. Can influence findings: https://doi.org/10.1016/j.gaitpost.2020.06.032
  boutcriter = 0.8, 
  boutcriter.in = 0.9, 
  boutcriter.lig = 0.8, 
  boutcriter.mvpa = 0.8,
  
  #================
  #Visual Report
  #=================
  timewindow = ("MM"),
  visualreport = TRUE) 

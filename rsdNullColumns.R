CDCcovidData <- readRDS("COVIDsurveillancedata.RDS")
CDCcovidData$cdc_report_dt = NULL
CDCcovidData$onset_dt = NULL
CDCcovidData$current_status = NULL
CDCcovidData$hosp_yn = NULL
CDCcovidData$icu_yn = NULL
CDCcovidData$medcond_yn = NULL
saveRDS(CDCcovidData, "COVIDsurveillancedata.RDS")

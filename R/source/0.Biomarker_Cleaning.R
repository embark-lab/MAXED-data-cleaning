library(rio)
library(stringr)
library(dplyr)
Assays_1 <- import_list('data/Assays/20230725_FINAL_Embark_MSD_17139.xlsx')
Assays_2 <- import_list('data/Assays/20230601_Schaumberg_Multisteroid_17139.xlsx')

Assay_1_results <- Assays_1$Results |> 
  select( Sample, 
         `Date of Collection`, 
         `BDNF (pg/mL)`, 
         `Leptin (pg/mL)`)

Assay_2_results <-Assays_2$DATA |> 
  select(Sample, 
         `Date of Collection`, 
         `Cortisol (ng/mL)`,
         `Estradiol (ng/mL)`)

# use stringr to split Sample column into 'ID', 'Sample Number', 'Day', 'Time'
Assay_1 <- Assay_1_results |> 
  mutate(
    # ID = MAXED_####, Sample Number = S#, Day = Day#, Time = Pre/Post
    ID = str_extract(Sample, 'MAXED_10[0-9][0-9]'),
    Sample_Number_BDNF_Leptin = str_extract(Sample, 'S[0-9]'),
    Day = str_extract(Sample, 'Day[A/B]'),
    Time = str_extract(Sample, 'Pre|Post')) |> 
  select(-Sample)

Assay_2 <- Assay_2_results |> 
  mutate(
    # ID = MAXED_####, Sample Number = S#, Day = Day#, Time = Pre/Post
    ID = str_extract(Sample, 'MAXED_10[0-9][0-9]'),
    Sample_Number_Cortisol_Estradiol = str_extract(Sample, 'S[0-9]'),
    Day = str_extract(Sample, 'Day[A/B]'),
    Time = str_extract(Sample, 'Pre|Post')) |> 
    # remove Sample column
    select(-Sample) |> 
  # filter Sample_Number = S1
  filter(Sample_Number_Cortisol_Estradiol == 'S1')

# join Assay_1 and Assay_2
Assay_results <- full_join(Assay_1, Assay_2, by = c('ID', 'Day', 'Time'))


Assay_results <- Assay_results |>
  select(ID, Sample_Number_BDNF_Leptin, Sample_Number_Cortisol_Estradiol, Day, Time, `BDNF (pg/mL)`, `Leptin (pg/mL)`, `Cortisol (ng/mL)`, `Estradiol (ng/mL)`)

Assay_results$Condition <- recode(Assay_results$Day, 'DayA' = 'Rest', 'DayB' = 'Exercise')

# load group data to merge with Assay_results
load('data/RedCap/groups.RData')
groups$ID = as.character(groups$id)
Assay_results <- left_join(Assay_results, groups, by = 'ID')

# Clean columns
Assay_results <- Assay_results |> 
  select(ID, 
         group, 
         group_factor, 
         Time, 
         Condition, 
         `BDNF (pg/mL)`, 
         `Leptin (pg/mL)`, 
         `Cortisol (ng/mL)`, 
         `Estradiol (ng/mL)`) |> 
  rename(BDNF = `BDNF (pg/mL)`, 
            Leptin = `Leptin (pg/mL)`, 
            Cortisol = `Cortisol (ng/mL)`,
            Estradiol = `Estradiol (ng/mL)` ) |> 
  mutate(across(c(BDNF, Leptin, Cortisol, Estradiol), ~ as.numeric(.))) 

# KS note - need to verify dates as some of them are not matching btw samples?

save(Assay_results, file = 'data/Assays/Assay_results.RData')


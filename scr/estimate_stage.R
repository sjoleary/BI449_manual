# C. brevipinna, Carlson & Baremore 2005

C.brevipinna_YOY <- filter(elasmos, Species=="Carcharhinus_brevipinna" & Sex=="M" & FL<=812 | Species=="Carcharhinus_brevipinna" & Sex=="F" & FL<=844 | Species=="Carcharhinus_brevipinna" & Sex=="U" & FL<=844) %>%
  mutate(Estimated_Stage="YOY")

C.brevipinna_JUV <- filter(elasmos, Species=="Carcharhinus_brevipinna" & Sex=="M" & FL>812 & FL<=1380 | Species=="Carcharhinus_brevipinna" & Sex=="F" & FL>844 & FL<=1360 | Species=="Carcharhinus_brevipinna" & Sex=="U" & FL>844 & FL<=1360) %>%
  mutate(Estimated_Stage="JUV")

C.brevipinna_MAT <- filter(elasmos, Species=="Carcharhinus_brevipinna" & Sex=="M" & FL>1380 | Species=="Carcharhinus_brevipinna" & Sex=="F" & FL>1360 | Species=="Carcharhinus_brevipinna" & Sex=="U" & FL>1360) %>%
  mutate(Estimated_Stage="MAT")

# C. leucas, Neer et al. 2005

C.leucas_YOY <- filter(elasmos, Species=="Carcharhinus_leucas" & FL<=700) %>%
  mutate(Estimated_Stage="YOY")

C.leucas_JUV <- filter(elasmos, Species=="Carcharhinus_leucas" & Sex=="M" & FL>700 & FL<=2100 | Species=="Carcharhinus_leucas" & Sex=="F" & FL>700 & FL<=2250 | Species=="Carcharhinus_leucas" & Sex=="U" & FL>700 & FL<=2250) %>%
  mutate(Estimated_Stage="JUV")

C.leucas_MAT <- filter(elasmos, Species=="Carcharhinus_leucas" & Sex=="M" & FL>2100 | Species=="Carcharhinus_leucas" & Sex=="F" & FL>2250 | Species=="Carcharhinus_leucas" & Sex=="U" & FL>2250) %>%
  mutate(Estimated_Stage="MAT")

# C. limbatus, Parsons 2007

C.limbatus_YOY <- filter(elasmos, Species=="Carcharhinus_limbatus" & STL<=800) %>%
  mutate(Estimated_Stage="YOY")

C.limbatus_JUV <- filter(elasmos, Species=="Carcharhinus_limbatus" & Sex=="M" & STL>800 & STL<=1340 | Species=="Carcharhinus_limbatus" & Sex=="F" & STL>800 & STL<=1540 | Species=="Carcharhinus_limbatus" & Sex=="U" & STL>800 & STL<=1540) %>%
  mutate(Estimated_Stage="JUV")

C.limbatus_MAT <- filter(elasmos, Species=="Carcharhinus_limbatus" & Sex=="M" & STL>1340 | Species=="Carcharhinus_limbatus" & Sex=="F" & STL>1540 | Species=="Carcharhinus_limbatus" & Sex=="U" & STL>1540) %>%
  mutate(Estimated_Stage="MAT")

# C. porosus, Rossa & Santana, 1998

C.porosus_YOY <- filter(elasmos, Species=="Carcharhinus_porosus" & STL<=374) %>%
  mutate(Estimated_Stage="YOY")

C.porosus_JUV <- filter(elasmos, Species=="Carcharhinus_porosus" & Sex=="M" & STL>374 & STL<=710 | Species=="Carcharhinus_porosus" & Sex=="F" & STL>374 & STL<=700 | Species=="Carcharhinus_porosus" & Sex=="U" & STL>374 & STL<=700) %>%
  mutate(Estimated_Stage="JUV")

C.porosus_MAT <- filter(elasmos, Species=="Carcharhinus_porosus" & Sex=="M" & STL>710 | Species=="Carcharhinus_porosus" & Sex=="F" & STL>700 | Species=="Carcharhinus_porosus" & Sex=="U" & STL>700) %>%
  mutate(Estimated_Stage="MAT")

# H. americanus, Ramirez-Mosqueda 2012

H.americanus_JUV <- filter(elasmos, Species=="Hypanus_americanus" & Sex=="M" & STL<=517 | Species=="Hypanus_americanus" & Sex=="F" & STL<=764 | Species=="Hypanus_americanus" & Sex=="U" & STL<=764) %>%
  mutate(Estimated_Stage="JUV")

H.americanus_MAT <- filter(elasmos, Species=="Hypanus_americanus" & Sex=="M" & STL>517 | Species=="Hypanus_americanus" & Sex=="F" & STL>764 | Species=="Hypanus_americanus" & Sex=="U" & STL>764) %>%
  mutate(Estimated_Stage="MAT")

# H. sabina, Snelson et al. 1988

H.sabina_JUV <- filter(elasmos, Species=="Hypanus_sabina" & Sex=="M" & STL<=200 | Species=="Hypanus_sabina" & Sex=="F" & STL<=240 | Species=="Hypanus_sabina" & Sex=="U" & STL<=240) %>%
  mutate(Estimated_Stage="JUV")

H.sabina_MAT <- filter(elasmos, Species=="Hypanus_sabina" & Sex=="M" & STL>200 | Species=="Hypanus_sabina" & Sex=="F" & STL>240 | Species=="Hypanus_sabina" & Sex=="U" & STL>240) %>%
  mutate(Estimated_Stage="MAT")

# R. bonasus, Neer & Thompson 2005

R.bonasus_JUV <- filter(elasmos, Species=="Rhinoptera_bonasus" & Sex=="M" & STL<=642 | Species=="Rhinoptera_bonasus" & Sex=="F" & STL<=653 | Species=="Rhinoptera_bonasus" & Sex=="U" & STL<=653) %>%
  mutate(Estimated_Stage="JUV")

R.bonasus_MAT <- filter(elasmos, Species=="Rhinoptera_bonasus" & Sex=="M" & STL>642 | Species=="Rhinoptera_bonasus" & Sex=="F" & STL>653 | Species=="Rhinoptera_bonasus" & Sex=="U" & STL>653) %>%
  mutate(Estimated_Stage="MAT")

# R. terraenovae, Carlson & Baremore 2003

R.terraenovae_YOY <- filter(elasmos, Species=="Rhizoprionodon_terraenovae" & STL<=600) %>%
  mutate(Estimated_Stage="YOY")

R.terraenovae_JUV <- filter(elasmos, Species=="Rhizoprionodon_terraenovae" & Sex=="M" & STL>600 & STL<=726 | Species=="Rhizoprionodon_terraenovae" & Sex=="F" & STL>600 & STL<=758 | Species=="Rhizoprionodon_terraenovae" & Sex=="U" & STL>600 & STL<=758) %>%
  mutate(Estimated_Stage="JUV")

R.terraenovae_MAT <- filter(elasmos, Species=="Rhizoprionodon_terraenovae" & Sex=="M" & STL>726 | Species=="Rhizoprionodon_terraenovae" & Sex=="F" & STL>758 | Species=="Rhizoprionodon_terraenovae" & Sex=="U" & STL>758) %>%
  mutate(Estimated_Stage="MAT")

# S. lewini, NMFS (get citation from Amanda)

S.lewini_YOY <- filter(elasmos, Species=="Sphyrna_lewini" & STL<=600) %>%
  mutate(Estimated_Stage="YOY")

S.lewini_JUV <- filter(elasmos, Species=="Sphyrna_lewini" & STL>600 & STL<=1790) %>%
  mutate(Estimated_Stage="JUV")

S.lewini_MAT <- filter(elasmos, Species=="Sphyrna_lewini" & STL>1790) %>%
  mutate(Estimated_Stage="MAT")

# S. tiburo, Lombardi et al. 2003 and Carlson & Parsons 1997

S.tiburo_YOY <- filter(elasmos, Species=="Sphyrna_tiburo" & STL<=600) %>%
  mutate(Estimated_Stage="YOY")

S.tiburo_JUV <- filter(elasmos, Species=="Sphyrna_tiburo" & Sex=="M" & STL>600 & STL<=830 | Species=="Sphyrna_tiburo" & Sex=="F" & STL>600 & STL<=944 | Species=="Sphyrna_tiburo" & Sex=="U" & STL>600 & STL<=944) %>%
  mutate(Estimated_Stage="JUV")

S.tiburo_MAT <- filter(elasmos, Species=="Sphyrna_tiburo" & Sex=="M" & STL>830 | Species=="Sphyrna_tiburo" & Sex=="F" & STL>944 | Species=="Sphyrna_tiburo" & Sex=="U" & STL>944) %>%
  mutate(Estimated_Stage="MAT")

# Update elasmos with Estimated_Stage

elasmos_Est_Stages <- bind_rows(C.brevipinna_YOY, C.brevipinna_JUV, C.brevipinna_MAT, C.leucas_YOY, C.leucas_JUV, C.leucas_MAT, C.limbatus_YOY, C.limbatus_JUV, C.limbatus_MAT, C.porosus_YOY, C.porosus_JUV, C.porosus_MAT, H.americanus_JUV, H.americanus_MAT, H.sabina_JUV, H.sabina_MAT, R.bonasus_JUV, R.bonasus_MAT, R.terraenovae_YOY, R.terraenovae_JUV, R.terraenovae_MAT, S.lewini_YOY, S.lewini_JUV, S.lewini_MAT, S.tiburo_YOY, S.tiburo_JUV, S.tiburo_MAT)

elasmos_UND <- elasmos %>%
  filter(Observed_Stage == "UND") %>%
  mutate(Estimated_Stage = "UND")

elasmos_Est_Stages <- bind_rows(elasmos_UND, elasmos_Est_Stages)

write_delim(elasmos_Est_Stages, "data/elasmos_complete.txt", delim = "\t")

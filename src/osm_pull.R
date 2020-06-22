# install.packages("osmdata")
library(osmdata)
library(sf)
library(sp)

############################# OSM Data #############################

# search for your place of interest
# coordinates of patrick county 36.6886° N, 80.3213° W
bb <- getbb('patrick county, virginia')

# from that place get a key and the specific value
q <- opq(bbox = bb) %>%
  add_osm_feature(key = 'amenity', value = c('pharmacy', 'hospital', 'clinic', 'doctors', 'dentist',
                                             'nursing_home', 'social_facility', 'ambulance_station'))
  
r <- opq(bbox = bb) %>%
  add_osm_feature(key = 'highway', value = c('primary', 'secondary', 'tertiary'))

# gets shape file for pull
va <- osmdata_sp(q)
va_2 <- osmdata_sp(r)

# plots the osm_lines
sp::plot(va$osm_points)
sp::plot(va_2$osm_lines)

# what doesn't work: so far nothing for motorways, police, bus_stop
# what works: 'pharmacy', 'hospital', 'clinic', 'doctors', 'dentist','nursing_home', 
# 'social_facility', 'ambulance_station' 

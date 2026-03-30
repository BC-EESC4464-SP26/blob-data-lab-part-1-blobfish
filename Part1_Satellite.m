%% Downloaded Satelitte Data 
filepath = "/Users/celiam-b/Desktop/Grad School/Y1/Data Visualization/Module 3/blob-data-lab-part-1-blobfish"
filename = "jplMURSST41anommday_c13d_98d6_5caa.nc"
ncdisp(filename);
lat = ncread(filename, "latitude");
lon = ncread(filename, "longitude");
time = ncread(filename, "time");
temp = ncread(filename, "sstAnom");

time_days = time / 86400;
time0 = datenum("1970-01-01 00:00:00") ;
time_final = time0 + time_days;
Datestring = datestr(time_final);

imagesc(lat, lon, temp(:, :, 86))
colorbar


%states = readgeotable("usastatehi.shp");
figure(1); clf
worldmap([35 65], [-160 -130])
contourfm(double(lat), double(lon), temp(:,:,85),'linecolor','none');
colorbar
% need a geotable that includes canada 
%geoshow('landareas.shp','FaceColor','black')
title('February Sea Surface Temperature (^oC)')
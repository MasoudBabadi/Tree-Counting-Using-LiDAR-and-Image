function Geotiffsave_DS(index,Rdata, name)
R = maprasterref('RasterSize', size(index), 'ColumnsStartFrom','north');
% R.XWorldLimits = [b(1,1),b(1,2)];
% R.YWorldLimits = [b(2,1) b(2,2)];
R.XWorldLimits = Rdata.XWorldLimits;
R.YWorldLimits = Rdata.YWorldLimits;
key.GTModelTypeGeoKey  = 1;
key.GTRasterTypeGeoKey = 1;
key.ProjectedCSTypeGeoKey = 32611; % For Rudhen
eval(['geotiffwrite(' mat2str(name) ',' 'index' ','  'R' ',' mat2str('GeoKeyDirectoryTag') ',' 'key' ');']);


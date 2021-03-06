-- SQL SQLITE
CREATE TABLE spatial_ref_sys (srid INTEGER NOT NULL PRIMARY KEY,auth_name TEXT NOT NULL,auth_srid INTEGER NOT NULL,ref_sys_name TEXT,proj4text TEXT NOT NULL,srs_wkt TEXT);
INSERT INTO spatial_ref_sys VALUES(32631,'epsg',32631,'WGS 84 / UTM zone 31N','+proj=utm +zone=31 +datum=WGS84 +units=m +no_defs','');
CREATE TABLE geometry_columns (f_table_name TEXT NOT NULL,f_geometry_column TEXT NOT NULL,type TEXT NOT NULL,coord_dimension TEXT NOT NULL,srid INTEGER NOT NULL,spatial_index_enabled INTEGER NOT NULL);
INSERT INTO geometry_columns VALUES('poly','GEOMETRY','POLYGON','XY',32631,1);
CREATE TABLE spatialite_history (event_id INTEGER PRIMARY KEY,table_name,geometry_column,event,timestamp,ver_sqlite,ver_splite);
CREATE TABLE poly (OGC_FID INTEGER PRIMARY KEY, GEOMETRY POLYGON,area FLOAT,eas_id FLOAT,prfedea VARCHAR);
INSERT INTO poly VALUES(1,X'0001CAF80400000000007C461D41000000202E2D5241000000C016521D41000000A0EA2D52417C030000000100000014000000000000602F491D41000000207F2D5241000000C028471D41000000E0922D5241000000007C461D4100000060AE2D524100000080C9471D4100000020B62D5241000000209C4C1D41000000E0D82D5241000000608D4C1D41000000A0DD2D5241000000207F4E1D41000000A0EA2D524100000020294F1D4100000080CA2D524100000000B4511D41000000E0552D5241000000C016521D4100000080452D5241000000E0174E1D41000000202E2D524100000020414D1D41000000E04C2D5241000000E04B4D1D41000000605E2D524100000040634D1D41000000E0742D5241000000A0EF4C1D41000000E08D2D5241000000E04E4C1D41000000E0A12D5241000000E0B04B1D4100000060B82D524100000080974A1D4100000080AE2D524100000080CF491D4100000080952D5241000000602F491D41000000207F2D5241FE',215229.266,168.0,'35043411');
CREATE VIRTUAL TABLE idx_poly_GEOMETRY USING rtree(pkid, xmin, xmax, ymin, ymax);
INSERT INTO idx_poly_GEOMETRY SELECT OGC_FID, ST_MinX(GEOMETRY), ST_MaxX(GEOMETRY), ST_MinY(GEOMETRY), ST_MaxY(GEOMETRY) FROM poly;

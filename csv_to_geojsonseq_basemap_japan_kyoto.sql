-- DuckDB query to convert 

INSTALL spatial;
LOAD spatial;

COPY (
    SELECT
        subtype, class, name, level,
        ST_GeomFromText(wkt) as geometry
    FROM 'basemap_japan_kyoto.csv'
    ) TO 'basemap_japan_kyoto.geojsonseq'
WITH (FORMAT GDAL, DRIVER 'GeoJSONSeq');

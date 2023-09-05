#  Steps to reproduce

1. Used https://norbertrenner.de/osm/bbox.html to get Lat/Long of Kyoto city
2. Create AWS Sw3 bucket in US-west2
3. Scope Athena region to US-West2
4. Run Athena setup queries https://github.com/OvertureMaps/data/blob/main/athena_setup_queries.sql. Note: file can't be run as-in. Athena only supports one query at a time.
5. Run `basemap_japan_kyoto.sql` in Athena
6. Query results can be downloaded as csv (`basemap_japan_kyoto.csv`)
7. Run `$ duckdb < conversion_streets_japan_kyoto.sql` which generates `basemap_japan_kyoto.geojsonseq`
8. Generate tileset with `tippecanoe -fo basemap_japan_kyoto.pmtiles -Z11 -z11 -l roads basemap_japan_kyoto.geojsonseq`

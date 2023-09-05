-- AWS Athena Query for Kyoto City's street segments from OvertureMaps' Transportation Theme
SELECT
    subtype,
    JSON_EXTRACT_SCALAR(road,'$.class') as class,
    JSON_EXTRACT_SCALAR(road,'$.roadNames.common[0].value') AS name,
    level,
    ST_ASTEXT(ST_GeomFromBinary(geometry)) as wkt
FROM
    transportation
WHERE type = 'segment' AND
    bbox.minX > 135.6282 -- West longitude of Kyoto
    AND bbox.maxX < 135.8424 -- East longitude of Kyoto
    AND bbox.minY > 34.9169 -- South latitude of Kyoto
    AND bbox.maxY < 35.0814 -- North Latitude of Kyoto
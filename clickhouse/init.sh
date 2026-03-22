#!/bin/bash
set -e

curl -sS 'http://localhost:8123' \
  --user "${CLICKHOUSE_USER}:${CLICKHOUSE_PASSWORD}" \
  -d "
    CREATE DATABASE IF NOT EXISTS weather;

    CREATE TABLE IF NOT EXISTS weather.raw_weather (
      city String,
      latitude Float32,
      longitude Float32,
      generationtime_ms Float32,
      utc_offset_seconds Int32,
      timezone String,
      timezone_abbreviation String,
      elevation Float32,
      time DateTime,
      interval_sec Int32,
      temperature_2m Float32,
      wind_speed_10m Float32,
      temperature_unit String,
      wind_speed_unit String
    ) ENGINE = MergeTree()
    ORDER BY (city, time);
  "

echo "🎉 Table created!"

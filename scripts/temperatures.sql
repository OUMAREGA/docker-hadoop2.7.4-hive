DROP TABLE IF EXISTS temperature;

CREATE EXTERNAL TABLE temperature(
`station` string,
`date` string,
`source` string,
`latitude` string,
`longitude` string,
`elevation` string,
`name` string,
`report_type` string,
`call_sign` string,
`quality_control` string,
`wnd` string,
`cig` string,
`vis` string,
`tmp` string,
`dew` string,
`slp` string,
`aa1` string,
`aa2` string,
`aj1` string,
`ay1` string,
`ay2` string,
`ga1` string,
`ga2` string,
`ga3` string,
`ge1` string,
`gf1` string,
`ia1` string,
`ka1` string,
`ka2` string,
`ma1` string,
`md1` string,
`mw1` string,
`oc1` string,
`od1` string,
`ua1` string,
`rem` string,
`eqd` string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
  )
STORED AS TEXTFILE LOCATION '/user/hadoop/data/';

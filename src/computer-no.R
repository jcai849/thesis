SELECT `S` - list(con = list(master = "yarn", method = "shell", app_name =
	"sparklyr", config = list(spark.env.SPARK_LOCAL_IP.local = "127.0.0.1",
	sparklyr.connect.csv.embedded = "\^1.*",
	spark.sql.legacy.utcTimestampFunc.enabled = TRUE,
	sparklyr.connect.cores.local = 4, spark.sql.shuffle.partitions.local =
	4), state = <environment>, extensions = list(jars = character(0),
	packages = character(0), initializers = list(), catalog_jars =
	character(0)), spark_home =
	"/shared/spark-3.0.0-preview2-bin-hadoop3.2", backend = 4, monitoring =
	5, gateway = 3, output_file =
	"/tmp/Rtmpbi2dqk/file44ec187daaf4_spark.log", sessionId = 58600,
	home_version = "3.0.0")) AS `S1`, `S` - list(x = "x", vars = "initial")
	AS `S2` FROM `S`

from pyspark import SparkConf,SparkContext

conf = SparkConf().setMaster("local").setAppName("My App")
sc = SparkContext(conf = conf)

# Read from dataset
line1 = sc.textFile("../example.md")

# Read from object set
line2 = sc.parallelize(["pandas","I like pandas"])

sc.stop()
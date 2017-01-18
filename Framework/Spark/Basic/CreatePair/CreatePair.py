from pyspark import SparkConf,SparkContext

conf = SparkConf().setMaster("local").setAppName("My App")
sc = SparkContext(conf = conf)

# Read dataset and create a RDD
inputRDD = sc.textFile("../example.md")

# Create pair-RDD with first word in the sentence as key and the whole sentence as value
pairRDD = inputRDD.map(lambda x :(x.split(" ")[0],x))

# create with function : parallelize()

sc.stop()
from pyspark import SparkConf,SparkContext

conf = SparkConf().setMaster("local").setAppName("My App")
sc = SparkContext(conf = conf)

inputRDD = sc.textFile("../example.md")

# filter
googleRDD = inputRDD.filter(lambda x : "Google" in x)
appsRDD = inputRDD.filter(lambda x : "apps" in x)

# union
googleAppsRDD = googleRDD.union(appsRDD)

# take
for line in googleAppsRDD.take(3):
	print line


# map
numsRDD = sc.parallelize([1,2,3,4])
squaredRDD = numsRDD.map(lambda x : x*x)
for num in squaredRDD.collect():
	print num

# flatMap : return a sequence of iterator
words = inputRDD.flatMap(lambda x : x.split(" "))
print words.first()

# reduce
sumUp = numsRDD.reduce(lambda x,y :x+y)

# stop
sc.stop()
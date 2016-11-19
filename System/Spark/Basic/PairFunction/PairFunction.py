from pyspark import SparkConf,SparkContext

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

conf = SparkConf().setMaster("local").setAppName("Pair")
sc = SparkContext(conf = conf)

# create a pair-RDD
dataPair = sc.parallelize([("panda",0),("pink",3),("pirate",3),("panda",1),("pink",4)])

# filter : second element larger than 2
dataPair.filter(lambda x : x[1] > 2)

# calculate the avg
avg = dataPair.mapValues(lambda x:(x,1)).reduceByKey(lambda x,y:(x[0]+y[0],x[1]+y[1]))
print avg.collect()

# count word
text = sc.textFile("../example.md")
words = text.flatMap(lambda x : x.split(" "))
result = words.map(lambda x:(x,1)).reduceByKey(lambda x,y:x+y).sortByKey()
for i in result.collect():
	print i

sc.stop()
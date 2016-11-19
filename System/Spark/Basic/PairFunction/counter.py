from pyspark import SparkConf,SparkContext

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

conf = SparkConf().setMaster("local").setAppName("Pair")
sc = SparkContext(conf = conf)

# word counter
text = sc.textFile("../example.md")
words = text.flatMap(lambda x : x.split(" "))
result = words.map(lambda x : (x,1)).reduceByKey(lambda x,y:x+y).sortByKey()

for i in result.collect():
	print i 

sc.stop()
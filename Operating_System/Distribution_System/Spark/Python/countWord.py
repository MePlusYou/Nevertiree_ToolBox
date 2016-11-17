from pyspark import SparkConf,SparkContext

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

conf = SparkConf().setMaster("local").setAppName("My APp")
sc = SparkContext(conf = conf)

lines = sc.textFile("README.md")
print lines.count()
print lines.first()

print "---------------"

googleLines = lines.filter(lambda line:"Google" in line)
print googleLines.count()

for line in googleLines.collect():
	print("%s" %(line))
	print ""

nums = sc.parallelize([1,2,3,4])
for num in nums.collect():
	print "%i" %(num)

squared = nums.map(lambda x: x*x).collect()

for num in squared:
	print "%i" % (num)

words = sc.parallelize(["hello world","hi"])
char = words.flatMap(lambda word : word.split(" "))
print char.first()



sc.stop()
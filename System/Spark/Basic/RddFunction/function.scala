import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

val conf = new SparkConf().setMaster("local").setAppName("My App")
val sc = new SparkContext(conf)

// Create RDD
val inputRDD = sc.textFile("../example.md")

// filter key word "Google"
val googleRDD = inputRDD.filter(line => line.contains("Google"))
val appsRDD = inputRDD.filter(line => line.contains("apps"))

// union
val googleAppsRDD = googleRDD.union(appsRDD)

// count 
val googleAppsLine = googleAppsRDD.count()

// take 10 examples and println
googleAppsRDD.take(10).foreach(println)

// map
val nums = sc.parallelize(list(1,2,3,4))
val squared = nums.map(x => x*x)
println(result.collect().mkString(","))

// flatMap : return a sequence of iterator
val words = inputRDD.flatMap(x => x.split(" "))
println(words.first())

// reduce
val sumUo = nums.reduce((x,y) => x+y)
import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

val conf = new SparkConf().setMaster("local").setAppName("My App")
val sc = new SparkContext(conf)

// Create RDD
val inputRDD = sc.textFile("../example.md")

// Word Counter
val words = inputRDD.flatMap(x => x.split(" "))
val result = words.map(x => (x,1)).reduceByKey((x,y) => x+y)
result.collect().foreach(println)
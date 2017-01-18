import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

val conf = new SparkConf().setMaster("local").setAppName("My App")
val sc = new SparkContext(conf)

// Create RDD
val inputRDD = sc.textFile("../example.md")

// Create pair-RDD
val pairRDD = inputRDD.map(x => (x.split(" ")(0),x))
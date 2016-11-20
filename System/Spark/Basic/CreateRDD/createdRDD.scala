import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

val conf = new SparkConf().setMaster("local").setAppName("My App")
val sc = new SparkContext(conf)

//Read from dataset
val lines1 = sc.textFile("../example.md")

//Read from object set
val lines2 = sc.parallelize(list("pandas","I like pandas"))
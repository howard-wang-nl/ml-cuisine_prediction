# ml-cuisine_prediction
Test of Spark MLLib

# Running the cuisine prediction 
- Make sure that $SPARK_HOME/bin is in your path. If not add it :
```
# Create local variable SPARK_HOME and add bin folder to PATH
export SPARK_HOME = /path/to/spark
export PATH = $SPARK_HOME/bin:$PATH
```
- Step into the project directory
- Run in local mode to test:
./run.sh

- For cluster mode, run the sbt assembly target
```
sbt assembly
```
- Submit the job to spark (and hit ctrl + c to terminate it)
```
spark-submit
--class "cuisine_prediction"
--master "<master url>"
--conf "spark.executor.extraJavaOptions=-XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
--executor-memory 2G
--deploy-mode "cluster"
"<path_to_fatjar.jar>"
```
* Example :
```
spark-submit
--class "consumer.cuisine_prediction"
--master "<master url>"
--conf "spark.executor.extraJavaOptions=-XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
--executor-memory 2G
--deploy-mode "cluster"
"target/scala-2.10/ml-cuisine_prediction-assembly-1.0.jar"
"cuisine_prediction"
```

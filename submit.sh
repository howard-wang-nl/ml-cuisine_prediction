spark-submit \
    --master yarn-cluster \
    --num-executors 3 \
    ml-cuisine-prediction-assembly-0.1.0.jar \
    --maxDepth 10 --numTrees 10 --maxBins 4 /data/train.libsvm.txt

# Some other spark-submit options
#    --executor-cores 1 \
#    --driver-memory 1g \
#    --executor-memory 1g \

# cuisine lists in train.libsvm.txt
# 20 categories ( countries )
# 6714 attributes ( food ingredients )
# 39774 recipes

# CuisinePrediction: an example decision tree app.
# Usage: CuisinePrediction [options] <input>
# 
#   --algo <value>
#         algorithm (Classification,Regression), default: Classification
#   --impurity <value>
#         impurity type (Gini,Entropy,Variance), default: Gini
#   --maxDepth <value>
#         max depth of the tree, default: 5. DecisionTree currently only supports maxDepth <= 30
#
#   --maxBins <value>
#         max number of bins, default: 32
#
# maxBins: Number of bins used when discretizing continuous features.
# Increasing maxBins allows the algorithm to consider more split candidates and make fine-grained split decisions. 
# However, it also increases computation and communication.
# Note that the maxBins parameter must be at least the maximum number of categories M for any categorical feature.
#
#   --minInstancesPerNode <value>
#         min number of instances required at child nodes to create the parent split, default: 1
#   --minInfoGain <value>
#         min info gain required to create a split, default: 0.0
#   --numTrees <value>
#         number of trees (1 = decision tree, 2+ = random forest), default: 1
#   --featureSubsetStrategy <value>
#         feature subset sampling strategy (auto, all, sqrt, log2, onethird), default: auto
#   --fracTest <value>
#         fraction of data to hold out for testing.  If given option testInput, this option is ignored. default: 0.2
#   --useNodeIdCache <value>
#         whether to use node Id cache during training, default: false
#   --checkpointDir <value>
#         checkpoint directory where intermediate node Id caches will be stored, default: None
#   --checkpointInterval <value>
#         how often to checkpoint the node Id cache, default: 10
#   --testInput <value>
#         input path to test dataset.  If given, option fracTest is ignored. default: 
#   --dataFormat <value>
#         data format: libsvm (default), dense (deprecated in Spark v1.1)
#   <input>
#         input path to labeled examples


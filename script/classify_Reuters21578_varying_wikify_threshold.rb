classificator = Classify.new

wikify_thresholds = [0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]

wikify_thresholds.each do |threshold|
   classificator.reuters_21578_semantic_classifier(threshold)
end

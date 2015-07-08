classificator = Classify.new

training_secuence = [5,50,150]
expanded_concepts_weights = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]

training_secuence.each do |training_elements|
   expanded_concepts_weights.each do |expanded_concepts_weight|
      classificator.twenty_newsgroups_semantic_classifier(0.01, training_elements, expanded_concepts_weight)
   end
end

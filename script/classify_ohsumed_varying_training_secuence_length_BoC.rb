classificator = Classify.new

training_secuence = [5,10,50,100]
expanded_concepts_weights = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]

training_secuence.each do |training_elements|
   expanded_concepts_weights.each do |expanded_concepts_weight|
      classificator.ohsumed_semantic_classifier(0.01, training_elements, expanded_concepts_weight)
   end
end
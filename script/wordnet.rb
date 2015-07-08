require 'rubygems'
require 'wordnet'

lemmas = WordNet::WordNetDB.find("fruit")
synsets = lemmas.map { |lemma| lemma.synsets }
words = synsets.flatten
words.each { |word| puts word.gloss }
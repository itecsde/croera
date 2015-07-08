
i=0
ReutersNewItem.all.each do |document|
   puts i+=1
   puts document.id
   if document.taggable_tag_annotations.where(:type_tag=>"translated").size == 0
      document.document_language_concept_correspondence(document, "es", "en")
   else
      puts "Resource concepts already translated"
   end
end

# encoding: utf-8

#a=CorpusCreator.new
#a.translate_rcv2_spanish_to_english
#a.re_translate_rcv2_spanish_to_english
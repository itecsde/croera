scrape_documentaries = ScraperDocumentaries.new
#scrape_documentaries.scrape_topdocumentaryfilms
#scrape_documentaries.scrape_ciberdocumentales
#scrape_documentaries.scrape_documentariosvarios

threads=[]

puts "Documentaries scrape_documentaryaddict"
threads << Thread.new do
  begin
    scrape_documentaries.scrape_documentaryaddict
  rescue
  end
end

puts "Documentaries scrape_documentaryheaven"
threads << Thread.new do
  begin
    scrape_documentaries.scrape_documentaryheaven
  rescue
  end
end

puts "Joins"

threads.each do |thread|
   thread.join
   if thread[:exception]
   end
end
require 'rubygems'
require 'nokogiri'
require 'open-uri'


##anhade en que idiomas estan disponibles las lectures. De momento sólo a las de ted

Lecture.find_each do |lecture|
  begin
    idiomas = Array.new
    if lecture.scraped_from == "http://www.ted.com"
      puts "open: " + lecture.url
      lecture_page = Nokogiri::HTML(open(lecture.url))
      lecture_page.css("div.talk-tools select#languageCode option").each do |idioma|
        idiomas << idioma.text
      end
      idiomas.delete_if { |element| element == "Show transcript"} 
      
      idiomas.each do |idioma|
         if Language.find_by_language(idioma)!=nil
           annotation = GlobalizableLanguageAnnotation.new
           annotation.globalizable = lecture
           annotation.language = Language.find_by_language(idioma)
           annotation.save
         end #if
      end # do |idioma|  
  
      elsif lecture.scraped_from == "https://www.khanacademy.org/"
          idioma = "English"
          puts "Anotando -> " + lecture.url
           if Language.find_by_language(idioma)!=nil
             annotation = GlobalizableLanguageAnnotation.new
             annotation.globalizable = lecture
             annotation.language = Language.find_by_language(idioma)
             annotation.save
           end #if     
      elsif lecture.scraped_from == "http://videolectures.net"
          idioma = "English"
           puts "Anotando -> " + lecture.url
           if Language.find_by_language(idioma)!=nil
             annotation = GlobalizableLanguageAnnotation.new
             annotation.globalizable = lecture
             annotation.language = Language.find_by_language(idioma)
             annotation.save
           end #if
      end
    
    rescue Exception => e
      puts "Exception en script_integrator_languages"
      puts e.backtrace.inspect
      puts e.message
    end
end




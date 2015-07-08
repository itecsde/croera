class ApplicationParentCategoryIntegrator
  
  def populate_application_parent_categories
    begin

        application_seeds = Array.new
        
        application_seeds << {:name => "Skype", :id => 424589}
        application_seeds << {:name => "Ekiga", :id => 3894939}
        application_seeds << {:name => "Yahoo Games", :id => 1002731}
        application_seeds << {:name => "Knowledge Adventure", :id => 290752}
        application_seeds << {:name => "MediaWiki", :id => 323710}
        application_seeds << {:name => "DokuWiki", :id => 806169}
        application_seeds << {:name => "Evernote", :id => 2848481}
        application_seeds << {:name => "GIMP", :id => 12628}
        application_seeds << {:name => "Inkscape", :id => 412916}
        application_seeds << {:name => "Audacity", :id => 335605}
        application_seeds << {:name => "Avidemux", :id => 2598929}
        application_seeds << {:name => "VirtualDub", :id => 421482}
        application_seeds << {:name => "Dia", :id => 9069}
        application_seeds << {:name => "LibreOffice", :id => 28981081}
        application_seeds << {:name => "Prezi", :id => 23948922}
        application_seeds << {:name => "SlideShare", :id => 28015259}
        application_seeds << {:name => "Scribd", :id => 15833063}
        application_seeds << {:name => "Wikipedia", :id => 5043734}
        application_seeds << {:name => "Wolfram Alpha", :id => 21903944}
        application_seeds << {:name => "The Free Dictionary", :id => 989676}
        application_seeds << {:name => "Yahoo Answers", :id => 3385969}
        application_seeds << {:name => "Google Scholar", :id => 1520204}
        application_seeds << {:name => "Google Forms", :id => 5442405}
        application_seeds << {:name => "phpBB", :id => 247971}
        application_seeds << {:name => "SMF", :id => 1527547}
        application_seeds << {:name => "LyX", :id => 166127}
        application_seeds << {:name => "WordPad", :id => 970007}
        application_seeds << {:name => "gedit", :id => 224281}
        application_seeds << {:name => "Second Life", :id => 589192}
        application_seeds << {:name => "ActiveWorlds", :id => 879878}
        application_seeds << {:name => "Google Street View", :id => 11546879}
        application_seeds << {:name => "Google Art Project", :id => 30720880}
        application_seeds << {:name => "OpenStreetMap", :id => 2955470}
        application_seeds << {:name => "Ubuntu", :id => 990298}
        application_seeds << {:name => "Firebug", :id => 11387385}
        application_seeds << {:name => "Brasero", :id => 11661642}
        application_seeds << {:name => "Safari", :id => 166842}
        application_seeds << {:name => "Windows Media Player", :id => 43941}
        application_seeds << {:name => "Android", :id => 12610483}
        application_seeds << {:name => "Microsoft Windows", :id => 18890}
        application_seeds << {:name => "Google Talk", :id => 1566175}
        application_seeds << {:name => "Vorbis", :id => 32489}
        
        wikipediator = Wikipediator.new
        
        application_seeds.each do |seed|
          parentCategories = wikipediator.parentCategories(seed[:id])
          parentCategories.each do |parent_category|
            if ApplicationParentCategory.find_by_name(parent_category['title'])==nil
              parent_category_new = ApplicationParentCategory.new
              parent_category_new.name = parent_category['title']
              parent_category_new.save
            end
          end        
        end
    rescue Exception => e
      puts "Failed populate_application_parent_categories"
      puts e.message
      puts e.backtrace.inspect
    end
  end
  
end
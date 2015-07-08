module Categorizable
  def self.included(base)
    base.class_eval do
      has_many :element_category_annotations, :as => :categorizable, :dependent => :destroy
      has_many :categories, :through => :element_category_annotations
    end
  end  
  
  def categorize(ids)
    puts "los ids recibidos son"
    ids.each do |id|
      puts id.to_s + ","
    end   
    begin
      ElementCategoryAnnotation.destroy_all(:categorizable_id =>self.id, :type_category =>"automatic")
      wikipediator = Wikipediator.new      
      categories_suggest = wikipediator.suggest(ids)
      puts "las categorias sugeridas son: "
      puts categories_suggest
      if categories_suggest != nil
        self.scraping_status.categorized = true
        categories_suggest.each do |category|          
          if Category.find_by_name(category[:title])!=nil
            new_annotation = ElementCategoryAnnotation.new
            new_annotation.categorizable = self
            new_annotation.category = Category.find_by_name(category[:title])
            new_annotation.type_category = "automatic"
            new_annotation.weight=category[:weight]
            new_annotation.save          
          else
            new_category = Category.new
            new_category.name = category[:title]
            new_category.save
            new_annotation = ElementCategoryAnnotation.new
            new_annotation.categorizable = self
            new_annotation.category = new_category
            new_annotation.type_category = "automatic"
            new_annotation.weight=category[:weight]
            new_annotation.save
          end         
        end #do |category|
      else
        self.scraping_status.categorized = false  
      end
      self.scraping_status.save
           
    rescue Exception => e
      puts "Failed categorize (suggest) --> Categorizable"
      puts e.message
      puts e.backtrace.inspect
    end        
  end #create_category_annotations


end


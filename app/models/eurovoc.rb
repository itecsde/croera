class Eurovoc < ActiveRecord::Base
   include Taggable
   include Ownable
   include Wikipediable
   include Globalizable
   include Aggregable
   include Categorizable
   include Scrapeable

   acts_as_nested_set
   #has_ancestry

   searchable do
      integer :id
   end

   def get_node(key)
      begin
         return Eurovoc.where(:eurovoc_id => key)[0]
      rescue Exception => e 
         puts "Exception get_node"
         puts e.message
         puts e.backtrace.inspect
      end
   end

   def add_root_helper_node(name,type_node,parent_id, key)
      begin
         new_node = Eurovoc.create!(:name => name) do |node|
         node.eurovoc_id = key
         node.type_node = type_node
         end
         
      rescue Exception => e
         puts "Exception add_node"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   

   def add_node(name,type_node,parent_id, key)
      begin
         new_node = Eurovoc.create!(:name => name) do |node|
         node.eurovoc_id = key
         node.type_node = type_node
         end
         parent_node = get_node(parent_id)
         puts parent_node
         new_node.move_to_child_of(parent_node)
         
      rescue Exception => e
         puts "Exception add_node"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def get_first_level(key)
      begin
         node = get_node(key)
         if (node.parent).eurovoc_id == 0 and (node.parent.depth == 0)
            return node.name
         else
            get_first_level(node.parent.eurovoc_id)
         end
      rescue Exception => e
         puts "Exception get_first_level"
         puts e.message
         puts e.backtrace.inspect
      end
   end

   attr_accessible :element_image, :name, :description, :url, :link, :book_subject_annotations_attributes, :owner_type, :owner_id, :scraped_from, :creator_id, :tag_list, :author, :museum
   has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"


end
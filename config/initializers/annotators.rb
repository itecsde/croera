#if Rails.env.development?
#  wiki_servers = ["192.168.1.82"]
#else
  #wiki_servers = ["192.168.1.8:8080","192.168.1.9:8080","192.168.1.10:8080","192.168.1.11:8080","192.168.1.12:8080","193.146.210.107:8080","193.146.210.107:8081","193.146.210.107:8082"]
  #wiki_servers = ["192.168.1.9:8080","192.168.1.10:8080","192.168.1.12:8080"]
  wiki_servers = ["192.168.1.8:8080"]
  #wiki_servers = [] 
#end     

#"192.168.1.12:8080"  
  
wiki_servers.each do |wiki_server|
  annotator = Annotator.new wiki_server
  annotator.run
end

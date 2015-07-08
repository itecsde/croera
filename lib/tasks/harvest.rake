task :harvest => :environment do
  url = 'http://composer.itec.km.co.at/composer/applications/harvest'
  
  result = RestClient::Request.execute(:method => :get, :url => url, :timeout => 90000000)
  
  parsed_result = JSON.parse result
  
  parsed_result.each { |item|
    application = Application.new
    application.name = "#{item['meta-metadata']['name']}"
    puts application.name
    application.save
  }
  
  puts parsed_result
end
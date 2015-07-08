require 'rubygems'
require 'nokogiri'
require 'open-uri'

#rellena la tabla languages

begin
  sde = SdeIntegrator.new
  sde.populate_languages
  puts "Tabla languages rellenada"
rescue
  puts "Exception en integrator.rb"
end

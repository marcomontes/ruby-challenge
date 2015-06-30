require 'open-uri'

require_relative './lib/xml_analyzer.rb'
macbeth_url = open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
speakers = XmlAnalyzer.new(macbeth_url).analyze
speakers.each { |speaker| puts "#{speaker[1]} #{speaker[0].capitalize}" }

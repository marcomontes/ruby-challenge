require 'open-uri'
require_relative './lib/xml_analyzer.rb'

macbeth_url = open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
IO.copy_stream(macbeth_url, 'macbeth.xml')
macbeth_file = File.open("macbeth.xml")
speakers = XmlAnalyzer.new(macbeth_file).analyze
macbeth_file.close
speakers.each { |speaker| puts "#{speaker[1]} #{speaker[0].capitalize}" }

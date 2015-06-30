require 'nokogiri'

class XmlAnalyzer
  attr_reader :xml_path, :speakers_counter

  def initialize(url)
    @xml_path = url
    @speakers_counter = {}
  end

  def analyze
    parsed_xml = parse_xml(xml_path)
    speakers = get_speakers(parsed_xml)
    speaker_counter_results = line_counter(parsed_xml)
    formatted_data = format_data(speaker_counter_results)
    formatted_data
  end

  def parse_xml(url)
    IO.copy_stream(xml_path, 'macbeth.xml')
    macbeth_file = File.open("macbeth.xml")
    doc = Nokogiri::XML(macbeth_file)
    macbeth_file.close
    doc
  end

  def get_speakers(xml)
    speakers = xml.xpath("//SPEECH//SPEAKER").collect{ |speaker| speaker.content }.uniq
    speakers.each { |speaker| speakers_counter[speaker] = 0 }
  end

  def line_counter(xml)
    xml.xpath("//SPEECH").each do |speech|
      speaker = speech.search("SPEAKER").first
      lines = speech.search("LINE")
      speakers_counter[speaker.content] += lines.count
    end
    speakers_counter
  end

  def format_data(data)
    data.delete("ALL")
    data.sort_by(&:last).reverse
  end

end

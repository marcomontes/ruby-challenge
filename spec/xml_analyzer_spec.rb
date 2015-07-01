require_relative '../lib/xml_analyzer.rb'

describe XmlAnalyzer do

  let(:analyzer) { XmlAnalyzer.new(@raw_xml) }

  before :all do
    @raw_xml = <<-eof
      <?xml version="1.0"?>
      <SPEECH>
        <SPEAKER>MACBETH</SPEAKER>
        <LINE>I'll fight till from my bones my flesh be hack'd.</LINE>
        <LINE>Give me my armour.</LINE>
      </SPEECH>
    eof

  end

  describe '#analyze' do

    it 'returns an empty array if xml is empty' do
      @raw_xml = ""
      expect(analyzer.analyze).to eq([])
    end

    it 'returns an array with speaker and numer of speech lines' do
      expect(analyzer.analyze).to eq([["MACBETH", 2]])
    end

    it 'returns xml data parsed using nokogiri' do
      expect(analyzer.parse_xml(@raw_xml)).to_not be_nil
    end

    it 'returns a array with speakers names' do
      parsed_xml = analyzer.parse_xml(@raw_xml)
      expect(analyzer.get_speakers(parsed_xml)).to eq(["MACBETH"])
    end

  end
end
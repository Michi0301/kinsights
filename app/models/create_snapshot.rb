class CreateSnapshot
  def initialize(company)
    @company = company
  end

  def call
    body = Request.new(company.url).get
    document = Nokogiri::HTML(body)

    snapshot = company.snapshots.build
    CompanyStatsMapping::MAPPING.each do |attribute, mapping|
      parser_class = mapping[:parser]
      snapshot.send("#{attribute}=", parser_class.new(document.xpath(mapping[:xpath]).text).parse)
    end

    snapshot.save!
    snapshot
  end

  private

  attr_reader :company
end

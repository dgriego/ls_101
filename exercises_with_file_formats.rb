require 'json'
require 'nokogiri'
require 'axlsx'
require 'csv'
require 'pry'

slashdot_articles = []
File.open("slashdot.xml") do |f|
  doc = Nokogiri::XML(f)

  slashdot_articles = doc.css('item').map do |i|
    {
      title: i.at_css('title').content,
      link: i.at_css('link').content,
      summary: i.at_css('description').content
    }
  end
end

feedzilla_articles = []
File.open("feedzilla.json") do |f|
  # depending on the file contents you may need to force
  # the enocding to UTF-8.  You can do so like this:
  encoded_file_content = f.read.force_encoding('UTF-8')

  # then pass it into JSON.parse
  items = JSON.parse(encoded_file_content)
  feedzilla_articles = items['articles'].map { |a|
    {
      title: a['title'],
      link: a['url'],
      summary: a['summary']
    }
  }
end

sorted_articles = (feedzilla_articles + slashdot_articles).sort_by do |a|
  a[:title]
end

# we have parsed the XML file
# parsed the JSON file
# created two arrays with the newly formatted content as Hashes within those arrays
# then merged the two arrays and sorted them by title

# now we turn those two files into an CSV file or any format we want
CSV.open("article.csv", "wb") do |csv|
  sorted_articles.each { |a| csv << [a[:title], a[:link], a[:summary]] }
end

pkg = Axlsx::Package.new
pkg.workbook.add_worksheet(:name => "Articles") do |sheet|
  sorted_articles.each { |a| sheet.add_row [a[:title], a[:link], a[:summary]] }
end
pkg.serialize("articles.xlsx")
namespace :scrape do
  desc "scraping Google Finance Fundamentals Data"

  task :google_finance => :environment do
    #

    require 'open-uri'

    # In order to scrape elements on a website, I need to erquire nokogiri.
    require 'nokogiri'

    #this access the site
    url = "https://www.google.com/finance?q=NASDAQ%3AAAPL&fstype=ii"
    document = open(url).read

    # this parse the site using Nokogiri
    html_doc = Nokogiri::HTML(document)

    # this is the format of what we want.  I get this form Kimono where I have highlighted these items.
    data_format = "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td.lft.lm"

    # use nokogiri to get all the data that shares the common format
    row_names = html_doc.css(data_format)

    puts row_names
  end
end
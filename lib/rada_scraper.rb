#!/usr/bin/env ruby
# encoding: UTF-8

#ENV['RAILS_ENV'] = 'development'

#require '../../config/environment' #only if you are using this within a rails app
require 'rexml/document'
require 'iconv'
require 'rubygems'
require 'hpricot'
require 'open-uri'


def scrape
  
  puts "SCRAPING..."
  
  url = "http://static.rada.gov.ua/site/eng/dep/list.html"
  
  ic = Iconv.new("UTF-8//IGNORE", "UTF-8")
  page = open(url) {|f| Hpricot(ic.iconv(f.read)) }
  
  representatives = []
    
  page.search("//div[2]").each do |surname_table|
    surname_table.search("//tr").each do |representative|
      unless representative.at("//td/a")['href'].nil? or representative.at("//td/a").innerHTML == "To the top"
        
        name = representative.at("//td/a").innerHTML
        profile_link = representative.at("//td/a")['href']
        profile_page = open(profile_link) {|f| Hpricot(ic.iconv(f.read)) }
        email = profile_page.at("//div[6]/a") ? profile_page.at("//div[6]/a")['href'].split(":").last : ""
        
        rep = name + "|" + email + "|" + profile_link
                
        representatives << rep

      end
    end
  end
  
  return representatives
  
end # end function scrape


if __FILE__ == $0

  reps = scrape
  puts "***************************"
  puts reps.size
  
  puts "DONE SCRAPING, WRITING DATA..."

  File.open("public/files/rada_eng", 'w') {|f| reps.each{|rep| f.write("#{rep}\n")} }
  
end

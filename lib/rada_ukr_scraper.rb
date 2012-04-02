#!/usr/bin/env ruby
# encoding: UTF-8

require 'rexml/document'
require 'iconv'
require 'rubygems'
require 'hpricot'
require 'open-uri'


#/html/body/table/tbody/tr[2]/td/center/div[2]/div[21]/table/tbody/tr[2]/td/a
#/html/body/table/tbody/tr[2]/td/center/div[2]/div[22]/table/tbody/tr[4]/td/a

def scrape
  
  puts "SCRAPING..."
  
  url = "http://w1.c1.rada.gov.ua/pls/site/"
  
  ic = Iconv.new("UTF-8//IGNORE", "UTF-8")
  f = open(url + "p_deputat_list")
  page = Hpricot(Iconv.conv('UTF-8', f.charset, f.read))
  f.close
  
  representatives = []
    
  page.search("//div[2]").each do |surname_table|
    surname_table.search("//tr").each do |representative|
      unless representative.at("//td/a")['href'].nil? or representative.at("//td/a")['href'] == "#top"
        profile_link = "http://w1.c1.rada.gov.ua/pls/site/" + representative.at("//td/a")['href']
        name = representative.at("//td/a").innerHTML
        party_info = representative.at("//td[2]").innerHTML
        party = party_info.split("<br />")[1].strip
        list_number = party_info.split("<br />").last.strip
        
        f_prof = open(profile_link)
        profile_page = Hpricot(Iconv.conv('UTF-8', f_prof.charset, f_prof.read))
        f_prof.close
                
        email = profile_page.at("//div[6]/a") ? profile_page.at("//div[6]/a")['href'].split(":").last : ""
        
        rep = name + "|" + email + "|" + party + "|" + list_number + "|" + profile_link
                
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

  File.open("public/files/rada_ukr", 'w') {|f| reps.each{|rep| f.write("#{rep}\n")} }
  
end

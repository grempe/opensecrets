#!/usr/bin/env ruby

require 'rubygems'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib')) # only when running from gem source dir
require 'opensecrets'
require 'pp'


########
# NOTE : You should 'export OPENSECRETS_API_KEY=YOUR_API_KEY' before running this script.
########


CID = 'N00007360' # Nancy Pelosi


member = OpenSecrets::Member.new

puts "\n\nMEMBER : GET LEGISLATORS\n\n"
pp member.get_legislators({:id => "CA"})["response"]

puts "\n\nMEMBER : PFD PROFILE\n\n"
pp member.pfd({:cid => CID, :year => '2014'})["response"]


cand = OpenSecrets::Candidate.new

puts "\n\nCANDIDATE : SUMMARY\n\n"
pp cand.summary({:cid => CID})["response"]

puts "\n\nCANDIDATE : CONTRIBUTORS\n\n"
pp cand.contributors({:cid => CID})["response"]

puts "\n\nCANDIDATE : INDUSTRIES\n\n"
pp cand.industries({:cid => CID})["response"]

puts "\n\nCANDIDATE : CONTRIBUTIONS BY SPECIFIC INDUSTRY\n\n"
pp cand.contributions_by_industry({:cid => CID, :ind => 'K02'})["response"]

puts "\n\nCANDIDATE : SECTOR\n\n"
pp cand.sector({:cid => CID})["response"]


com = OpenSecrets::Committee.new

puts "\n\nCOMMITTEE\n\n"
pp com.by_industry({:cmte => 'HARM', :congno => '113', :indus => 'F10'})["response"]

org = OpenSecrets::Organization.new

puts "\n\nORGANIZATION : GET ORGANIZATIONS\n\n"
pp org.get_orgs({:org => 'people'})["response"]

puts "\n\nORGANIZATION : ORGANIZATION SUMMARY\n\n"
pp org.org_summary({:id => 'D000023248'})["response"]

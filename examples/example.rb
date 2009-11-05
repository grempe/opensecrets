#!/usr/bin/env ruby

require 'rubygems'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib')) # only when running from gem source dir
require 'opensecrets'
require 'crack'
require 'pp'


# For convenience and security you can export an environment variable to hold your API key.
API_KEY = ENV['OPENSECRETS_API_KEY'] ||= 'YOUR_API_KEY'
CID = 'N00007360' # Nancy Pelosi


member = OpenSecrets::Member.new(API_KEY)

puts "\n\nMEMBER : PFD PROFILE\n\n"
pp member.pfd({:cid => CID, :year => '2008'})["response"]

puts "\n\nMEMBER : TRAVEL & TRIPS\n\n"
pp member.trips({:cid => CID, :year => '2008'})["response"]


cand = OpenSecrets::Candidate.new(API_KEY)

puts "\n\nCANDIDATE : SUMMARY\n\n"
pp cand.summary({:cid => CID})["response"]

puts "\n\nCANDIDATE : CONTRIBUTORS\n\n"
pp cand.contributors({:cid => CID})["response"]

puts "\n\nCANDIDATE : INDUSTRIES\n\n"
pp cand.industries({:cid => CID})["response"]

puts "\n\nCANDIDATE : CONTRIBUTIONS BY SPECIFIC INDUSTRY\n\n"
pp cand.contributions_by_industry({:cid => CID, :indcode => 'K01'})["response"]

puts "\n\nCANDIDATE : SECTOR\n\n"
pp cand.sector({:cid => CID})["response"]


com = OpenSecrets::Committee.new(API_KEY)

puts "\n\nCOMMITTEE\n\n"
pp com.by_industry({:cmte => 'HARM', :congno => '110', :indus => 'F10'})["response"]


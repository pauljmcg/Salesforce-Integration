require 'rubygems'
require 'httparty'



class Accounts
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  #debug_output $stderr

  def initialize
	  # @logger = ActiveSupport::BufferedLogger.new("log/development.log")
	end

  def self.set_headers
    # @logger.debug "entering set_headers"
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    # @logger.debug "entering rool_url"
    @root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
  end

  def self.get_first_hundred
    # @logger.debug "entering get_first_hundred"
    # ActiveSupport::BufferedLogger.new("log/development.log").debug "entering get_first_hundred"
    Accounts.set_headers
    ActiveSupport::BufferedLogger.new("log/development.log").debug "entering get_first_hundred"
    get(Accounts.root_url+"/query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
  end
 
end
require 'rubygems'
require 'httparty'



class SalesForceAccount
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  #debug_output $stderr

	def initialize(options = {})
		#@sfdc_token = options[:sfdc_token] if options.include?(:sfdc_token)
		@sfdc_token ||= options[:sfdc_token]
		#@sfdc_instance_url = options[:sfdc_instance_url] if options.include?(:sfdc_instance_url)
		@sfdc_instance_url ||= options[:sfdc_instance_url]
    self.class.headers 'Authorization' => "OAuth #{@sfdc_token}"
    #ActiveSupport::BufferedLogger.new("log/development.log").debug "#{@sfdc_token}, #{@sfdc_instance_url}"
    @root_url = @sfdc_instance_url + "/services/data/v" + ENV['sfdc_api_version']
	end

  def get_first_hundred
    #ActiveSupport::BufferedLogger.new("log/development.log").debug "#{ENV['sfdc_instance_url']}"
    self.class.get(@root_url+"/query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
  end
 
end

#instance can get access to class methods but not other way round


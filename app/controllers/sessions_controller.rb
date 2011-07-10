require 'Accounts'

class SessionsController < ApplicationController
  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']
    #logger.debug "DEBUG sfdc_token:   #{ENV['sfdc_token']}"
    #logger.debug "DEBUG sfdc_instance_url:   #{ENV['sfdc_instance_url']}"
    render :text => request.env['omniauth.auth'].inspect
    #render :text => Accounts.get_first_hundred.inspect
  end

  def fail
	  render :text => "a fuck up"
	end

end

require 'SalesForceAccount'

class SessionsController < ApplicationController
  def create

    #logger.debug "DEBUG sfdc_token:   #{ENV['sfdc_token']}"
    #logger.debug "DEBUG sfdc_instance_url:   #{ENV['sfdc_instance_url']}"
    #render :text => request.env['omniauth.auth'].inspect
    sf = SalesForceAccount.new(:sfdc_token => request.env['omniauth.auth']['credentials']['token'],
                               :sfdc_instance_url => request.env['omniauth.auth']['instance_url'])
    render :text => sf.get_first_hundred.inspect
  end

  def fail
	  render :text => "a fuck up"
	end

end

require 'forcedotcom'

OmniAuth.config.full_host = 'https://localhost:3000'

module OmniAuth
	module Strategies
		autoload :Forcedotcom, 'lib/forcedotcom'
	end
end


Rails.application.config.middleware.use OmniAuth::Builder do
	provider :forcedotcom, '3MVG9yZ.WNe6byQBpSTuF4a1w51N.jC6rNxL_6ExHuRcXSR6UEnZdoer4nDoE0ABVn7aBOWc3RnjFa12TIL4V',
	'9199021462277768989'
end
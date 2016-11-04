Billplz.configure do |config|
  config.api_key = ENV['BILLPLZ_API_KEY']
end

Billplz::Collection.module_eval do
  self.api_url = ENV['BILLPLZ_API'] + '/api/v2/collections'
end

Billplz::Bill.module_eval do
  self.api_url = ENV['BILLPLZ_API'] + '/api/v2/bills'
end

Billplz.configure do |config|
  config.api_key = ENV['BILLPLZ_API_KEY']
end

Billplz::Collection.module_eval do
  self.api_url = ENV['BILLPLZ_API'] + '/api/v3/collections'
end

Billplz::Bill.module_eval do
  self.api_url = ENV['BILLPLZ_API'] + '/api/v3/bills'

  def get
    requires!(@payload, :bill_id)
    @api_url = "#{@api_url}/#{@payload[:bill_id]}"
    request(:get, nil)
    JSON.parse(@response.body) if success?
  end
end

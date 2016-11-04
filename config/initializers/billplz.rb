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
    headers = {
        "Authorization" => "Basic " + Base64.encode64(Billplz.configuration.api_key + ":").strip,
        "Content-Type"  => "application/json",
        "Accept"        => "application/json"
    }
    endpoint =  URI.parse(@api_url)
    @response = http.get(endpoint.request_uri, headers)
    JSON.parse @response.body if @response.is_a?(Net::HTTPOK)
  end
end

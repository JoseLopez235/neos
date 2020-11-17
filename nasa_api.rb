class NasaApi
  def self.conn(date)
      Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
  end

  def self.asteroids_list_data(date)
    conn(date).get('/neo/rest/v1/feed')
  end

  def self.parsed_asteroids_data(date)
    JSON.parse(asteroids_list_data(date).body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end
end

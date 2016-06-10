class GoogleDriveRequest

  attr_reader :coach
  attr_accessor :retries

  def initialize(coach:)
    @coach = coach
    @retries = 2
  end

  def headers
    { 'Authorization' => "OAuth #{coach.google_drive_data['token']}" }
  end

  def get_files
    rsp = HTTParty.get('https://www.googleapis.com/drive/v3/files', headers: headers)
    rsp.to_hash
  end

  # THIS DOESNT WORK. name is never set. dunno why
  def create_file(name)
    response = HTTParty.post(
      "https://www.googleapis.com/drive/v3/files",
      headers: headers.merge('Content-Type' => 'application/json; charset=UTF-8'),
      body: { name: name }
    )
  end

  def refresh!
    response = HTTParty.post(
      "https://www.googleapis.com/oauth2/v3/token",
      body: {
        client_id: ENV['GOOGLE_CLIENT_ID'],
        client_secret: ENV['GOOGLE_CLIENT_SECRET'],
        refresh_token: coach.google_drive_data['refresh_token'],
        grant_type: 'refresh_token'
      }
    )

    if response["access_token"].present?
      existing_data = coach.google_drive_data
      coach.update(google_drive_data: existing_data.merge('token' => response["access_token"]))
    end
  end

  def upload_from_file(filename)
    HTTParty.post(
      "https://www.googleapis.com/upload/drive/v3/files",
      query: { upload_type: "media", convert: true },
      headers: headers.merge('Content-Type' => 'text/csv'),
      body: File.read(filename)
    )
    # NOTE uploads as a doc, and no title, but can be converted to spreadsheet
    # in UI, and works as a table. could update based on id to name
    # not sure how to do spreadsheets with multiple tabs though
  end

  def upload_team_attendance(team:)
    body = team.current_month_attendance_to_csv
    query = { upload_type: "media", convert: true }
    response = post(url: "#{upload_url}/files", body: body, headers: headers.merge('Content-Type' => 'text/csv'), query: query)
    response.try(:[], "id")
  rescue InvalidSession
    # add logging
    return false
  end

  private

  InvalidSession = Class.new StandardError

  def drive_url
    "https://www.googleapis.com/upload/drive/v3"
  end

  def upload_url
    "https://www.googleapis.com/upload/drive/v3"
  end

  def post(url:, body:, query:, headers: headers)
    begin
      response = HTTParty.post(url, headers: headers, query: query, body: body)
      raise InvalidSession if invalid_session_response?(response)
      self.retries = 2 # reset retries if all is well
      return response
    rescue InvalidSession
      if self.retries > 0
        self.retries -= 1
        refresh!
        retry
      else
        # should we do something else here?
        raise
      end
    end
  end

  def invalid_session_response?(response)
    response.try(:[], "error").try(:[], "message") == "Invalid Credentials"
  end

end

class GoogleDriveRequest

  attr_reader :coach

  def initialize(coach:)
    @coach = coach
  end

  def headers
    {
      'Authorization' => "OAuth #{coach.google_drive_data['token']}"
    }
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

  def refresh
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

end

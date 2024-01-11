require 'rest-client'
require 'json'

def get_latest_video_id(api_key, channel_id)
  url = "https://www.googleapis.com/youtube/v3/search?key=#{api_key}&channelId=#{channel_id}&part=snippet&order=date&maxResults=1"
  response = RestClient.get(url)
  data = JSON.parse(response.body)

  if data['items'] && data['items'].any?
    return data['items'][0]['id']['videoId']
  else
    return nil
  end
end

api_key = ENV['YOUTUBE_API_KEY']
channel_id = ENV['CHANNEL_ID']

puts "API Key: #{api_key}"
puts "Channel ID: #{channel_id}"

latest_video_id = get_latest_video_id(api_key, channel_id)

if latest_video_id
  latest_video_url = "https://www.youtube.com/watch?v=#{latest_video_id}"

  # Debug - Print existing content of latest_video.json
  existing_content = File.read('_data/latest_video.json')
  puts "Existing Content of latest_video.json:\n#{existing_content}"

  File.write('_data/latest_video.json', { 'url' => latest_video_url }.to_json)

  puts "Updated latest video URL: #{latest_video_url}"

  # Debug - Print updated content of latest_video.json
  updated_content = File.read('_data/latest_video.json')
  puts "Updated Content of latest_video.json:\n#{updated_content}"
else
  puts "No videos found."
end

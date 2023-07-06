# frozen_string_literal: true

require 'streamio-ffmpeg'

class VideoProcessingJob
  attr_reader :video, :ffmpeg_video, :screenshot_directory

  def initialize(video)
    @video = video
    @ffmpeg_video = FFMPEG::Movie.new(video.path.path)
    @screenshot_directory = "public/uploads/video/path/#{video.id}"
  end

  def perform
    parsed_duration = ffmpeg_video.duration.floor
    ffmpeg_video.screenshot("#{screenshot_directory}/screenshot_%d.jpg", { vframes: parsed_duration, frame_rate: '1' }, validate: false)
    save_screenshots(duration: parsed_duration)
  end

  private

  def save_screenshots(opts)
    Image.insert_all(parsed_screenshot_data(opts[:duration]))
  end

  def parsed_screenshot_data(total_screenshots)
    parsed_screenshot_data = []
    (1..total_screenshots).each do |index|
      parsed_screenshot_data.push(
        video_id: video.id,
        path: "#{screenshot_directory}/screenshot_#{index}.jpg",
        created_at: Time.current,
        updated_at: Time.current
      )
    end
    parsed_screenshot_data
  end
end

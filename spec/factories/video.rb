# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    title { 'Meg 2 Trailer' }
    path { '/path_to_video.mp4' }
  end
end

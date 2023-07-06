# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoProcessingJob do
  let(:ffmpeg_double) { instance_double(FFMPEG::Movie) }
  let(:video) { create :video }

  before do
    allow(FFMPEG::Movie).to receive(:new).and_return(ffmpeg_double)
    allow(ffmpeg_double).to receive(:duration).and_return(10)
    allow(ffmpeg_double).to receive(:screenshot).and_return(true)
  end

  describe '#perform' do
    it 'creates new Images' do
      expect { described_class.new(video).perform }.to change(Image, :count).by(10)
    end

    it 'creates images with the correct attributes' do
      described_class.new(video).perform
      expect(Image.first.path).to eq('public/uploads/video/path/1/screenshot_1.jpg')
    end
  end
end

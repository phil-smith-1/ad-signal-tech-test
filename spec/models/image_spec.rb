require 'rails_helper'

RSpec.describe Image, type: :model do

  let(:video) { create :video }
  subject {
    described_class.new(video_id: video.id, path: 'Anything')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it "is not valid without a video_id" do
    subject.video_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a path" do
    subject.path = nil
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        video_id: 2,
        path: "Path"
      ),
      Image.create!(
        video_id: 2,
        path: "Path"
      )
    ])
  end

  it "renders a list of images" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Path".to_s), count: 2
  end
end

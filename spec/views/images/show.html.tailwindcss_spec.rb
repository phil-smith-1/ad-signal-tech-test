require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    assign(:image, Image.create!(
      video_id: 2,
      path: "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Path/)
  end
end

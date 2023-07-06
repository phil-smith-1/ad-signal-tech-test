require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  let(:image) {
    Image.create!(
      video_id: 1,
      path: "MyString"
    )
  }

  before(:each) do
    assign(:image, image)
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(image), "post" do

      assert_select "input[name=?]", "image[video_id]"

      assert_select "input[name=?]", "image[path]"
    end
  end
end

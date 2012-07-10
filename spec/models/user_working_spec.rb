require 'spec_helper'

describe UserWorking do
  it "a file upload should correctly fill its mount uploader" do
    u = UserWorking.new
    u.avatar = File.open(Rails.root + 'app/assets/images/rails.png')
    u.save!
    u.avatar.url.should include 'rails'

    u.to_json.should include "rails.png"
  end
end
require 'spec_helper'

describe User do
  it "avatar should be exported into the json" do
    u = User.new
    u.avatar = File.open(Rails.root + 'app/assets/images/rails.png')
    u.save!
    u.avatar.url.should include 'rails'
    u.avatar2.url.should be nil

    u.to_json.should include "rails.png"
  end
end


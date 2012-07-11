## json export troubles with carrierwave 0.6.*

When there are two mount_uploader into a model (see User),
and we upload a file, it doesn't appear into the json.


## Running tests

Create the db tables : `env RAILS_ENV=test rake db:migrate`

Run `rspec` in a terminal to see that there is a bug with the User model
that doesn't exist with the UserWorking model.

## The problem

When we upload a file (like rails.png) in an instance of UserWorking (which contain one mount_uploader):

* `irb(main):001:0> u = UserWorking.new`
  `=> #<UserWorking id: nil, username: nil, avatar: nil, created_at: nil, updated_at: nil>`
* `irb(main):002:0> u.avatar = File.open(Rails.root + 'app/assets/images/rails.png')`
  `=> #<File:/private/tmp/my-project/app/assets/images/rails.png>`
* `irb(main):003:0> u.save!`
  `=> true`
* `irb(main):004:0> u.avatar`
  `=> /uploads/user_working/avatar/2/rails.png`
* `irb(main):005:0> u.as_json`
  `=> {"avatar"=>{"url"=>"/uploads/user_working/avatar/2/rails.png", :thumb=>{"url"=>"/uploads/user_working/avatar/2/thumb_rails.png"}}, ...}`

With an instance of User (which contains two mount_uploaders):

* `irb(main):001:0> u = User.new`
  `=> #<User id: nil, username: nil, avatar: nil, avatar2: nil, created_at: nil, updated_at: nil>`
* `irb(main):002:0> u.avatar = File.open(Rails.root + 'app/assets/images/rails.png')`
  `=> #<File:/private/tmp/my-project/app/assets/images/rails.png>`
* `irb(main):003:0> u.save!`
  `=> true`
* `irb(main):004:0> u.avatar`
  `=> /uploads/user/avatar/1/rails.png`
* `irb(main):005:0> u.as_json`
  `=> {"avatar"=>{"url"=>nil, :thumb=>{"url"=>nil}}, "avatar2"=>{"url"=>nil, :thumb=>{"url"=>nil}}, ...}`


See *spec/models/user_spec.rb* and *spec/models/user_working_spec.rb* for details.

Running the tests using carrierwave 0.5.8 will result without any failure.
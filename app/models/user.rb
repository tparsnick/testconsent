class User < ActiveRecord::Base
  attr_accessible :dob, :fname, :lname, :consented_at
end

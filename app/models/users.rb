class User < ActiveRecord::Base
    has_many :signups
    has_many :restaurants, through: :signups
end
class User < ActiveRecord::Base
has_many :appointments
has_many :properties, through: :appointments




end


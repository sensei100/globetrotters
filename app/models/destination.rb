class Destination < ActiveRecord::Base
   validates :name, presence: true,
                     length: { minimum: 4 }
end

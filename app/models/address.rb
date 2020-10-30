class Address < ApplicationRecord
    belongs_to :end_user
    def view_address
        self.zipcode + self.address + self.name
    end
end

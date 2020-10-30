class Order < ApplicationRecord
    enum paymethod: [:credit, :bank]
    enum order_status: [:wait, :confirm, :do, :ready, :finish]
    has_many :order_datails, dependent: :destroy
    belongs_to :end_user
end

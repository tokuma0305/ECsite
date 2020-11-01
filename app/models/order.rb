class Order < ApplicationRecord
    enum paymethod: [:credit, :bank]
    enum order_status: [:wait, :confirm, :do, :ready, :finish]
    has_many :order_details, dependent: :destroy
    accepts_nested_attributes_for :order_details
    belongs_to :end_user
end

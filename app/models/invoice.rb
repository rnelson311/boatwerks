class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :boat
  has_many :invoices
end

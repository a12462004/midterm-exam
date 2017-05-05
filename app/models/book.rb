class Book < ApplicationRecord
  def display_name
    "#{name}"
  end
end

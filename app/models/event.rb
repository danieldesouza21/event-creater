# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  date_time   :date
#  description :text
#  duration    :integer
#  image       :string
#  location    :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#
class Event < ApplicationRecord
end

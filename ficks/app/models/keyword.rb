require 'csv'
class Keyword < ActiveRecord::Base
  validates :title, presence: true

  def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
          keyword = find_by_id(row["id"]) || new 
          keyword.attributes = row.to_hash
          keyword.save!
      end
  end
end

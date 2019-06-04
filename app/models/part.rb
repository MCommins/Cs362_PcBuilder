class Part < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :part, presence: true
  validates :compatibility, presence: true, numericality: { greater_than: 0 }

  belongs_to :account, optional: true

  def self.compatible?(p)
    return true if not p or p.empty?
    parts = p.compact
    parts.uniq(&:compatibility).size <= 1
  end

  def perform(big_dependency)
    big_dependency.execute
    return 42
  end

  def to_s
    "#{name} (#{part}) [#{compatibility}]"
  end
  
end

class Computer < ApplicationRecord
  validates :parts, compatible: true
  serialize :parts

  belongs_to :account, optional: true

  def add_part(part)
    if part == nil
      return "ERROR: Cannot add nothing"
    end

    self.parts << part
    return nil
  end

  def parts_compatible?
    Part.compatible?(parts)
  end

  def sizeOf
    return self.parts.count
  end

  def performanceCheck(big_dependency)
    big_dependency.execute
    return 69
  end
end

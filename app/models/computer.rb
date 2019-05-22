class Computer < ApplicationRecord
  validates :name, presence: true
  validates :owner, presence: true
  #serialize works, validate doesn't. If parts is missing, I get undefined method for the array append (<<)
  validates :parts, presence: true
  serialize :parts
  
  
  def add_part(part)
    if part == nil
	  return "ERROR: Cannot add nothing"
	end
	
    self.parts << part
	return nil
  end
  
  def sizeOf
    return self.parts.count
  end
  
  def valid?(context = nil)
    # uniq is a method on an array that returns unique values
	# if all parts have the same compatability number, then we
	# have a valid PC. if the count of unique vals is greater
	# than 1, there's a part that isn't compatible.
    if (self.parts.uniq{|x| x.compatability}.count > 1)
	  return false
	end
	return true
  end
  
  def performanceCheck(big_dependency)
    big_dependency.execute
    return 69
  end
end

class Computer < ApplicationRecord
  def initialize(list)
    @parts = list
  end
  
  
  def add_part(part)
    if part == nil
	  return "ERROR: Cannot add nothing"
	end
	
    @parts << part
	return nil
  end
  
  def sizeOf
    return @parts.count
  end
  
  def valid?
    # uniq is a method on an array that returns unique values
	# if all parts have the same compatability number, then we
	# have a valid PC. if the count of unique vals is greater
	# than 1, there's a part that isn't compatible.
    if (@parts.uniq{|x| x.compatability}.count > 1)
	  return false
	end
	return true
  end
end

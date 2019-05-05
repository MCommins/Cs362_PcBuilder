class Part < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :part, presence: true
  validates :compatability, presence: true, numericality: { greater_than: 0 }

  def compare (parta, partb)
    if(parta == nil || partb == nil)
      return false;
    else 
      if(parta.name == name || partb.name == name || parta.name == partb.name)
        return false;
      else
        if(parta.part == part || partb.part == part || parta.part == partb.part)
          return false;
        else
          if(parta.compatability != compatability || partb.compatability != compatability || parta.compatability != partb.compatability)
            return false;
          end
        end
      end
    end
    return true;
  end
        
end

=begin


  if(parta == NULL || partb == NULL)
      return false;
    else
      if(parta.name == name || partb.name == name)
        return false;
      else 
        if(parta.part == part || partb.part == part)
          return false;
        else  
          if (parta.compatability == compatability && partb.compatability == compatability)
            return true;
          end
        end
      end
    end
    
    return true;
  end
        
end

=end
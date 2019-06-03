class Part < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :part, presence: true
  validates :compatibility, presence: true, numericality: { greater_than: 0 }

  belongs_to :account, optional: true

  def self.compare_parts(p)
    return true if not p or p.empty?
    parts = p.compact
    #parts.uniq(&:name).size == parts.size &&
    #  parts.uniq(&:part).size == parts.size &&
    parts.uniq(&:compatibility).size <= 1
  end

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
          if(parta.compatibility != compatibility || partb.compatibility != compatibility || parta.compatibility != partb.compatibility)
            return false;
          end
        end
      end
    end
    return true;
  end
        
  def perform(big_dependency)
    big_dependency.execute
    return 42
  end

  def to_s
    "#{name} (#{part}) [#{compatibility}]"
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
          if (parta.compatibility == compatibility && partb.compatibility == compatibility)
            return true;
          end
        end
      end
    end
    
    return true;
  end
        
end

=end

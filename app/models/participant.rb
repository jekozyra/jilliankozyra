# encoding: UTF-8

class Participant < ActiveRecord::Base
  
  default_scope :order => "name"
  
  has_many :answers
  belongs_to :party
  has_and_belongs_to_many :surveys
  
  def both_names
    if self.name and self.original_name
      "#{self.name}/#{self.original_name}"
    else
      if self.name
        self.name
      else
        self.original_name
      end
    end
  end
  

  def participant_greeting
    
    if self.original_name and self.name
      if self.gender
        if self.gender == "m"
          "Шановний Депутат #{self.original_name.split(' ').first}/Уважаемый Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
        elsif self.gender == "f"
          "Шановна Депутат #{self.original_name.split(' ').first}/Уважаемая Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
        else
          "Шановні Депутат #{self.original_name.split(' ').first}/Уважаемые Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
        end
      else
        "Шановні Депутат #{self.original_name.split(' ').first}/Уважаемые Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
      end
    else
      if self.name
        if self.gender
          if self.gender == "m"
            "Шановний Депутат #{self.name.split(' ').first}/Уважаемый Депутат #{self.name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
          elsif self.gender == "f"
            "Шановна Депутат #{self.name.split(' ').first}/Уважаемая Депутат #{self.name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
          else
            "Шановні Депутат #{self.name.split(' ').first}/Уважаемые Депутат #{self.name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
          end
        else
          "Шановні Депутат #{self.name.split(' ').first}/Уважаемые Депутат #{self.name.split(' ').first}/Dear Deputy #{self.name.split(' ').first},"
        end
      else
        if self.gender
          if self.gender == "m"
            "Шановний Депутат #{self.original_name.split(' ').first}/Уважаемый Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.original_name.split(' ').first},"
          elsif self.gender == "f"
            "Шановна Депутат #{self.original_name.split(' ').first}/Уважаемая Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.original_name.split(' ').first},"
          else
            "Шановні Депутат #{self.original_name.split(' ').first}/Уважаемые Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.original_name.split(' ').first},"
          end
        else
          "Шановні Депутат #{self.original_name.split(' ').first}/Уважаемые Депутат #{self.original_name.split(' ').first}/Dear Deputy #{self.original_name.split(' ').first},"
        end
      end
    end  
  end
  
end

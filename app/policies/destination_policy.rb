 class DestinationPolicy < ApplicationPolicy

  def update?
    record.try(:user) == user
  end
  
 end
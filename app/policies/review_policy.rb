 class ReviewPolicy < ApplicationPolicy

  def update?
    record.try(:user) == user
  end
  
 end
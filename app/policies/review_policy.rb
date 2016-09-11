 class ReviewPolicy < ApplicationPolicy

  def destroy
    record.try(:user) == user
  end
  
 end
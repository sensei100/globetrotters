 class CommentPolicy < ApplicationPolicy

   def destroy?
     record.try(:user) == user
   end
 end
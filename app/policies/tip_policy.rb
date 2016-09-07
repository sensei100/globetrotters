  class TipPolicy < ApplicationPolicy
     def update?
       record.try(:user) == user
     end

      def destroy?
       record.try(:user) == user
     end
   end
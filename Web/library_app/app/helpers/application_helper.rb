module ApplicationHelper
      def admin?
          current_user.role_id == 1
      end

      def lib?
          current_user.role_id == 2
      end
end

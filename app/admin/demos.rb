ActiveAdmin.register Demo do
  permit_params :name
  class Demo < ApplicationRecord
  # Your model attributes and other code here
      def self.ransackable_attributes(auth_object = nil)
        # Define the attributes you want to be searchable
        %w[name ] # Add the attribute names you want to search here
      end
  end
end

ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :password, :contact, :address, :department_id, :leavetype_id, :salary_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password, :contact, :address, :department_id, :leavetype_id, :salary_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :password
    column :contact
    column :address
    column :department_id do |obj|
         Department.find(obj.department_id).department_name
    end
    column :salary_id do |obj|
      Salary.find(obj.salary_id).amount
    end
    column :leavetype_id do |obj|
      Leavetype.find(obj.leavetype_id).name
    end
    column :created_at
    actions
  end
 
  show do
    attributes_table do
      row :name
      row :email
      row :password
      row :contact
      row :address
      row :department_id
      row :salary_id
      row :leavetype_id
      row :salary do |resource|
        resource.salary.amount # Assuming there's an amount attribute in the Salary model
      end
      row :department do |resource|
        resource.department.department_name # Assuming there's an amount attribute in the Salary model
      end
      row :leavetype do |resource|
        resource.leavetype.name # Assuming there's an amount attribute in the Salary model
      end
      row :salary_result do |resource|
        resource.salary
      end
      row :department_result do |resource|
        resource.department
      end
      row :leavetype_result do |resource|
        resource.leavetype
      end
    end
  end

  form do |f|
    f.inputs do
      
      f.input :name
      f.input :email
      f.input :password
      f.input :contact
      f.input :address
      f.input :department, as: :select, collection: Department.where.not(department_name: 'admin').map{ |a| [a.department_name, a.id] }
      f.input :leavetype, as: :select, collection: Leavetype.where.not(name: 'admin').map{ |a| [a.name, a.id] }
      f.input :salary, as: :select, collection: Salary.where.not(position: 'admin').map{ |a| [a.position, a.id] }
      
    end
    f.actions
  end
  
  member_action :destroy, method: :delete do
    resource.destroy
  end  
end

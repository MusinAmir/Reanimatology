ActiveAdmin.register User do
  menu label: "Пользователи", priority: 2
  permit_params :email, :name, :irk, :password
  
  controller do
    actions :all, :except => [:destroy]
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :irk
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end

  filter :irk

  form do |f|
    f.inputs "Users" do 
      f.input :email
      f.input :name
      f.input :irk
      f.input :password
      f.input :password_confirmation
    end
    f.actions 
  end
  show do
    panel user.name do
      count = 0
      table_for(user.patients) do |t|
        if count <6
          t.column("Добавленные пациенты") {|item| link_to item .name, admin_patient_path(item)}
          count += 1
        end
      end
      attributes_table do
        row :email
        row :name
        row :irk
        row :current_sign_in_at
        row :sign_in_count
        row :created_at
        row :updated_at

      end
    end
  end
end

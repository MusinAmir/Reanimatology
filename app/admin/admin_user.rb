ActiveAdmin.register AdminUser do
  menu label: "Администраторы", priority: 1
  permit_params :email, :password, :password_confirmation
  
  controller do
    actions :all, :except => [:destroy]
  end
  
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  form do |f|                         
    f.inputs "Admin Details" do       
      if(f.object == current_admin_user)
        f.input :email
        f.input :password               
        f.input :password_confirmation
      else
        f.label :inaccessible
      end
    end                               
    f.actions                         
  end            

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at


end

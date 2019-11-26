ActiveAdmin.register Instance do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :instance_url, :username, :password, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :instance_url, :username, :password, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  form do |f|
    f.inputs do
      f.input :customer_id,as: :select, collection: Customer.select(:id,:name)
      f.input :name
      f.input :instance_url, label: "Instance URL"
      f.input :wsdl_url, label: "WSDL URL"
      f.input :username
      f.input :password
    end
    f.actions

  end



  permit_params do
    permitted = [:name, :instance_url, :username, :password, :customer_id, :wsdl_url]
    permitted
  end  
  
end

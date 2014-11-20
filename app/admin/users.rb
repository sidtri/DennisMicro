ActiveAdmin.register User do
  actions :index, :show
  index do                            
    column :email                     
    column :referral_code     
    column :created_at
    column :joined do |user|
    	user.referrals.count
    end
	default_actions                   
  end                                 

end

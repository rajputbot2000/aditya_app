json.extract! user_profile, :id, :full_name, :email, :mobile_number, :gender, :location, :occupation, :birth_date, :profile_pic, :user_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)

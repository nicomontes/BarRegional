json.extract! user, :id, :firstName, :lastName, :alias, :password, :initAmount, :amount, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
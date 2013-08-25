FactoryGirl.define do 
	factory :user do
		name "test"
		sequence(:email) {|n| "test#{n}@test.com.br" }
		password "test"
		password_confirmation "test"
	end

end
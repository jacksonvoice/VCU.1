FactoryGirl.define do 
	factory :course do
		name "technique"


		factory :invalid_course do
			name nil
		end
	end
end
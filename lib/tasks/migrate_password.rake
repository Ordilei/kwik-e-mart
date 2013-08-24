desc "Migrate password for gem bcrypt"

task :migrate_passwords => :environment do
	User.transaction do
		User.find_each do |user|
			user.update_column(
				:password_digest,
				BCrypt::password.create(user.read_attribute.(:password))
				)
		end
	end
end
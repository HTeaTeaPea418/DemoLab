title 'Accounts'

usernames = ["admin", "asrep.user", "regular.user", "roast.user"]
usernames.each do |name|
    describe user("#{name}") do
        it { should exist }
    end
end
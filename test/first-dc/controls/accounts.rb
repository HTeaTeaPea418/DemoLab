title 'Accounts'

usernames = ["admin", "asrep.user", "clearpass.user", "compwrite.user", "constrained.user", "dnsadmin.user", "gpowrite.user", "groupwrite.user", "regular.user", "roast.user", "unconstrained.user", "userall.user", "userwrite.user", "writedacldc.user", "readgmsa.user", "lapsread.user"]
usernames.each do |name|
    describe user("#{name}") do
        it { should exist }
    end
end
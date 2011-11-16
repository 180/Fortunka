# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create :email => 'maciek@dot.com',
  :password=> 'maciek', :password_confirmation => 'maciek',
  :roles => [:author]
User.create :email => 'admin@admins.net',
  :password=> 'admin', :password_confirmation => 'admin',
  :roles => [:admin]
User.create :email => 'login@email.com',
  :password=> 'qwerty', :password_confirmation => 'qwerty',
  :roles => [:moderator]
User.create :email => 'devil@hell.com',
  :password=> '123456', :password_confirmation => '123456',
  :roles => [:banned]



fortunes = File.readlines(Rails.root.join('db', 'fortunes.u8'), "\n%\n")
fortunes.map do |f|
  reg = /\t?(.+)\n\t\t--\s*(.*)\n%\n/m
  m = f.match(reg)
  if m
    Fortune.create :body => m[1], :author => m[2]
  else
    Fortune.create :body => f[0..-4], :author => Faker::Name.name
  end
end

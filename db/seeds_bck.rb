# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.
user = User.new
user.name = 'Sys admin'
user.phone_no = '93148325'
user.role = 0
user.email = 'sys.admin@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'CIC Staff 1'
user.phone_no = '93148325'
user.role = 1
user.email = 'CIC01@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'CIC Staff 2'
user.phone_no = '93148325'
user.role = 1
user.email = 'CIC02@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
#
user = User.new
user.name = 'Alvin Ma'
user.phone_no = '93148325'
user.role = 2
user.email = 'alvin.ma@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Andy Lee'
user.phone_no = '93148325'
user.role = 2
user.email = 'andy.lee@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Chui Ka Kin'
user.phone_no = '93148325'
user.role = 2
user.email = 'chui.ka.kin@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Yip Kai Wah'
user.phone_no = '93148325'
user.role = 2
user.email = 'yip.kai.wah@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Cheung Kam Kit'
user.phone_no = '93148325'
user.role = 2
user.email = 'cheung.kam.kit@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Wong Cham Kit'
user.phone_no = '93148325'
user.role = 2
user.email = 'wong.cham.kit@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Chau Pui Yee'
user.phone_no = '93148325'
user.role = 2
user.email = 'Chau.pui.yee@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Lui Ming Ho'
user.phone_no = '93148325'
user.role = 2
user.email = 'lui.ming.ho@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Law Lok Tung'
user.phone_no = '93148325'
user.role = 2
user.email = 'law.lok.tung@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Tsui Che Yin'
user.phone_no = '93148325'
user.role = 2
user.email = 'tsui.che.yin@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Garbel'
user.phone_no = '93148325'
user.role = 2
user.email = 'garbel@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Hana'
user.phone_no = '93148325'
user.role = 2
user.email = 'hana@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Mo'
user.phone_no = '93148325'
user.role = 2
user.email = 'mo@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
#
user = User.new
user.name = 'Ho Shui Keung'
user.phone_no = '93148325'
user.role = 3
user.email = 'ho.shui.keung@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Ho Siu Wai'
user.phone_no = '93148325'
user.role = 3
user.email = 'ho.sui.wai@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Ricky Yiu'
user.phone_no = '93148325'
user.role = 3
user.email = 'ricky.yiu@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Yau Tzs Kin'
user.phone_no = '93148325'
user.role = 3
user.email = 'yau.tzs.kin@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Geung Wing On'
user.phone_no = '93148325'
user.role = 3
user.email = 'geung.wing.on@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
#
user = User.new
user.name = 'Central'
user.phone_no = '93148325'
user.role = 4
user.email = 'central@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Western'
user.phone_no = '93148325'
user.role = 4
user.email = 'western@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Wan Chai'
user.phone_no = '93148325'
user.role = 4
user.email = 'wan.chai@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Peak'
user.phone_no = '93148325'
user.role = 4
user.email = 'peak@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Happy Valley'
user.phone_no = '93148325'
user.role = 4
user.email = 'happy.valley@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'North Point'
user.phone_no = '93148325'
user.role = 4
user.email = 'north.point@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Southeast'
user.phone_no = '93148325'
user.role = 4
user.email = 'Southeast@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Southwest'
user.phone_no = '93148325'
user.role = 4
user.email = 'Southwest@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Eastern'
user.phone_no = '93148325'
user.role = 4
user.email = 'Eastern@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!

user = User.new
user.name = 'Alvin'
user.phone_no = '93148325'
user.role = 2
user.email = 'alvin@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'William Kwok'
user.phone_no = '93148325'
user.role = 2
user.email = 'william.kwok@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
user = User.new
user.name = 'Riz Cheung'
user.phone_no = '93148325'
user.role = 2
user.email = 'rizcheng78@gmail.com'
user.password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.encrypted_password = '$2a$11$ikFQL9l7Q2raTSw8ISMePOiXturjQooQnbyzvV/qy98ZmmSxf/ehy'
user.confirmed_at = Time.now
user.save!
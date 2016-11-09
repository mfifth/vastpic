unless User.exists?(email: "admin@vastpic.com")
	User.create!(email: "admin@vastpic.com", password: "pa55w0rd", first_name: "Matt", last_name: "Quinto", admin: true)
end

unless User.exists?(email: "user@vastpic.com")
	User.create!(email: "user@vastpic.com", password: "password")
end

Picture.create!(image_url: File.open('/home/matt/Pictures/img_photos/vastpic/AroundTheBend.jpg'))
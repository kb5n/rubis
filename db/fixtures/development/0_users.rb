User.seed do |s|
  s.id = 1
  s.name = "Administrator"
  s.email = "admin@example.com"
  s.crypted_password = '$2a$10$/aDFQVTtyLbC/gBL.JW1nuM2sZCJ7oHpz/m5txggSwQVMsoCjtbK6'
  s.salt = 's5iDUFCErCjbt7pD5rkQ'
end

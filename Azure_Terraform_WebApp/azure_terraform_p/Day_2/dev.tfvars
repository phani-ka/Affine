env = "dev"

ports = [
  { name = "ssh", port = "22", priority = 100 },
  { name = "http", port = "80", priority = 102 },
  { name = "tomcat", port = "8080", priority = 103},
  { name = "https", port = "443", priority = 104 }
]
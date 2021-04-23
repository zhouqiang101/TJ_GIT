
local config = {
	dev_mac = nil,
	dev_model = "",
	dev_ip = "",
	net_mode = "LINE",
	device_type = "HL-BOX-B003",
	dev_gateway = "192.168.1.1",
	dev_subnet_mask = "255.255.255.0",
	dev_dns = "192.168.1.1",
	soft_ver = "0.0.0",
	hardware_ver = "0.0",
	cache_server = nil,
	cache_server_running = false,
	api_host = "https://api.heardlearn.net",
	--api_host = "http://api-test.heardlearn.net:80",
	--api_host = "http://api-dev.heardlearn.net:8080",
	itc_host = "127.0.0.1",
	itc_user = "admin",
	itc_pass = "123456",
	tasks_path = "null",
	led_ip_and_port= "http://172.16.17.250:8081",
    cache_path = nil, --ip77 "d:\\hl_agent\\cache"
    cache_clean_size = 1000
}

local fp = io.open("./version")
config.soft_ver = fp:read("*l")
fp:close()
print("set soft_ver:",config.soft_ver)

return config

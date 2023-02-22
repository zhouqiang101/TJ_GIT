package.path = package.path .. ";./libs/?.lua;./lua/?.lua"
package.cpath = package.cpath .. ";./libs_x86/?.so;./libs/?.so"
local ftp = require("socket.ftp")
local ltn12 = require("ltn12")
f, e = ftp.put{host = "159.65.195.153", user = "hl", password = "147159", command="appe", argument=arg[1], source=ltn12.source.file(io.open(arg[1], "r"))}
print(f, e)

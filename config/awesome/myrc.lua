vicious = require("vicious")

awful.util.spawn_with_shell("killall compton")
awful.util.spawn_with_shell("compton -f -i 0.8 &")

-- {{{ Tags
tags = {}

scount = screen.count()
for s = 1, scount do
	if scount == 1 then
		tags[s] = awful.tag({ " Bash ", " Chrome ", " IRC ", " VIM ", " Misc " }, s, layouts[1])
	end
	if scount == 2 then
		if s == 1 then
			tags[s] = awful.tag({" C.h.r.o.m.e     ", " I.R.C     ", "V.I.M     ", " M.i.s.c     " }, s, layouts[1])
		end
		if s == 2 then
			tags[s] = awful.tag({ " B.a.s.h     ", "V.I.M     ", "M.i.s.c    " }, s, layouts[1])
		end
	end
end
-- }}}

-- {{{ Initialize widget
-- vicious.register(widget, wtype, format, interval, warg)

-- Battery
batwidget = widget({ type = 'textbox', })
vicious.register(batwidget, vicious.widgets.bat, "$2 $1", 10, "BAT0")

-- Volume
volwidget = widget({ type = 'textbox'})
vicious.register(volwidget, vicious.widgets.volume, "$1$2", 1, "Master")

-- Uptime
uptimewidget = widget({ type = 'textbox', })
vicious.register(uptimewidget, vicious.widgets.uptime, "load: $4 | up: $1d, $2:$3", 2)

-- Memory usage
memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem, "mem: $1%", 2)

-- Cpu usage
cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu, "cpu: $1%", 2)

-- {{{ CPU temperature
thermalwidget = widget({ type = "textbox" })
vicious.register(thermalwidget, vicious.widgets.thermal, " $1°C", 20, { "coretemp.0", "core"} )
-- }}}

-- Network
netwidget = widget({ type = 'textbox' })
function get_netspeed()
    local netspeed = {}
    local deviceinfo = vicious.widgets.net()
    for device in io.popen("ip route | awk '/default/ {print $5}' "):lines() do
        netspeed['{down_kb}'] = (netspeed['{down_kb}'] or 0) + deviceinfo['{' .. device .. " " .. "down_kb" .. '}']
        netspeed['{up_kb}'] = (netspeed['{up_kb}'] or 0) + deviceinfo['{' .. device .. " " .. "up_kb" .. '}']
	netspeed['{device}'] = device
    end
    return netspeed
end
vicious.register(netwidget, get_netspeed, "${device}: ${down_kb} kb↓  ${up_kb} kb↑", 1)

-- }}}


-- Private decoration
myseperator= widget({ type = "textbox" })
myseperator.text = " | "

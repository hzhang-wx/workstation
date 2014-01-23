vicious = require("vicious")

awful.util.spawn_with_shell("killall compton")
awful.util.spawn_with_shell("compton -f -i 0.8 &")

-- {{{ Tags
tags = {}

scount = screen.count()
for s = 1, scount do
	if scount == 1 then
		tags[s] = awful.tag({ " B.a.s.h ", " C.h.r.o.m.e ", " I.R.C ", " V.I.M ", " M.i.s.c " }, s, layouts[1])
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

-- Battery
batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, "$2 $1", 10, "BAT0")

-- Volume
volwidget = wibox.widget.textbox()
vicious.register(volwidget, vicious.widgets.volume, "$1$2", 1, "Master")

-- Uptime
uptimewidget = wibox.widget.textbox()
vicious.register(uptimewidget, vicious.widgets.uptime, "load: $4 | up: $1d, $2:$3", 2)

-- Memory usage
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "mem: $1%", 2)

-- Cpu usage
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "cpu: $1%", 2)

-- CPU temperature
thermalwidget = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, " $1°C", 2, { "coretemp.0", "core"} )

-- Private decoration
myseperator= wibox.widget.textbox()
myseperator:set_text(" | ")

-- }}}

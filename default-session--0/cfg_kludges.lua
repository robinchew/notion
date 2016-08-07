defwinprop{
    class = "Xfce-terminal",
    target = 'ws2a',
    oneshot = true,
}

defwinprop{
    class = "Chromium",
    instance = 'chromium',
    target = 'ws1a',
    oneshot = true,
}

defwinprop{
    class = "Pidgin",
    target = 'ws3a',
}

defwinprop{
    class = "cantata",
    target = 'ws3a',
}

defwinprop{
    --name = "Untitled",
    target = 'ws3c',
    --switchto = false,

    match = function(prop, cwin, winattrs)
        --ioncore.exec('echo "|+'.. winattrs.instance .. '|" >> ~/t.txt')
        return string.find(winattrs.instance, 'chromium%-browser %(/tmp') ~= nil
    end

}

-- Open Pale Moon browser window in background
defwinprop{
    class = "Pale moon",
    switchto = false,
}

--
-- Options to get some programs work more nicely (or at all)
--


defwinprop{
    class = "AcroRead",
    instance = "documentShell",
    acrobatic = true
}


defwinprop{
    class = "Xpdf",
    instance = "openDialog_popup",
    ignore_cfgrq = true,
}

-- Floating windows
--
defwinprop{
    class = "Xfce4-screenshooter",
    float = true,
}

--defwinprop{
--    name = 'Copying',
--    float = true,
--}

defwinprop{
    name = 'Moving',
    float = true,
}

-- Better would be to apply these settings automatically whenever a window
-- has type _NET_WM_WINDOW_TYPE_NOTIFICATION
defwinprop{
        class = "Xfce4-notifyd",
        float = true,
        userpos = true,
        switchto = false,
}

-- Put all dockapps in the statusbar's systray, also adding the missing
-- size hints necessary for this to work.
defwinprop{
    is_dockapp = true,
    statusbar = "systray",
    --max_size = { w = 64, h = 64},
    --min_size = { w = 64, h = 64},
}

-- Make an exception for Docker, which sets correct size hints.
defwinprop{
    is_dockapp = true,
    class = "Docker",
    statusbar = "systray",
}

-- https://sourceforge.net/tracker/?func=detail&aid=3471910&group_id=314802&atid=1324528
defwinprop{ 
    class = "Gimp", 
    acrobatic = true,
}
defwinprop{ 
    class = "Gimp-2.8", 
    acrobatic = true,
}


-- You might want to enable these if you really must use XMMS. 
--[[
defwinprop{
    class = "xmms",
    instance = "XMMS_Playlist",
    transient_mode = "off"
}

defwinprop{
    class = "xmms",
    instance = "XMMS_Player",
    transient_mode = "off"
}
--]]



-- Define some additional title shortening rules to use when the full
-- title doesn't fit in the available space. The first-defined matching
-- rule that succeeds in making the title short enough is used.
ioncore.defshortening("^Terminal - ([^ ]*) \\+ \\(.*/([^/ ]+)\\)", "{+} $2/$1", true)
ioncore.defshortening("^Terminal - ([^ ]*) \\(.*/([^/ ]+)\\)", "{} $2/$1", true)
ioncore.defshortening("^Terminal - .*[/:]([^/]+/[^/]+)$", "$1", true)
ioncore.defshortening("(.{0,20}).* - Chromium", "$1", true)
--[[
ioncore.defshortening("(.*) - Mozilla(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*) - Mozilla", "$1$|$1$<...")
ioncore.defshortening("XMMS - (.*)", "$1$|...$>$1")
ioncore.defshortening("[^:]+: (.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("[^:]+: (.*)", "$1$|$1$<...")
ioncore.defshortening("(.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*)", "$1$|$1$<...")
--]]

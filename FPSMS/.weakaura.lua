{
    ["outline"] = true,
    ["fontSize"] = 12,
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["displayText"] = "%c",
    ["customText"] = "function()\n    -- Setup these variables, because Actions -> On Show seems to load AFTER this  (why?)\n    local color = \"\"\n    local goodColor = WA_FPSMS_GOOD_COLOR or color\n    local medColor = WA_FPSMS_MEDIUM_COLOR or color\n    local badColor = WA_FPSMS_BAD_COLOR or color\n    local fpsHighThresh = WA_FPSMS_FPS_HIGH or 0\n    local fpsMedThresh = WA_FPSMS_FPS_MEDIUM or 0\n    local msHighThresh = WA_FPSMS_MS_HIGH or 0\n    local msMedThresh = WA_FPSMS_MS_MEDIUM or 0\n    \n    -- Color FPS based on value (higher is better)\n    local fpsColor = color\n    if WA_FPSMS_FPS  < fpsHighThresh then\n        if WA_FPSMS_FPS < fpsMedThresh then\n            fpsColor = badColor\n        else\n            fpsColor = medColor\n        end\n    else\n        fpsColor = goodColor\n    end\n    \n    -- Color MS based on value (lower is better)\n    local msColor = color\n    if WA_FPSMS_MS > msMedThresh then\n        if WA_FPSMS_MS > msHighThresh then\n            msColor = badColor\n        else\n            msColor = medColor\n        end\n    else\n        msColor = goodColor\n    end\n    \n    return \"FPS: \" .. fpsColor ..floor(WA_FPSMS_FPS) .. \"  MS: \" .. msColor .. WA_FPSMS_MS\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
    ["yOffset"] = 0,
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "update",
    ["actions"] = {
        ["start"] = {
            ["do_glow"] = false,
            ["custom"] = "-- How often to update the display (in seconds)\nWA_FPSMS_RATE = 1\n\n-- Threshold for text coloring\nWA_FPSMS_FPS_HIGH = 90\nWA_FPSMS_FPS_MEDIUM = 60\n\nWA_FPSMS_MS_HIGH = 200\nWA_FPSMS_MS_MEDIUM = 100\n\n\n-- State-dependent coloring of text (Good = High FPS / Low MS)\nWA_FPSMS_GOOD_COLOR = \"\"\nWA_FPSMS_MEDIUM_COLOR = \"\"\nWA_FPSMS_BAD_COLOR = \"\"\n\n\n\n\n-- DONT TOUCH\nWA_FPSMS_LAST_UPDATE = 0",
            ["do_sound"] = false,
            ["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
            ["do_custom"] = true,
            ["glow_frame"] = "WeakAuras:UI_Datatexts",
        },
        ["finish"] = {
        },
    },
    ["regionType"] = "text",
    ["parent"] = "UI_Datatexts",
    ["id"] = "FPSMS",
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["additional_triggers"] = {
    },
    ["untrigger"] = {
    },
    ["frameStrata"] = 1,
    ["width"] = 92.952391060666,
    ["xOffset"] = 0,
    ["font"] = "Expressway",
    ["numTriggers"] = 1,
    ["animation"] = {
        ["start"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
        ["main"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
        ["finish"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
    },
    ["height"] = 12.190477336777,
    ["trigger"] = {
        ["type"] = "custom",
        ["debuffType"] = "HELPFUL",
        ["subeventSuffix"] = "_CAST_START",
        ["subeventPrefix"] = "SPELL",
        ["names"] = {
        },
        ["event"] = "Conditions",
        ["use_unit"] = true,
        ["unit"] = "player",
        ["events"] = "WA_DELAYED_PLAYER_ENTERING_WORLD, PLAYER_LOGIN, CHAT_MSG_CHANNEL",
        ["custom"] = "function()\n    local rate = WA_FPSMS_RATE or 1 -- Polling rate\n    local currentTime = GetTime()        -- Current time (used for polling interval)\n    local lastUpdate = WA_FPSMS_LAST_UPDATE or 0 -- Timestamp of last update\n    \n    -- Only update every N seconds (defined by WA_FPSMS_RATE)\n    if currentTime - rate > lastUpdate then\n        WA_FPSMS_FPS  = floor(GetFramerate())\n        _, _, WA_FPSMS_MS, _ = GetNetStats()\n        WA_FPSMS_LAST_UPDATE = currentTime\n        return true -- Update display with new values\n    end\n    \n    return false -- Don't update display\n    \nend",
        ["custom_type"] = "status",
        ["check"] = "update",
        ["use_alive"] = true,
        ["unevent"] = "auto",
        ["custom_hide"] = "timed",
    },
    ["load"] = {
        ["role"] = {
            ["multi"] = {
            },
        },
        ["use_never"] = false,
        ["spec"] = {
            ["multi"] = {
            },
        },
        ["class"] = {
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
            },
        },
    },
    ["disjunctive"] = true,
}
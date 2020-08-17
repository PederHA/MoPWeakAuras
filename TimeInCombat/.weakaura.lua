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
    ["customText"] = "function()\n    if WA_TIC_COMBAT then\n        local time = GetTime() - WA_TIC_START_TIME\n        local _,  decimals = strsplit(\".\", tostring(time), 2)\n        \n        if decimals then\n            decimals = strsub(decimals, 1, 2)\n        else\n            decimals = \"00\"\n        end\n        \n        return \"Combat: \" .. date(\"%M:%S\", time) .. \":\" .. strsub(decimals, 1, 2)     \n    else\n        return \"Not In Combat\"\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
    ["yOffset"] = -535,
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "update",
    ["actions"] = {
        ["start"] = {
            ["do_custom"] = true,
            ["custom"] = "WA_TIC_COMBAT = WA_TIC_COMBAT or false\nWA_TIC_START_TIME = WA_TIC_START_TIME or 0",
        },
        ["finish"] = {
            ["do_custom"] = true,
            ["custom"] = "WA_TIC_ACTIVE = false\nWA_TIC_START_TIME = 0",
        },
    },
    ["regionType"] = "text",
    ["parent"] = "UI_Datatexts",
    ["additional_triggers"] = {
        [1] = {
            ["trigger"] = {
                ["unit"] = "player",
                ["type"] = "status",
                ["use_unit"] = true,
                ["subeventSuffix"] = "_CAST_START",
                ["unevent"] = "auto",
                ["use_alive"] = true,
                ["event"] = "Conditions",
                ["subeventPrefix"] = "SPELL",
            },
            ["untrigger"] = {
            },
        },
    },
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["trigger"] = {
        ["type"] = "custom",
        ["subeventSuffix"] = "_CAST_START",
        ["debuffType"] = "HELPFUL",
        ["names"] = {
        },
        ["event"] = "Health",
        ["unit"] = "player",
        ["subeventPrefix"] = "SPELL",
        ["customName"] = "\n\n",
        ["custom"] = "function(event_name, ...)\n    -- Init display upon entering combat\n    if event_name == \"PLAYER_REGEN_DISABLED\" then\n        WA_TIC_COMBAT = true\n        WA_TIC_START_TIME = GetTime()\n    elseif event_name == \"PLAYER_REGEN_ENABLED\" then\n        WA_TIC_COMBAT = false\n    end\n    return true\nend",
        ["unevent"] = "auto",
        ["use_unit"] = true,
        ["events"] = "PLAYER_REGEN_DISABLED, PLAYER_REGEN_ENABLED, WA_DELAYED_PLAYER_ENTERING_WORLD",
        ["custom_type"] = "event",
        ["custom_hide"] = "custom",
    },
    ["untrigger"] = {
        ["custom"] = "\n\n\n\n\n\n\n",
    },
    ["frameStrata"] = 1,
    ["width"] = 83.809553300707,
    ["xOffset"] = 0,
    ["font"] = "Expressway",
    ["numTriggers"] = 2,
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
    ["height"] = 12.190433568943,
    ["id"] = "TimeInCombat",
    ["load"] = {
        ["class"] = {
            ["multi"] = {
            },
        },
        ["role"] = {
            ["multi"] = {
            },
        },
        ["spec"] = {
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
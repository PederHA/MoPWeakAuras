{
    ["outline"] = true,
    ["fontSize"] = 13,
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["displayText"] = "%c",
    ["customText"] = "function()\n    local procs = WA_LNL_PROCS or 1 -- Avoid division by 0 error if we dip out of combat and counter resets\n    local casts = WA_LNL_CASTS or 0    \n    local cpp = 0\n    \n    WA_LNL_OUTSTR = \"\" -- Used for both WA text display and chat summary\n    \n    -- Procs\n    if WA_LNL_SHOW_PROCS then\n        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. \"Procs:            \" .. WA_LNL_PROCS .. \"\\n\"\n    end\n    \n    -- Casts\n    if WA_LNL_SHOW_CASTS then\n        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. \"Casts:            \" .. casts .. \"\\n\"\n    end\n    \n    -- Casts per Proc\n    if WA_LNL_SHOW_CPP then\n        if casts > 0 then\n            cpp = ((\"%%.%df\"):format(2)):format(casts / procs)\n        end\n        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. \"Casts/Proc:     \" .. cpp .. \"\\n\"\n    end\n    \n    -- Current Streak\n    if WA_LNL_SHOW_STREAK then\n        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. \"Current streak: \" .. WA_LNL_STREAK .. \"\\n\"\n    end\n    \n    -- Best Streak\n    if WA_LNL_SHOW_BEST_STREAK then\n        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. \"Best streak:    \" .. WA_LNL_BEST_STREAK .. \"\\n\"\n    end \n    \n    -- Title (Shown first)\n    if WA_LNL_SHOW_TITLE then\n        return WA_LNL_TITLE .. \"\\n\" .. WA_LNL_OUTSTR\n    else\n        return WA_LNL_OUTSTR\n    end\nend",
    ["untrigger"] = {
        ["custom"] = "function(event, ...)\n    if event == \"PLAYER_REGEN_ENABLED\" then        \n        return true        \n    end\n    return false\nend",
    },
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "event",
    ["actions"] = {
        ["start"] = {
            ["do_custom"] = true,
            ["custom"] = "-- Show title\nWA_LNL_SHOW_TITLE = true\nWA_LNL_TITLE = \"T16 LnL Tracker\"\n\n-- Show number of procs\nWA_LNL_SHOW_PROCS = false\n\n-- Show number of explosive shot casts during Lock and Load\nWA_LNL_SHOW_CASTS = false\n\n-- Show casts per proc\nWA_LNL_SHOW_CPP = true\n\n-- Show current streak\nWA_LNL_SHOW_STREAK = false\n\n-- Show best streak\nWA_LNL_SHOW_BEST_STREAK = true\n\n-- Print post-fight summary\nWA_LNL_PRINT_SUMMARY = true\nWA_LNL_SUMMARY_DELAY = 2 -- Delay it N seconds to not be obscured by 25 achievements etc.\nWA_LNL_MIN_FIGHT_DURATION = 60 -- Minimum fight duration required to post summary\n\n\n------------------------------------------------\n-- DONT TOUCH\n------------------------------------------------\nWA_LNL_PROCS = WA_LNL_PROCS or 0\nWA_LNL_CASTS = WA_LNL_CASTS or 0\nWA_LNL_STREAK = WA_LNL_STREAK or 0\nWA_LNL_BEST_STREAK = WA_LNL_BEST_STREAK or 0\nWA_LNL_OUTSTR = \"\" -- ?\n\n\n",
        },
        ["finish"] = {
            ["do_custom"] = true,
            ["custom"] = "--[[ \nWhen ending raid fights, there seems to be a bug where you rapidly go in and out of combat multiple times,\nwhich ends up overwriting the WA_LNL_OUTSTR global variable. If we just check whether or not we got any procs, we can avoid overwriting it by discarding results from these bugged fights that occur.\n\nNOTE: This is all necessary due to delaying the printing by N seconds. If we had printed right away, we wouldn't have to worry about this.\n]]--\n\nif WA_LNL_PROCS > 0 and WA_LNL_OUTSTR then\n    WA_LNL_POSTFIGHT_STR = WA_LNL_OUTSTR\nend\n\nfunction printSummary()\n    \n    if WA_LNL_PRINT_SUMMARY then\n        -- Don't attempt to print summary if WA_LNL_OUTSTR is not defined\n        if WA_LNL_POSTFIGHT_STR then  \n            \n            local out = WA_LNL_POSTFIGHT_STR\n            \n            out = WA_LNL_TITLE .. \" Summary\\n\" .. \"--------------------\\n\" .. out .. \"--------------------\"\n            print(out)      \n            \n        end\n        \n    end\nend\n\n\nif GetTime() > WA_LNL_FIGHT_START + WA_LNL_MIN_FIGHT_DURATION then    \n    WeakAurasTimers:ScheduleTimer(printSummary, WA_LNL_SUMMARY_DELAY) \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
        },
    },
    ["trigger"] = {
        ["duration"] = "40",
        ["subeventPrefix"] = "SPELL",
        ["use_auraType"] = true,
        ["debuffType"] = "HELPFUL",
        ["custom_hide"] = "custom",
        ["type"] = "custom",
        ["unit"] = "player",
        ["unevent"] = "timed",
        ["subeventSuffix"] = "_AURA_APPLIED",
        ["auraType"] = "BUFF",
        ["event"] = "Combat Log",
        ["custom"] = "function(event_name, _, event, _, sourceGUID, _, _, _, _, _, _, _, _, spellName, ...)\n    -- Init display upon entering combat\n    if event_name == \"PLAYER_REGEN_DISABLED\" then\n        WA_LNL_PROCS = 0\n        WA_LNL_CASTS = 0\n        WA_LNL_STREAK = 0\n        WA_LNL_BEST_STREAK = 0\n        WA_LNL_FIGHT_START = GetTime()\n        return true \n    end\n    \n    if sourceGUID ~= UnitGUID(\"player\") then\n        return false -- We only care about our own actions\n    end\n    \n    -- Check for Explosive Shots casts with LnL active\n    if event == \"SPELL_CAST_SUCCESS\" then\n        \n        if spellName == \"Explosive Shot\" and UnitBuff(\"player\", \"Lock and Load\") then\n            WA_LNL_CASTS = WA_LNL_CASTS + 1\n            WA_LNL_STREAK = WA_LNL_STREAK + 1\n            \n            if WA_LNL_STREAK > WA_LNL_BEST_STREAK then\n                WA_LNL_BEST_STREAK = WA_LNL_STREAK\n            end\n            \n            -- Fix weird bug where counter resets (probably training dummy related)\n            if WA_LNL_PROCS == 0 then\n                WA_LNL_PROCS = 1\n            end\n            \n            return true\n            \n        end\n        \n    end\n    \n    -- Check for LnL Procs\n    if event == \"SPELL_AURA_APPLIED\" then\n        \n        if spellName == \"Lock and Load\" then\n            WA_LNL_PROCS = WA_LNL_PROCS + 1\n            return true\n        end\n        \n    end\n    \n    -- Check for loss of LnL buff (reset streak)\n    if event == \"SPELL_AURA_REMOVED\" then\n        \n        if spellName == \"Lock and Load\" then\n            WA_LNL_STREAK = 0\n            return true\n        end\n        \n    end\n    \n    return false\n    \nend",
        ["custom_type"] = "event",
        ["use_spellName"] = true,
        ["events"] = "COMBAT_LOG_EVENT_UNFILTERED, COMBAT_LOG_EVENT, PLAYER_REGEN_DISABLED, PLAYER_REGEN_ENABLED",
        ["use_sourceunit"] = false,
        ["use_destunit"] = true,
        ["names"] = {
        },
        ["spellName"] = "Lock and Load",
        ["destunit"] = "player",
    },
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["additional_triggers"] = {
    },
    ["yOffset"] = -273.52451788535,
    ["frameStrata"] = 1,
    ["width"] = 8.5333269140511,
    ["animation"] = {
        ["start"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
        ["main"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
        ["finish"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
    },
    ["font"] = "Expressway",
    ["numTriggers"] = 1,
    ["xOffset"] = -415.23842438262,
    ["height"] = 12.800002407231,
    ["id"] = "LnLTracker",
    ["load"] = {
        ["use_class"] = true,
        ["role"] = {
            ["multi"] = {
            },
        },
        ["use_never"] = false,
        ["use_spec"] = true,
        ["use_combat"] = true,
        ["spec"] = {
            ["single"] = 3,
            ["multi"] = {
            },
        },
        ["class"] = {
            ["single"] = "HUNTER",
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
                ["flexible"] = true,
                ["ten"] = true,
                ["twentyfive"] = true,
                ["twenty"] = true,
                ["fortyman"] = true,
            },
        },
    },
    ["regionType"] = "text",
}
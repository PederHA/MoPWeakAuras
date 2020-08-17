{
    ["outline"] = true,
    ["fontSize"] = 16,
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["displayText"] = "%c",
    ["customText"] = "function()\n    local absorb = UnitGetTotalAbsorbs(\"player\")\n    local outstr = \"0\"\n    \n    -- Show total absorb as an absolute value\n    if absorb >= 1e9 then\n        outstr = (\"%.1fb\"):format(absorb / 1e9):gsub(\"%.?0+([kmb])$\", \"%1\") -- Billion shield is unlikely\n    elseif absorb >= 1e6 then\n        outstr = (\"%.1fm\"):format(absorb / 1e6):gsub(\"%.?0+([kmb])$\", \"%1\")\n    elseif absorb >= 1e3 or absorb <= -1e3 then \n        outstr = (\"%.1fk\"):format(math.floor(absorb / 1e3)):gsub(\"%.?0+([kmb])$\", \"%1\")\n    end\n    \n    -- Show current health + absorb relative to max health as a percentage value\n    if WA_TA_SHOW_PERCENT then\n        local absorbPercent = ((UnitHealth(\"player\") + absorb) / UnitHealthMax(\"player\")) * 100\n        outstr = outstr .. \" (\" .. (\"%.1f\"):format(absorbPercent) .. \"%%)\"\n    end\n    \n    return \"Absorb: \".. outstr\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
    ["yOffset"] = -151.61923243393,
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "event",
    ["actions"] = {
        ["start"] = {
            ["do_custom"] = true,
            ["custom"] = "WA_TA_SHOW_PERCENT = true",
        },
        ["finish"] = {
            ["do_custom"] = false,
            ["custom"] = "",
        },
    },
    ["regionType"] = "text",
    ["trigger"] = {
        ["rem"] = "3",
        ["use_unit"] = true,
        ["debuffType"] = "HELPFUL",
        ["type"] = "custom",
        ["unevent"] = "auto",
        ["custom_hide"] = "timed",
        ["subeventSuffix"] = "_CAST_START",
        ["event"] = "Conditions",
        ["custom_type"] = "event",
        ["subeventPrefix"] = "SPELL",
        ["events"] = "PLAYER_REGEN_DISABLED, UNIT_ABSORB_AMOUNT_CHANGED, UNIT_HEALTH",
        ["custom"] = "function(event_name, ...)\n    -- Do we even need this? Surely this function only fires whenever any of the events below occur\n    if event_name == \"PLAYER_REGEN_DISABLED\" or event_name == \"UNIT_ABSORB_AMOUNT_CHANGED\" or event_name == \"UNIT_HEALTH\" then\n        return true\n    end\n    return false -- This shouldn't happen, no?\nend",
        ["names"] = {
            [1] = "Enrage",
        },
        ["remOperator"] = "<",
        ["use_alive"] = true,
        ["unit"] = "player",
        ["useRem"] = true,
    },
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["additional_triggers"] = {
    },
    ["id"] = "TotalAbsorb",
    ["frameStrata"] = 1,
    ["width"] = 11.428590967783,
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
    ["font"] = "Expressway",
    ["numTriggers"] = 1,
    ["xOffset"] = -280.38066142907,
    ["height"] = 15.99998686965,
    ["untrigger"] = {
    },
    ["load"] = {
        ["role"] = {
            ["multi"] = {
            },
        },
        ["use_zone"] = false,
        ["spec"] = {
            ["multi"] = {
            },
        },
        ["use_combat"] = true,
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
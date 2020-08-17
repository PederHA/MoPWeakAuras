{
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["untrigger"] = {
    },
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "update",
    ["actions"] = {
        ["start"] = {
        },
        ["finish"] = {
        },
    },
    ["fontFlags"] = "OUTLINE",
    ["selfPoint"] = "CENTER",
    ["trigger"] = {
        ["type"] = "aura",
        ["subeventSuffix"] = "_CAST_START",
        ["ownOnly"] = true,
        ["event"] = "Health",
        ["unit"] = "target",
        ["inverse"] = true,
        ["subeventPrefix"] = "SPELL",
        ["names"] = {
            [1] = "Serpent Sting",
        },
        ["debuffType"] = "HARMFUL",
    },
    ["stickyDuration"] = false,
    ["font"] = "Expressway",
    ["height"] = 42,
    ["load"] = {
        ["use_class"] = true,
        ["role"] = {
            ["multi"] = {
            },
        },
        ["use_never"] = false,
        ["spec"] = {
            ["multi"] = {
            },
        },
        ["use_combat"] = true,
        ["class"] = {
            ["single"] = "HUNTER",
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
            },
        },
    },
    ["fontSize"] = 12,
    ["displayStacks"] = " ",
    ["regionType"] = "icon",
    ["desaturate"] = false,
    ["cooldown"] = true,
    ["stacksContainment"] = "INSIDE",
    ["zoom"] = 0,
    ["auto"] = true,
    ["animation"] = {
        ["start"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
        ["main"] = {
            ["type"] = "preset",
            ["preset"] = "bounce",
            ["duration_type"] = "seconds",
        },
        ["finish"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
    },
    ["additional_triggers"] = {
        [1] = {
            ["trigger"] = {
                ["type"] = "custom",
                ["unevent"] = "auto",
                ["event"] = "Health",
                ["subeventPrefix"] = "SPELL",
                ["custom_type"] = "status",
                ["custom"] = "function()\n    for i = 1, 5 do\n        if UnitIsUnit(\"target\", \"boss\"..i) then  -- check if target is a boss\n            return true \n        end\n    end\n    return false\nend",
                ["unit"] = "target",
                ["check"] = "update",
                ["use_unit"] = true,
                ["subeventSuffix"] = "_CAST_START",
                ["custom_hide"] = "timed",
            },
            ["untrigger"] = {
                ["custom"] = "function()\n    for i = 1, 5 do\n        if UnitIsUnit(\"target\", \"boss\"..i) then\n            return false\n        end\n    end\n    return true\nend\n\n\n",
                ["unit"] = "target",
            },
        },
        [2] = {
            ["trigger"] = {
                ["type"] = "status",
                ["use_health"] = true,
                ["subeventSuffix"] = "_CAST_START",
                ["event"] = "Health",
                ["subeventPrefix"] = "SPELL",
                ["health"] = "0",
                ["health_operator"] = ">",
                ["use_unit"] = true,
                ["unevent"] = "auto",
                ["unit"] = "target",
            },
            ["untrigger"] = {
                ["unit"] = "target",
            },
        },
    },
    ["id"] = "NoSSBoss",
    ["frameStrata"] = 4,
    ["width"] = 42,
    ["xOffset"] = 320.00049457652,
    ["inverse"] = false,
    ["numTriggers"] = 3,
    ["yOffset"] = -145,
    ["icon"] = true,
    ["displayIcon"] = "Interface\\Icons\\Ability_Hunter_Quickshot",
    ["stacksPoint"] = "BOTTOMRIGHT",
    ["textColor"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
}
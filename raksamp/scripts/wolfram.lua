---@diagnostic disable: undefined-global
local PATH = "/home/crow/RakSamp/Arizona";
local server_time = 3 * 60 * 60;

require("addon");
require("core");

local sampev = require("samp.events");
local json = require("json");
local encoding = require 'encoding';

encoding.default = 'CP1251';
u8 = encoding.UTF8;
local server_id = getCommandLineArgs():match("%-server (%d+)");
server_id = tonumber(server_id);

setLogPath(("Z:%s/logs/%d/%s.log"):format(PATH, server_id, os.date("%d.%m.%Y", os.time() + server_time)));

local check = {
    afk = {}
};

local core = {
    orgs = {
        list = {
            {
                stats = "Ïîëèöèÿ ËÑ",
                name = "Ïîëèöèÿ Ëîñ-Ñàíòîñà",
                short = "LSPD",
                color = 4278214399,
                id = 1,
                group_id = 1,
                pos = {
                    1545.7,
                    -1675.51,
                    13.56
                }
            },
            {
                stats = "Îáëàñòíàÿ ïîëèöèÿ",
                name = "Îáëàñòíàÿ ïîëèöèÿ",
                short = "RCSD",
                color = 4278214399,
                id = 2,
                group_id = 1,
                pos = {
                    632.19,
                    -571.62,
                    16.34
                }
            },
            {
                stats = "FBI",
                name = "FBI",
                short = "FBI",
                color = 4278214399,
                id = 3,
                group_id = 1,
                pos = {
                    -2452.13,
                    503.66,
                    30.08
                }
            },
            {
                stats = "Ïîëèöèÿ ÑÔ",
                name = "Ïîëèöèÿ Ñàí-Ôèåððî",
                short = "SFPD",
                color = 4278214399,
                id = 4,
                group_id = 1,
                pos = {
                    -1605.46,
                    714.37,
                    12.93
                }
            },
            {
                stats = "Áîëüíèöà LS",
                name = "Áîëüíèöà Ëîñ-Ñàíòîñà",
                short = "LSMC",
                color = 4294926071,
                id = 5,
                group_id = 2,
                pos = {
                    1175.95,
                    -1323.18,
                    14.2
                }
            },
            {
                stats = "Ïðàâèòåëüñòâî LS",
                name = "Ïðàâèòåëüñòâî Ëîñ-Ñàíòîñà",
                short = "Ìýðèÿ",
                color = 4290942976,
                id = 6,
                group_id = 3,
                pos = {
                    1495.59,
                    -1283.73,
                    14.53
                }
            },
            {
                stats = "Òþðüìà ñòðîãîãî ðåæèìà LV",
                name = "Òþðüìà Ñòðîãîãî Ðåæèìà",
                short = "ÒÑÐ",
                color = 4287583770,
                id = 7,
                group_id = 4,
                pos = {
                    234.65,
                    1902.83,
                    17.87
                }
            },
            {
                stats = "Áîëüíèöà ÑÔ",
                name = "Áîëüíèöà Ñàí-Ôèåððî",
                short = "SFMC",
                color = 4294926071,
                gps_line = 1,
                id = 8,
                group_id = 2,
                pos = {
                    -2668.82,
                    635.49,
                    14.45
                }
            },
            {
                stats = "Öåíòð ëèöåíçèðîâàíèÿ",
                name = "Öåíòð ëèöåíçèðîâàíèÿ",
                short = "ÖË",
                color = 4294927872,
                id = 9,
                group_id = 3,
                pos = {
                    -2043.68,
                    -87.17,
                    35.16
                }
            },
            {
                stats = "TV ñòóäèÿ",
                name = "Ðàäèîñòóäèÿ Ëîñ-Ñàíòîñà",
                short = "ÑÌÈ LS",
                color = 4294935552,
                id = 10,
                group_id = 5,
                pos = {
                    1653.59,
                    -1659.43,
                    22.52
                }
            },
            {
                stats = "Grove Street",
                name = "Grove Street",
                short = "Grove",
                color = 4279279872,
                id = 11,
                group_id = 6,
                pos = {
                    2495.12,
                    -1686.18,
                    13.51
                }
            },
            {
                stats = "Los Santos Vagos",
                name = "Los Santos Vagos",
                short = "Vagos",
                color = 4294952960,
                id = 12,
                group_id = 6,
                pos = {
                    2792.42,
                    -1618.52,
                    10.92
                }
            },
            {
                stats = "East Side Ballas",
                name = "East Side Ballas",
                short = "Ballas",
                color = 4291166420,
                id = 13,
                group_id = 6,
                pos = {
                    2001.31,
                    -1108.86,
                    26.77
                }
            },
            {
                stats = "Varrios Los Aztecas",
                name = "Varrios Los Aztecas",
                short = "Aztec",
                color = 4278255581,
                id = 14,
                group_id = 6,
                gps_line = 6,
                pos = {
                    2521.17,
                    -2001.66,
                    13.55
                }
            },
            {
                stats = "The Rifa",
                name = "The Rifa",
                short = "Rifa",
                color = 4285229567,
                id = 15,
                group_id = 6,
                pos = {
                    2185.81,
                    -1810.84,
                    13.55
                }
            },
            {
                stats = "Russian Mafia",
                name = "Russian Mafia",
                short = "ÐÌ",
                color = 4282149833,
                id = 16,
                group_id = 7,
                pos = {
                    940.19,
                    1731.2,
                    8.85
                }
            },
            {
                stats = "Yakuza",
                name = "Yakuza",
                short = "Yakuza",
                color = 4289069056,
                id = 17,
                group_id = 7,
                gps_line = 7,
                pos = {
                    -2460.88,
                    134.67,
                    35.17
                }
            },
            {
                stats = "La Cosa Nostra",
                name = "La Cosa Nostra",
                short = "LCN",
                color = 4289078907,
                id = 18,
                group_id = 7,
                gps_line = 8,
                pos = {
                    1460.89,
                    2773.17,
                    10.82
                }
            },
            {
                stats = "Warlock MC",
                name = "Warlock MC",
                short = "Warlock",
                color = 4290265856,
                id = 19,
                group_id = 7,
                pos = {
                    -2189.72,
                    -2350.17,
                    30.63
                }
            },
            {
                stats = "Àðìèÿ ËÑ",
                name = "Àðìèÿ Ëîñ-Ñàíòîñà",
                short = "LSa",
                color = 4287583770,
                id = 20,
                group_id = 4,
                pos = {
                    2732.91,
                    -2450.7,
                    17.59
                }
            },
            {
                stats = "Öåíòðàëüíûé Áàíê",
                name = "Öåíòðàëüíûé Áàíê",
                short = "ÖÁ",
                color = 4279005611,
                id = 21,
                group_id = 3,
                hided = true,
                pos = {
                    1480.85,
                    -1768.75,
                    18.8
                }
            },
            {
                stats = "Áîëüíèöà LV",
                name = "Áîëüíèöà Ëàñ-Âåíòóðàñà",
                short = "LVMC",
                color = 4294926071,
                id = 22,
                group_id = 2,
                pos = {
                    1607.5,
                    1819.17,
                    10.83
                }
            },
            {
                stats = "Ïîëèöèÿ ËÂ",
                name = "Ïîëèöèÿ Ëàñ-Âåíòóðàñà",
                short = "LVPD",
                color = 4278214399,
                id = 23,
                group_id = 1,
                pos = {
                    2287.05,
                    2428.53,
                    10.82
                }
            },
            {
                stats = "TV ñòóäèÿ LV",
                name = "Ðàäèîñòóäèÿ Ëàñ-Âåíòóðàñà",
                short = "ÑÌÈ LV",
                color = 4294935552,
                id = 24,
                group_id = 5,
                gps_line = 5,
                pos = {
                    2637.76,
                    1181.8,
                    10.82
                }
            },
            {
                stats = "Night Wolves",
                name = "Night Wolves",
                short = "Wolves",
                color = 4286928969,
                id = 25,
                group_id = 6,
                gps_line = 9,
                pos = {
                    2204.61,
                    -1160.4,
                    25.74
                }
            },
            {
                stats = "TV ñòóäèÿ SF",
                name = "Ðàäèîñòóäèÿ Ñàí-Ôèåððî",
                short = "ÑÌÈ SF",
                color = 4294935552,
                id = 26,
                group_id = 5,
                gps_line = 4,
                pos = {
                    -1941.4,
                    459.78,
                    35.17
                }
            },
            {
                stats = "Àðìèÿ SF",
                name = "Àðìèÿ Ñàí-Ôèåððî",
                short = "SFa",
                color = 4287583770,
                id = 27,
                group_id = 4,
                pos = {
                    -1369.94,
                    499.02,
                    11.2
                }
            },
            {
                stats = "Òåìíîå Áðàòñòâî",
                name = "Òåìíîå Áðàòñòâî",
                short = "Õèòìàíû",
                color = 4284900966,
                id = 28,
                group_id = 8,
                pos = {
                    0,
                    0,
                    0
                }
            },
            {
                stats = "Ñòðàõîâàÿ êîìïàíèÿ",
                name = "Ñòðàõîâàÿ êîìïàíèÿ",
                short = "ÑÊ",
                color = 4279005594,
                id = 29,
                group_id = 8,
                gps_line = 3,
                pos = {
                    -1735.77,
                    788.35,
                    24.89
                }
            },
            {
                stats = "Tierra Robada Bikers",
                name = "Tierra Robada Bikers",
                short = "Bikers",
                color = 4291800902,
                id = 30,
                group_id = 7,
                gps_line = 10,
                pos = {
                    -1938.38,
                    2380.97,
                    49.49
                }
            },
            {
                stats = "Áîëüíèöà Jefferson",
                name = "Áîëüíèöà Jefferson",
                short = "JMC",
                color = 4294926071,
                id = 31,
                group_id = 2,
                gps_line = 2,
                pos = {
                    2032.97,
                    -1406.97,
                    17.19
                }
            },
            {
                stats = "Ïîæàðíûé äåïàðòàìåíò",
                name = "Ïîæàðíûé äåïàðòàìåíò",
                short = "SFFD",
                color = 4294919424,
                id = 32,
                group_id = 3,
                pos = {
                    -2023.86,
                    67.16,
                    28.47
                }
            }
        },
        vc = {
            {
                id = 1,
                name = "Ïîëèöåéñêèé ó÷àñòîê",
                pos = {
                    648.82,
                    -420.16,
                    1505.71
                }
            },
            {
                id = 5,
                name = "Áîëüíèöà",
                pos = {
                    116.23,
                    -931.09,
                    1504.42
                }
            },
            {
                id = 10,
                name = "Ðàäèîñòàíöèÿ",
                pos = {
                    795,
                    243.57,
                    1508.45
                }
            }
        },
        groups = {
            {
                color = 4278214399,
                name = "Ìèíèñòåðñòâî þñòèöèè"
            },
            {
                color = 4294926071,
                name = "Ìèíèñòåðñòâî çäðàâîîõðàíåíèÿ"
            },
            {
                color = 4290942976,
                name = "Ãîñóäàðñòâåííûå ó÷ðåæäåíèÿ"
            },
            {
                color = 4287583770,
                name = "Ìèíèñòåðñòâî îáîðîíû"
            },
            {
                color = 4294935552,
                name = "Ñðåäñòâà ìàññîâîé èíôîðìàöèè"
            },
            {
                color = 4279279872,
                name = "Óëè÷íûå ãðóïïèðîâêè"
            },
            {
                color = 4289078907,
                name = "Ìàôèè"
            },
            {
                color = 4284900966,
                name = "Ïðî÷åå"
            }
        }
    },
    bot_bandit = {
        positions = {
            {
                x = 1779.00,
                y = -1908.12,
                z = 12.39,
                range = 50
            },
            {
                x = 1113.42,
                y = -1785.42,
                z = 15.59,
                range = 80
            }
        }
    },
    zones = {
        ghetto = {
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -962
            },
            {
                is_drug_den = true,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -861,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -962
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -962,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1063
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1063,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1164
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1164,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1265
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1265,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1366
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1366,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1467
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1568
            },
            {
                is_drug_den = true,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1568
            },
            {
                is_drug_den = true,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1467,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1568
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1568,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1669
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1770
            },
            {
                is_drug_den = true,
                y2 = -1669,
                color = 0,
                is_central = true,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1669,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1770
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1770,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1871
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -1972
            },
            {
                is_drug_den = true,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1871,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -1972
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                x2 = 1770,
                y1 = -2073
            },
            {
                is_drug_den = true,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                x2 = 1898,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                x2 = 2026,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                x2 = 2154,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                x2 = 2282,
                y1 = -2073
            },
            {
                is_drug_den = true,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                x2 = 2410,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = true,
                organization = 0,
                x1 = 2410,
                x2 = 2538,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                x2 = 2666,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                x2 = 2794,
                y1 = -2073
            },
            {
                is_drug_den = false,
                y2 = -1972,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                x2 = 2922,
                y1 = -2073
            },
            {
                x2 = 1770,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1642,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 1898,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1770,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2026,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 1898,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2154,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2026,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2282,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2154,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2410,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2282,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2538,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2410,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2666,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2538,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2794,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2666,
                is_drug_den = false,
                y1 = -2174
            },
            {
                x2 = 2922,
                y2 = -2073,
                color = 0,
                is_central = false,
                is_respawn = false,
                organization = 0,
                x1 = 2794,
                is_drug_den = false,
                y1 = -2174
            }
        },
        mafia = {
            {
                organization = 0,
                money = 86032,
                name = "Ìàãàçèí 24%/7",
                id = 175
            },
            {
                organization = 0,
                money = 30478,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 197
            },
            {
                organization = 0,
                money = 316151,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 198
            },
            {
                organization = 0,
                money = 237525,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 199
            },
            {
                organization = 0,
                money = 51336,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 201
            },
            {
                organization = 0,
                money = 224778,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 203
            },
            {
                organization = 0,
                money = 3852801,
                name = "Àâòîìàñòåðñêàÿ",
                id = 213
            },
            {
                organization = 0,
                money = 39455,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 218
            },
            {
                organization = 0,
                money = 237359,
                name = "Sport Club LV",
                id = 226
            },
            {
                organization = 0,
                money = 1483647,
                name = "Àâòîìàñòåðñêàÿ FC",
                id = 228
            },
            {
                organization = 0,
                money = 39511,
                name = "Øêîëà òàíöåâ",
                id = 234
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 243
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 246
            },
            {
                organization = 0,
                money = 38555,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 253
            },
            {
                organization = 0,
                money = 114290,
                name = "Ñåëüñêîõîçÿéñòâåííûé ìàãàçèí",
                id = 254
            },
            {
                organization = 0,
                money = 17341,
                name = "Ìàãàçèí 24%/7",
                id = 257
            },
            {
                organization = 0,
                money = 16475,
                name = "Çàêóñî÷íàÿ",
                id = 259
            },
            {
                organization = 0,
                money = 933281,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 262
            },
            {
                organization = 0,
                money = 489578,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 264
            },
            {
                organization = 0,
                money = 18879,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 267
            },
            {
                organization = 0,
                money = 104307,
                name = "Çàêóñî÷íàÿ",
                id = 271
            },
            {
                organization = 0,
                money = 16868,
                name = "Ìàãàçèí îäåæäû",
                id = 273
            },
            {
                organization = 0,
                money = 192130,
                name = "Ñïîðòèâíàÿ ïëîùàäêà",
                id = 274
            },
            {
                organization = 0,
                money = 0,
                name = "Àâòîñàëîí Luxe",
                id = 275
            },
            {
                organization = 0,
                money = 2108880,
                name = "Ìàãàçèí âèäåîêàðò",
                id = 277
            },
            {
                organization = 0,
                money = 2621807,
                name = "Ñåêîíä õåíä",
                id = 281
            },
            {
                organization = 0,
                money = 2624974,
                name = "Ñåêîíä õåíä",
                id = 284
            },
            {
                organization = 0,
                money = 203541,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 286
            },
            {
                organization = 0,
                money = 3132237,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 287
            },
            {
                organization = 0,
                money = 100932,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 292
            },
            {
                organization = 0,
                money = 373688,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 293
            },
            {
                organization = 0,
                money = 37392,
                name = "Çàêóñî÷íàÿ",
                id = 295
            },
            {
                organization = 0,
                money = 37734,
                name = "Çàêóñî÷íàÿ",
                id = 296
            },
            {
                organization = 0,
                money = 47030,
                name = "Ìàãàçèí 24%/7",
                id = 298
            },
            {
                organization = 0,
                money = 100878,
                name = "Àâòî Ñåðâèñ",
                id = 303
            },
            {
                organization = 0,
                money = 16452,
                name = "Àâòî Ñåðâèñ",
                id = 306
            },
            {
                organization = 0,
                money = 68300,
                name = "Àâòî Ñåðâèñ",
                id = 308
            },
            {
                organization = 0,
                money = 134346,
                name = "Àâòî Ñåðâèñ",
                id = 309
            },
            {
                organization = 0,
                money = 68908,
                name = "Àâòî Ñåðâèñ",
                id = 313
            },
            {
                organization = 0,
                money = 37393,
                name = "Àâòî Ñåðâèñ",
                id = 314
            },
            {
                organization = 0,
                money = 628089,
                name = "Ðûáîëîâíûé ìàãàçèí",
                id = 326
            },
            {
                organization = 0,
                money = 98581,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 328
            },
            {
                organization = 0,
                money = 16901,
                name = "Ëîìáàðä",
                id = 330
            },
            {
                organization = 0,
                money = 284931,
                name = "Îòåëü",
                id = 349
            },
            {
                organization = 0,
                money = 32782,
                name = "Ìàãàçèí îäåæäû",
                id = 350
            },
            {
                organization = 0,
                money = 172809,
                name = "Ìàãàçèí 24%/7",
                id = 353
            },
            {
                organization = 0,
                money = 1254000,
                name = "Ýëèêñèð Ìàñòåð",
                id = 354
            },
            {
                organization = 0,
                money = 175254,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 355
            },
            {
                organization = 0,
                money = 18931,
                name = "Áàð",
                id = 356
            },
            {
                organization = 0,
                money = 21603,
                name = "Çàêóñî÷íàÿ",
                id = 357
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 381
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 382
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 383
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 384
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 385
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 386
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 387
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 388
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 389
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 390
            },
            {
                organization = 0,
                money = 374063,
                name = "Àìóíèöèÿ%/Òèð",
                id = 0
            },
            {
                organization = 0,
                money = 499402,
                name = "Ìàãàçèí 24%/7",
                id = 11
            },
            {
                organization = 0,
                money = 425586,
                name = "Ìàãàçèí îäåæäû",
                id = 12
            },
            {
                organization = 0,
                money = 17373,
                name = "Ìàãàçèí îäåæäû",
                id = 14
            },
            {
                organization = 0,
                money = 4331395,
                name = "Ïðåäïðèÿòèå",
                id = 126
            },
            {
                organization = 0,
                money = 18844,
                name = "Ïðåäïðèÿòèå",
                id = 129
            },
            {
                organization = 0,
                money = 446775,
                name = "Îòåëü",
                id = 142
            },
            {
                organization = 0,
                money = 9813544,
                name = "Áàð",
                id = 165
            },
            {
                organization = 0,
                money = 581951,
                name = "Çàêóñî÷íàÿ",
                id = 167
            },
            {
                organization = 0,
                money = 107610,
                name = "Çàêóñî÷íàÿ",
                id = 168
            },
            {
                organization = 0,
                money = 17767,
                name = "Çàêóñî÷íàÿ",
                id = 171
            },
            {
                organization = 0,
                money = 39247,
                name = "Àìóíèöèÿ%/Òèð",
                id = 178
            },
            {
                organization = 0,
                money = 42673,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 182
            },
            {
                organization = 0,
                money = 68265,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 183
            },
            {
                organization = 0,
                money = 21309,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 184
            },
            {
                organization = 0,
                money = 46679,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 185
            },
            {
                organization = 0,
                money = 170702,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 186
            },
            {
                organization = 0,
                money = 172162,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 189
            },
            {
                organization = 0,
                money = 28081,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 206
            },
            {
                organization = 0,
                money = 135891,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 207
            },
            {
                organization = 0,
                money = 18551,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 209
            },
            {
                organization = 0,
                money = 60457,
                name = "Àðåíäà òðàíñïîðòà",
                id = 215
            },
            {
                organization = 0,
                money = 120000,
                name = "Êàçèíî (4 Äðàêîíà)",
                id = 229
            },
            {
                organization = 0,
                money = 120000,
                name = "Öåíòðàëüíûé Ðûíîê",
                id = 230
            },
            {
                organization = 0,
                money = 34678,
                name = "Øêîëà òàíöåâ",
                id = 235
            },
            {
                organization = 0,
                money = 5006067,
                name = "Ìàñòåðñêàÿ îäåæäû",
                id = 239
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 241
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 242
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 247
            },
            {
                organization = 0,
                money = 16921,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 250
            },
            {
                organization = 0,
                money = 23745,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 251
            },
            {
                organization = 0,
                money = 17120,
                name = "Ñåëüñêîõîçÿéñòâåííûé ìàãàçèí",
                id = 255
            },
            {
                organization = 0,
                money = 35500,
                name = "Àðåíäà ñåëüõîç òåõíèêè",
                id = 256
            },
            {
                organization = 0,
                money = 42273,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 263
            },
            {
                organization = 0,
                money = 0,
                name = "Ñåêîíä õåíä",
                id = 282
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 391
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 392
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 393
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 394
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 395
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 396
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 397
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 398
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 399
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 400
            },
            {
                organization = 0,
                money = 39799,
                name = "Àìóíèöèÿ%/Òèð",
                id = 1
            },
            {
                organization = 0,
                money = 18203,
                name = "Àìóíèöèÿ%/Òèð",
                id = 2
            },
            {
                organization = 0,
                money = 30416,
                name = "Áàð",
                id = 4
            },
            {
                organization = 0,
                money = 163204,
                name = "Áàð",
                id = 5
            },
            {
                organization = 0,
                money = 248514,
                name = "Ìàãàçèí 24%/7",
                id = 6
            },
            {
                organization = 0,
                money = 59564,
                name = "Ìàãàçèí 24%/7",
                id = 7
            },
            {
                organization = 0,
                money = 70552,
                name = "Ìàãàçèí 24%/7",
                id = 8
            },
            {
                organization = 0,
                money = 165332,
                name = "Ìàãàçèí 24%/7",
                id = 9
            },
            {
                organization = 0,
                money = 306917,
                name = "Ìàãàçèí 24%/7",
                id = 10
            },
            {
                organization = 0,
                money = 17687,
                name = "Ìàãàçèí îäåæäû",
                id = 13
            },
            {
                organization = 0,
                money = 1208431,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 19
            },
            {
                organization = 0,
                money = 126663,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 22
            },
            {
                organization = 0,
                money = 324054,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 25
            },
            {
                organization = 0,
                money = 22551,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 27
            },
            {
                organization = 0,
                money = 1068088,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 28
            },
            {
                organization = 0,
                money = 553997,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 30
            },
            {
                organization = 0,
                money = 95035,
                name = "Çàêóñî÷íàÿ",
                id = 33
            },
            {
                organization = 0,
                money = 101739,
                name = "Çàêóñî÷íàÿ",
                id = 35
            },
            {
                organization = 0,
                money = 125713,
                name = "Àðåíäà òðàíñïîðòà",
                id = 39
            },
            {
                organization = 0,
                money = 21602,
                name = "Àðåíäà òðàíñïîðòà",
                id = 41
            },
            {
                organization = 0,
                money = 169549,
                name = "Ìàãàçèí 24%/7",
                id = 46
            },
            {
                organization = 0,
                money = 249253,
                name = "Ìàãàçèí 24%/7",
                id = 47
            },
            {
                organization = 0,
                money = 86090,
                name = "Ìàãàçèí 24%/7",
                id = 48
            },
            {
                organization = 0,
                money = 22845,
                name = "Çàêóñî÷íàÿ",
                id = 49
            },
            {
                organization = 0,
                money = 16370,
                name = "Àðåíäà òðàíñïîðòà",
                id = 53
            },
            {
                organization = 0,
                money = 27173,
                name = "Àðåíäà òðàíñïîðòà",
                id = 57
            },
            {
                organization = 0,
                money = 37869,
                name = "Ìàãàçèí 24%/7",
                id = 72
            },
            {
                organization = 0,
                money = 15352,
                name = "Ìàãàçèí 24%/7",
                id = 74
            },
            {
                organization = 0,
                money = 21603,
                name = "Çàêóñî÷íàÿ",
                id = 83
            },
            {
                organization = 0,
                money = 126150,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 95
            },
            {
                organization = 0,
                money = 21361,
                name = "Àìóíèöèÿ%/Òèð",
                id = 117
            },
            {
                organization = 0,
                money = 16336,
                name = "Òåëåôîííûå êîììóíèêàöèè",
                id = 130
            },
            {
                organization = 0,
                money = 24143,
                name = "Ïðåäïðèÿòèå",
                id = 131
            },
            {
                organization = 0,
                money = 185385,
                name = "Îòåëü",
                id = 146
            },
            {
                organization = 0,
                money = 1138652,
                name = "Îòåëü",
                id = 147
            },
            {
                organization = 0,
                money = 88031,
                name = "Îòåëü",
                id = 151
            },
            {
                organization = 0,
                money = 116540,
                name = "Îòåëü",
                id = 152
            },
            {
                organization = 0,
                money = 823798,
                name = "Îòåëü",
                id = 155
            },
            {
                organization = 0,
                money = 0,
                name = "",
                id = 162
            },
            {
                organization = 0,
                money = 73859,
                name = "Áàð",
                id = 164
            },
            {
                organization = 0,
                money = 465248,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 180
            },
            {
                organization = 0,
                money = 19755,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 187
            },
            {
                organization = 0,
                money = 103654,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 188
            },
            {
                organization = 0,
                money = 598560,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 190
            },
            {
                organization = 0,
                money = 249358,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 191
            },
            {
                organization = 0,
                money = 709920,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 192
            },
            {
                organization = 0,
                money = 170531,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 193
            },
            {
                organization = 0,
                money = 218866,
                name = "Ìàãàçèí òþíèíãà LS",
                id = 223
            },
            {
                organization = 0,
                money = 4048334,
                name = "Àóêöèîí êîíòåéíåðîâ",
                id = 227
            },
            {
                organization = 0,
                money = 174763,
                name = "Ìàãàçèí 24%/7",
                id = 231
            },
            {
                organization = 0,
                money = 15631,
                name = "Øêîëà òàíöåâ",
                id = 236
            },
            {
                organization = 0,
                money = 57942,
                name = "Ìàñòåðñêàÿ îäåæäû",
                id = 238
            },
            {
                organization = 0,
                money = 1258028,
                name = "Ìàñòåðñêàÿ îäåæäû",
                id = 240
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 248
            },
            {
                organization = 0,
                money = 46765,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 249
            },
            {
                organization = 0,
                money = 50346,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 252
            },
            {
                organization = 0,
                money = 26395,
                name = "Ìàãàçèí 24%/7",
                id = 258
            },
            {
                organization = 0,
                money = 26621,
                name = "Çàêóñî÷íàÿ",
                id = 260
            },
            {
                organization = 0,
                money = 134760,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 261
            },
            {
                organization = 0,
                money = 655139,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 265
            },
            {
                organization = 0,
                money = 20090,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 266
            },
            {
                organization = 0,
                money = 244998,
                name = "Îòåëü",
                id = 268
            },
            {
                organization = 0,
                money = 562143,
                name = "Îòåëü",
                id = 269
            },
            {
                organization = 0,
                money = 523071,
                name = "Çàêóñî÷íàÿ",
                id = 270
            },
            {
                organization = 0,
                money = 2035800,
                name = "Ìàãàçèí âèäåîêàðò",
                id = 276
            },
            {
                organization = 0,
                money = 2463840,
                name = "Ìàãàçèí âèäåîêàðò",
                id = 278
            },
            {
                organization = 0,
                money = 435957,
                name = "Òåñò-Äðàéâ",
                id = 279
            },
            {
                organization = 0,
                money = 2612410,
                name = "Ñåêîíä õåíä",
                id = 283
            },
            {
                organization = 0,
                money = 230242,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 285
            },
            {
                organization = 0,
                money = 185767,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 288
            },
            {
                organization = 0,
                money = 124081,
                name = "Îòåëü",
                id = 289
            },
            {
                organization = 0,
                money = 61021,
                name = "Ìàãàçèí 24%/7",
                id = 290
            },
            {
                organization = 0,
                money = 10967154,
                name = "Áóêìåêåðñêàÿ êîìïàíèÿ",
                id = 291
            },
            {
                organization = 0,
                money = 293853,
                name = "Áàð",
                id = 297
            },
            {
                organization = 0,
                money = 151252,
                name = "Îòåëü",
                id = 300
            },
            {
                organization = 0,
                money = 37298,
                name = "Àâòî Ñåðâèñ",
                id = 304
            },
            {
                organization = 0,
                money = 61538,
                name = "Àâòî Ñåðâèñ",
                id = 307
            },
            {
                organization = 0,
                money = 387403,
                name = "Àâòî Ñåðâèñ",
                id = 310
            },
            {
                organization = 0,
                money = 35129,
                name = "Àâòî Ñåðâèñ",
                id = 311
            },
            {
                organization = 0,
                money = 6374664,
                name = "Òþíèíã ñàëîí",
                id = 316
            },
            {
                organization = 0,
                money = 323697,
                name = "Ñêëàä Äàëüíîáîéùèêîâ",
                id = 317
            },
            {
                organization = 0,
                money = 1479000,
                name = "Ñêëàä Äàëüíîáîéùèêîâ",
                id = 318
            },
            {
                organization = 0,
                money = 59214,
                name = "Àìóíèöèÿ%/Òèð",
                id = 320
            },
            {
                organization = 0,
                money = 1004363,
                name = "Îòåëü",
                id = 321
            },
            {
                organization = 0,
                money = 547223,
                name = "Îòåëü",
                id = 322
            },
            {
                organization = 0,
                money = 136527,
                name = "Ðûáîëîâíûé ìàãàçèí",
                id = 324
            },
            {
                organization = 0,
                money = 18401,
                name = "Ëîìáàðä",
                id = 329
            },
            {
                organization = 0,
                money = 26544,
                name = "Ìàãàçèí 24%/7",
                id = 348
            },
            {
                organization = 0,
                money = 40605,
                name = "Áàð",
                id = 351
            },
            {
                organization = 0,
                money = 2446995,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 352
            },
            {
                organization = 0,
                money = 844839,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 359
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 401
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 402
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 403
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 404
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 405
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 406
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 407
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 408
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 409
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 410
            },
            {
                organization = 0,
                money = 2716488,
                name = "Ëîòåðåéíàÿ",
                id = 301
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 331
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 332
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 333
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 334
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 335
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 336
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 337
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 338
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 339
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 340
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 341
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 342
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 343
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 344
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 345
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 346
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 347
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 360
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 361
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 362
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 363
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 364
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 365
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 366
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 367
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 368
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 369
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 370
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 371
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 372
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 373
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 374
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 375
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 376
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 377
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 378
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 379
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 380
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 421
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 422
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 423
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 424
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 425
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 426
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 427
            },
            {
                organization = 0,
                money = 20952,
                name = "Áàð LUX",
                id = 428
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 429
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 430
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 431
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 432
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 433
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 434
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 435
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 436
            },
            {
                organization = 0,
                money = 0,
                name = "Êèîñê",
                id = 437
            },
            {
                organization = 0,
                money = 141039,
                name = "Öåíòð Îáìåíà Èìóùåñòâîì",
                id = 438
            },
            {
                organization = 0,
                money = 0,
                name = "Ýëåêòðîêîìïàíèÿ",
                id = 439
            },
            {
                organization = 0,
                money = 0,
                name = "Ýëåêòðîêîìïàíèÿ",
                id = 440
            },
            {
                organization = 0,
                money = 15688,
                name = "Ýëåêòðîêîìïàíèÿ",
                id = 441
            },
            {
                organization = 0,
                money = 0,
                name = "Ýëåêòðîêîìïàíèÿ",
                id = 442
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 443
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 444
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 445
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 446
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 447
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 448
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 449
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 450
            },
            {
                organization = 0,
                money = 17688,
                name = "Áàð",
                id = 3
            },
            {
                organization = 0,
                money = 99840,
                name = "Ïðåäïðèÿòèå",
                id = 15
            },
            {
                organization = 0,
                money = 146563,
                name = "Ìàãàçèí 24%/7",
                id = 16
            },
            {
                organization = 0,
                money = 34221,
                name = "Ìàãàçèí 24%/7",
                id = 17
            },
            {
                organization = 0,
                money = 0,
                name = "Òþíèíã ñàëîí",
                id = 18
            },
            {
                organization = 0,
                money = 1222092,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 20
            },
            {
                organization = 0,
                money = 2753266,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 21
            },
            {
                organization = 0,
                money = 1647805,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 23
            },
            {
                organization = 0,
                money = 247245,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 24
            },
            {
                organization = 0,
                money = 1751447,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 26
            },
            {
                organization = 0,
                money = 1434018,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 29
            },
            {
                organization = 0,
                money = 281085,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 31
            },
            {
                organization = 0,
                money = 182738,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 32
            },
            {
                organization = 0,
                money = 21844,
                name = "Çàêóñî÷íàÿ",
                id = 34
            },
            {
                organization = 0,
                money = 502075,
                name = "Çàêóñî÷íàÿ",
                id = 36
            },
            {
                organization = 0,
                money = 55963,
                name = "Çàêóñî÷íàÿ",
                id = 37
            },
            {
                organization = 0,
                money = 38673,
                name = "Çàêóñî÷íàÿ",
                id = 38
            },
            {
                organization = 0,
                money = 18596,
                name = "Àðåíäà òðàíñïîðòà",
                id = 40
            },
            {
                organization = 0,
                money = 0,
                name = "Àðåíäà òðàíñïîðòà",
                id = 42
            },
            {
                organization = 0,
                money = 64290,
                name = "Ìàãàçèí 24%/7",
                id = 43
            },
            {
                organization = 0,
                money = 117161,
                name = "Ìàãàçèí 24%/7",
                id = 44
            },
            {
                organization = 0,
                money = 196243,
                name = "Ìàãàçèí 24%/7",
                id = 45
            },
            {
                organization = 0,
                money = 96694,
                name = "Çàêóñî÷íàÿ",
                id = 50
            },
            {
                organization = 0,
                money = 39407,
                name = "Áàð",
                id = 51
            },
            {
                organization = 0,
                money = 22892,
                name = "Àðåíäà òðàíñïîðòà",
                id = 52
            },
            {
                organization = 0,
                money = 20030,
                name = "Àðåíäà òðàíñïîðòà",
                id = 54
            },
            {
                organization = 0,
                money = 19092,
                name = "Àðåíäà òðàíñïîðòà",
                id = 55
            },
            {
                organization = 0,
                money = 113603,
                name = "Àðåíäà òðàíñïîðòà",
                id = 56
            },
            {
                organization = 0,
                money = 1227782,
                name = "Àðåíäà òðàíñïîðòà",
                id = 58
            },
            {
                organization = 0,
                money = 149069,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 59
            },
            {
                organization = 0,
                money = 216934,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 60
            },
            {
                organization = 0,
                money = 250925,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 61
            },
            {
                organization = 0,
                money = 669645,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 62
            },
            {
                organization = 0,
                money = 307634,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 63
            },
            {
                organization = 0,
                money = 12380,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 64
            },
            {
                organization = 0,
                money = 0,
                name = "Àìóíèöèÿ%/Òèð",
                id = 65
            },
            {
                organization = 0,
                money = 0,
                name = "Àìóíèöèÿ%/Òèð",
                id = 66
            },
            {
                organization = 0,
                money = 10955,
                name = "Àìóíèöèÿ%/Òèð",
                id = 67
            },
            {
                organization = 0,
                money = 19155,
                name = "Àìóíèöèÿ%/Òèð",
                id = 68
            },
            {
                organization = 0,
                money = 68155,
                name = "Ìàãàçèí 24%/7",
                id = 69
            },
            {
                organization = 0,
                money = 59891,
                name = "Ìàãàçèí 24%/7",
                id = 70
            },
            {
                organization = 0,
                money = 179508,
                name = "Ìàãàçèí 24%/7",
                id = 71
            },
            {
                organization = 0,
                money = 320608,
                name = "Ìàãàçèí 24%/7",
                id = 73
            },
            {
                organization = 0,
                money = 47059,
                name = "Ìàãàçèí 24%/7",
                id = 75
            },
            {
                organization = 0,
                money = 36018,
                name = "Ìàãàçèí 24%/7",
                id = 76
            },
            {
                organization = 0,
                money = 153457,
                name = "Ìàãàçèí 24%/7",
                id = 77
            },
            {
                organization = 0,
                money = 105784,
                name = "Çàêóñî÷íàÿ",
                id = 78
            },
            {
                organization = 0,
                money = 36491,
                name = "Çàêóñî÷íàÿ",
                id = 79
            },
            {
                organization = 0,
                money = 34259,
                name = "Çàêóñî÷íàÿ",
                id = 80
            },
            {
                organization = 0,
                money = 154296,
                name = "Çàêóñî÷íàÿ",
                id = 81
            },
            {
                organization = 0,
                money = 46800,
                name = "Çàêóñî÷íàÿ",
                id = 82
            },
            {
                organization = 0,
                money = 22073,
                name = "Çàêóñî÷íàÿ",
                id = 84
            },
            {
                organization = 0,
                money = 30818,
                name = "Çàêóñî÷íàÿ",
                id = 85
            },
            {
                organization = 0,
                money = 15667,
                name = "Áàð",
                id = 86
            },
            {
                organization = 0,
                money = 4723447,
                name = "Áàð",
                id = 87
            },
            {
                organization = 0,
                money = 16473,
                name = "Áàð",
                id = 88
            },
            {
                organization = 0,
                money = 20012,
                name = "Ìàãàçèí îäåæäû",
                id = 89
            },
            {
                organization = 0,
                money = 17170,
                name = "Ìàãàçèí îäåæäû",
                id = 90
            },
            {
                organization = 0,
                money = 23349,
                name = "Áàð",
                id = 91
            },
            {
                organization = 0,
                money = 18059,
                name = "Áàð",
                id = 92
            },
            {
                organization = 0,
                money = 17418,
                name = "Áàð",
                id = 93
            },
            {
                organization = 0,
                money = 16806,
                name = "Áàð",
                id = 94
            },
            {
                organization = 0,
                money = 247950,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 96
            },
            {
                organization = 0,
                money = 65900,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 97
            },
            {
                organization = 0,
                money = 973504,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 98
            },
            {
                organization = 0,
                money = 213094,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 99
            },
            {
                organization = 0,
                money = 52200,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 100
            },
            {
                organization = 0,
                money = 135392,
                name = "Ìàãàçèí 24%/7",
                id = 101
            },
            {
                organization = 0,
                money = 123267,
                name = "Ìàãàçèí 24%/7",
                id = 102
            },
            {
                organization = 0,
                money = 39099,
                name = "Ìàãàçèí 24%/7",
                id = 103
            },
            {
                organization = 0,
                money = 132606,
                name = "Ìàãàçèí 24%/7",
                id = 104
            },
            {
                organization = 0,
                money = 31641,
                name = "Ìàãàçèí 24%/7",
                id = 105
            },
            {
                organization = 0,
                money = 75866,
                name = "Çàêóñî÷íàÿ",
                id = 106
            },
            {
                organization = 0,
                money = 171753,
                name = "Çàêóñî÷íàÿ",
                id = 107
            },
            {
                organization = 0,
                money = 73983,
                name = "Çàêóñî÷íàÿ",
                id = 108
            },
            {
                organization = 0,
                money = 139813,
                name = "Çàêóñî÷íàÿ",
                id = 109
            },
            {
                organization = 0,
                money = 34257,
                name = "Çàêóñî÷íàÿ",
                id = 110
            },
            {
                organization = 0,
                money = 109965,
                name = "Çàêóñî÷íàÿ",
                id = 111
            },
            {
                organization = 0,
                money = 276311,
                name = "Çàêóñî÷íàÿ",
                id = 112
            },
            {
                organization = 0,
                money = 70386,
                name = "Çàêóñî÷íàÿ",
                id = 113
            },
            {
                organization = 0,
                money = 30854,
                name = "Çàêóñî÷íàÿ",
                id = 114
            },
            {
                organization = 0,
                money = 24604,
                name = "Àìóíèöèÿ%/Òèð",
                id = 115
            },
            {
                organization = 0,
                money = 207554,
                name = "Àìóíèöèÿ%/Òèð",
                id = 116
            },
            {
                organization = 0,
                money = 16366,
                name = "Àìóíèöèÿ%/Òèð",
                id = 118
            },
            {
                organization = 0,
                money = 20257,
                name = "Ìàãàçèí îäåæäû",
                id = 119
            },
            {
                organization = 0,
                money = 47559,
                name = "Ìàãàçèí îäåæäû",
                id = 120
            },
            {
                organization = 0,
                money = 52435,
                name = "Ìàãàçèí îäåæäû",
                id = 121
            },
            {
                organization = 0,
                money = 174780,
                name = "Àðåíäà òðàíñïîðòà",
                id = 122
            },
            {
                organization = 0,
                money = 42133,
                name = "Àðåíäà òðàíñïîðòà",
                id = 123
            },
            {
                organization = 0,
                money = 84306,
                name = "Àðåíäà òðàíñïîðòà",
                id = 124
            },
            {
                organization = 0,
                money = 25246,
                name = "Àðåíäà òðàíñïîðòà",
                id = 125
            },
            {
                organization = 0,
                money = 35691,
                name = "Àìóíèöèÿ%/Òèð",
                id = 127
            },
            {
                organization = 0,
                money = 21973,
                name = "Òåëåôîííûå êîììóíèêàöèè",
                id = 128
            },
            {
                organization = 0,
                money = 17689,
                name = "Òåëåôîííûå êîììóíèêàöèè",
                id = 132
            },
            {
                organization = 0,
                money = 18000,
                name = "Ïðåäïðèÿòèå",
                id = 133
            },
            {
                organization = 0,
                money = 1180634,
                name = "Ìàãàçèí 24%/7",
                id = 134
            },
            {
                organization = 0,
                money = 246326,
                name = "Çàêóñî÷íàÿ",
                id = 135
            },
            {
                organization = 0,
                money = 109185,
                name = "Àìóíèöèÿ%/Òèð",
                id = 136
            },
            {
                organization = 0,
                money = 639656,
                name = "ÀÇÑ%/Ìàãàçèí ìåõàíèêè",
                id = 137
            },
            {
                organization = 0,
                money = 544311,
                name = "Îòåëü",
                id = 138
            },
            {
                organization = 0,
                money = 129658,
                name = "Îòåëü",
                id = 139
            },
            {
                organization = 0,
                money = 429079,
                name = "Îòåëü",
                id = 140
            },
            {
                organization = 0,
                money = 49496,
                name = "Îòåëü",
                id = 141
            },
            {
                organization = 0,
                money = 240122,
                name = "Îòåëü",
                id = 143
            },
            {
                organization = 0,
                money = 431495,
                name = "Îòåëü",
                id = 144
            },
            {
                organization = 0,
                money = 311297,
                name = "Îòåëü",
                id = 145
            },
            {
                organization = 0,
                money = 1453390,
                name = "Îòåëü",
                id = 148
            },
            {
                organization = 0,
                money = 137135,
                name = "Îòåëü",
                id = 149
            },
            {
                organization = 0,
                money = 154050,
                name = "Îòåëü",
                id = 150
            },
            {
                organization = 0,
                money = 523353,
                name = "Îòåëü",
                id = 153
            },
            {
                organization = 0,
                money = 46529,
                name = "Îòåëü",
                id = 154
            },
            {
                organization = 0,
                money = 437757,
                name = "Îòåëü",
                id = 156
            },
            {
                organization = 0,
                money = 748184,
                name = "Îòåëü",
                id = 157
            },
            {
                organization = 0,
                money = 362947,
                name = "Îòåëü",
                id = 158
            },
            {
                organization = 0,
                money = 800400,
                name = "Àâòî-ñåðâèñ LS",
                id = 159
            },
            {
                organization = 0,
                money = 2201970,
                name = "Àâòî-ñåðâèñ SF",
                id = 160
            },
            {
                organization = 0,
                money = 1141440,
                name = "Àâòî-ñåðâèñ LV",
                id = 161
            },
            {
                organization = 0,
                money = 16195,
                name = "Áàð",
                id = 163
            },
            {
                organization = 0,
                money = 66736,
                name = "Çàêóñî÷íàÿ",
                id = 166
            },
            {
                organization = 0,
                money = 18873,
                name = "Çàêóñî÷íàÿ",
                id = 169
            },
            {
                organization = 0,
                money = 33080,
                name = "Çàêóñî÷íàÿ",
                id = 170
            },
            {
                organization = 0,
                money = 22828,
                name = "Çàêóñî÷íàÿ",
                id = 172
            },
            {
                organization = 0,
                money = 20564,
                name = "Ìàãàçèí îäåæäû",
                id = 173
            },
            {
                organization = 0,
                money = 409942,
                name = "Ìàãàçèí 24%/7",
                id = 174
            },
            {
                organization = 0,
                money = 959395,
                name = "Ìàãàçèí 24%/7",
                id = 176
            },
            {
                organization = 0,
                money = 40386,
                name = "Àìóíèöèÿ%/Òèð",
                id = 177
            },
            {
                organization = 0,
                money = 18889,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 179
            },
            {
                organization = 0,
                money = 53853,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 181
            },
            {
                organization = 0,
                money = 185527,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 194
            },
            {
                organization = 0,
                money = 68599,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 195
            },
            {
                organization = 0,
                money = 786480,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 196
            },
            {
                organization = 0,
                money = 498998,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 200
            },
            {
                organization = 0,
                money = 199941,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 202
            },
            {
                organization = 0,
                money = 100430,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 204
            },
            {
                organization = 0,
                money = 69362,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 205
            },
            {
                organization = 0,
                money = 115383,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 208
            },
            {
                organization = 0,
                money = 360675,
                name = "Ôåðìà",
                id = 210
            },
            {
                organization = 0,
                money = 234375,
                name = "Øàõòà",
                id = 211
            },
            {
                organization = 0,
                money = 334080,
                name = "Ðèåëòîðñêîå àãåíòñòâî",
                id = 212
            },
            {
                organization = 0,
                money = 17337,
                name = "Êîíöåðòíûé çàë",
                id = 214
            },
            {
                organization = 0,
                money = 18192,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 216
            },
            {
                organization = 0,
                money = 906012,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 217
            },
            {
                organization = 0,
                money = 399919,
                name = "Ëàðåê ñ óëè÷íîé åäîé",
                id = 219
            },
            {
                organization = 0,
                money = 0,
                name = "Àâòîñàëîí ýêîíîì",
                id = 220
            },
            {
                organization = 0,
                money = 0,
                name = "Àâòîñàëîí ñðåäíèé",
                id = 221
            },
            {
                organization = 0,
                money = 0,
                name = "Àâòîñàëîí ëþêñ",
                id = 222
            },
            {
                organization = 0,
                money = 427026,
                name = "Ìàãàçèí òþíèíãà SF",
                id = 224
            },
            {
                organization = 0,
                money = 17291,
                name = "Ìàãàçèí òþíèíãà LV",
                id = 225
            },
            {
                organization = 0,
                money = 2360795,
                name = "Ìàãàçèí àêñåññóàðîâ",
                id = 232
            },
            {
                organization = 0,
                money = 261835,
                name = "Ìàãàçèí îäåæäû",
                id = 233
            },
            {
                organization = 0,
                money = 4349826,
                name = "Ìàñòåðñêàÿ îäåæäû",
                id = 237
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 244
            },
            {
                organization = 0,
                money = 0,
                name = "Íåôòåâûøêà",
                id = 245
            },
            {
                organization = 0,
                money = 568539,
                name = "Çàêóñî÷íàÿ",
                id = 272
            },
            {
                organization = 0,
                money = 15637,
                name = "Êèíîòåàòð AZMAX",
                id = 280
            },
            {
                organization = 0,
                money = 29084,
                name = "Çàêóñî÷íàÿ",
                id = 294
            },
            {
                organization = 0,
                money = 19423,
                name = "Áàð",
                id = 299
            },
            {
                organization = 0,
                money = 42973,
                name = "Àâòî Ñåðâèñ",
                id = 302
            },
            {
                organization = 0,
                money = 16038,
                name = "Àâòî Ñåðâèñ",
                id = 305
            },
            {
                organization = 0,
                money = 18338,
                name = "Àâòî Ñåðâèñ",
                id = 312
            },
            {
                organization = 0,
                money = 19515,
                name = "Àâòî Ñåðâèñ",
                id = 315
            },
            {
                organization = 0,
                money = 563866,
                name = "Ñêëàä Äàëüíîáîéùèêîâ",
                id = 319
            },
            {
                organization = 0,
                money = 22525,
                name = "Ñòðèïòèç Êëóá",
                id = 323
            },
            {
                organization = 0,
                money = 19614,
                name = "Ðûáîëîâíûé ìàãàçèí",
                id = 325
            },
            {
                organization = 0,
                money = 3047329,
                name = "Ðûáîëîâíûé ìàãàçèí",
                id = 327
            },
            {
                organization = 0,
                money = 11745,
                name = "Çàêóñî÷íàÿ",
                id = 358
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 411
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 412
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 413
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 414
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 415
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 416
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 417
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 418
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 419
            },
            {
                organization = 0,
                money = 0,
                name = "Ïàðêîâî÷íîå ìåñòî",
                id = 420
            }
        },
        family = {
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2459,
                y2 = 2595,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2323,
                y2 = 2459,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2187,
                y2 = 2323,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 2051,
                y2 = 2187,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1916,
                y2 = 2051,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1780,
                y2 = 1916,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1644,
                y2 = 1780,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1508,
                y2 = 1644,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1372,
                y2 = 1508,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1236,
                y2 = 1372,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 1100,
                y2 = 1236,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = true,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 964,
                y2 = 1100,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1222,
                x2 = 1344,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1344,
                x2 = 1467,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1467,
                x2 = 1589,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1589,
                x2 = 1712,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1712,
                x2 = 1834,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1834,
                x2 = 1957,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 1957,
                x2 = 2079,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2079,
                x2 = 2202,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2202,
                x2 = 2324,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2324,
                x2 = 2447,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2447,
                x2 = 2569,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            },
            {
                y1 = 828,
                y2 = 964,
                coins = 0,
                money = 0,
                next_capture = {
                    status = false,
                    enemy = nil,
                    unix = 0
                },
                x1 = 2569,
                x2 = 2692,
                is_enterprise = false,
                captured_at = 0,
                color = 0
            }
        }
    }
};

local getip = {
    delay = nil,
    match = "^Nick %[(.+)%]%s+R%-IP%s+%[([%d%.]+)%]%s+IP%s+|%s+A%-IP%s+%[{......}([%d%.]+)%s+|%s+",
    forma = "Ãåîëîêàöèîííûå äàííûå èãðîêà %s(%s):\nIP: [REG: %s / LAST: %s]\nÑòðàíà: [REG: %s] / [LAST: %s]\nÃîðîä: [REG: %s] / [LAST: %s]\nÏðîâàéäåð: [REG: %s] / [LAST: %s]\nÐàññòîÿíèå: %s êì.",
    player = "Íåèçâåñòíî",
    data = {
        {
            as = "Íåèçâåñòíî",
            country = "Íåèçâåñòíî",
            lon = 0,
            city = "Íåèçâåñòíî",
            lat = 0
        },
        {
            as = "Íåèçâåñòíî",
            country = "Íåèçâåñòíî",
            lon = 0,
            city = "Íåèçâåñòíî",
            lat = 0
        }
    },
    dist = 0
};

getip.get_ip = function()
    if (getip.delay and os.clock() - getip.delay < 2.5 ) then
        check.getip_analysis = nil;
        return;
    end

    local url = "http://ipwho.is/%s?output=json&lang=ru";

    getip.dist = 0;
    getip.data[1].ok = nil;
    getip.data[2].ok = nil;
    getip.delay = os.clock();

    for i = 1, 2 do
        asyncHttpRequest("GET", url:format(getip.data[i].ip), nil, function(response)
            if (response.status_code ~= 200) then
                check.getip_analysis = nil;
                getip.data[i].ok = false;
                return nil;
            end

            response.text = string.gsub(response.text, "\\u(%x%x%x%x)", function(resp)
                return unicode_to_utf8(tonumber("0x" .. resp));
            end)

            response.text = u8:decode(response.text);
            local answer = json.decode(response.text);

            if (type(answer) == "table") then
                local as;

                if (type(answer.connection) == "table") then
                    as = answer.connection.org;
                elseif type(answer.as) == "string" then
                    as = answer.as;
                end

                getip.data[i] = {
                    ok = true,
                    ip = getip.data[i].ip,
                    country = answer.country or "Íåèçâåñòíî",
                    city = answer.city or "Íåèçâåñòíî",
                    as = as or "Íåèçâåñòíî",
                    lat = answer.lat or answer.latitude or 0,
                    lon = answer.lon or answer.longitude or 0,
                    proxy = answer.proxy == true,
                    mobile = answer.mobile == true
                };

                if (i == 2) then
                    repeat
                        wait(0)
                    until getip.data[1].ok;

                    getip.dist = getDistanceBetweenLatLon(getip.data[1].lat, getip.data[1].lon, getip.data[2].lat, getip.data[2].lon);

                    if (check.getip_analysis ~= nil) then
                        check.getip_analysis = nil;

                        sendMessage("/a Ðåçóëüòàòû ïðîâåðêè èãðîêà %s:", getip.nick);

                        local data = {};

                        if (getip.data[1].country ~= getip.data[2].country) then
                            table.insert(data, "ñòðàíà");
                        end

                        if (getip.data[1].city ~= getip.data[2].city) then
                            table.insert(data, "ãîðîä");
                        end

                        if (getip.data[1].as ~= getip.data[2].as) then
                            table.insert(data, "ïðîâàéäåð");
                        end

                        if (#data > 0) then
                            sendMessage("/a Îòëè÷àåòñÿ îò ðåã. äàííûõ: %s", table.concat(data, ", "));
                            sendMessage("/a Ïðèáëèçèòåëüíîå ðàññòîÿíèå: %d êì.", getip.dist);

                            if (getip.data[1].proxy) then
                                sendMessage("/a [!] Èãðîê, âîçìîæíî, ðåãèñòðèðîâàëñÿ ÷åðåç VPN/Proxy.");
                            elseif (getip.data[1].mobile) then
                                sendMessage("/a [!] Èãðîê ðåãèñòðèðîâàëñÿ ñ ìîáèëüíîãî èíòåðíåòà.");
                            end

                            if (getip.data[2].proxy) then
                                sendMessage("/a [!] Èãðîê, âîçìîæíî, ñåé÷àñ èñïîëüçóåò VPN/Proxy.");
                            elseif getip.data[2].mobile then
                                sendMessage("/a [!] Èãðîê ñåé÷àñ èñïîëüçóåò ìîáèëüíûé èíòåðíåò.");
                            end
                        else
                            sendMessage("/a Ðàçëè÷èÿ ìåæäó REG IP è LAST IP íå íàéäåíû.");
                        end
                    end
                end
            else
                check.getip_analysis = nil;
                getip.data[i].ok = false;
            end
        end, function(err)
            check.getip_analysis = nil;
            getip.data[i].ok = false;
        end)
    end
end

local license = {
    sellLicenses = false,
    types = {
        [0] = {
            phrase = "àâòî",
            rank = 1
        },
        [1] = {
            phrase = "ìîòî",
            rank = 2
        },
        [2] = {
            phrase = "ïîë¸òû",
            rank = 7
        },
        [3] = {
            phrase = "ðûáàëêà",
            rank = 3
        },
        [4] = {
            phrase = "ëîäêè",
            rank = 4
        },
        [5] = {
            phrase = "îðóæèå",
            rank = 5
        },
        [6] = {
            phrase = "îõîòà",
            rank = 5
        },
        [7] = {
            phrase = "ðàñêîïêè",
            rank = 6
        },
        [8] = {
            phrase = "òàêñè",
            rank = 6
        },
        [9] = {
            phrase = "ìåõàíèê",
            rank = 6
        }
    }
};

local admin_ranks = {
    ["Îñíîâàòåëü"] = 8,
    ["Ãëàâíûé Àäìèíèñòðàòîð"] = 7,
    ["Çàìåñòèòåëü ÃÀ"] = 6,
    ["Êóðàòîð"] = 5,
    ["Àäìèíèñòðàòîð"] = 4,
    ["Ñòàðøèé Ìîäåðàòîð"] = 3,
    ["Ìîäåðàòîð"] = 2,
    ["Ìëàäøèé Ìîäåðàòîð"] = 1
};

local ao_messages = {};

sendMessage = {
    queue = {},
    timer = 0
};

setmetatable(sendMessage, {
    __call = function(self, text, ...)
        local ttext = tostring(text)

        table.insert(self.queue, string.format(ttext, ...))
    end
})

local settings = {
    active = false,
    debug = false,
    server_ip = "",
    server_port = 0,
    bot_nickname = "",
    bot_password_server = "",
    bot_password_admin = "",
    bot_password_bank = "",
    bot_is_spawned = false,
    last_bot_connect = 0,
    last_bot_disconnect = 0,
    license_system = nil,
    spawn_quaternion = {
        [0] = 0,
        [1] = 0,
        [2] = 0,
        [3] = 0
    },
    license_second_position = "",
    license_quaternion_second = {
        [0] = 0,
        [1] = 0,
        [2] = 0,
        [3] = 0
    },
    license_first_position = "",
    license_quaternion_first = {
        [0] = 0,
        [1] = 0,
        [2] = 0,
        [3] = 0
    },
    spawn_position = "",
    amember_system = false,
    amember_fraction = 0,
    amember_rank = 0,
    skin_system = false,
    skin_id = 0,
    bot_admin_lvl = 0,
    property_purchase_system = false,
    send_information_to_admins_time = 0,
    last_send_information_to_admins = 0,
    plveh_auto_set_id = false,
    auto_respawn_cars = false,
    auto_respawn_cars_time = 0,
    last_respawn_cars = 0,
    send_mpdonate_system = false,
    send_mpdonate_time = 0,
    last_send_mpdonate = 0,
    send_ao_system = false,
    send_conference_system = false,
    bot_bandit_checker_system = false
};

local messagesRemover = {};

local guard = {};

local server_stats = {
    b = false,
    players = 0,
    build = nil,
    packetloss = 0,
    admins = {
        special = {
            total = 0
        },
        chief = {
            total = 0,
            afk = 0,
        },
        admins = {
            total = 0,
            afk = 0,
        },
        helpers = {
            total = 0,
            afk = 0,
        },
        report = 0,
        idle = {},
        list = {}
    },
    leaders = {
        total = 0,
        afk = 0,
        list = {}
    },
    zams = {
        total = 0,
        afk = 0,
        list = {}
    },
    special = {},
    ticks = {
        current = 0,
        average = 0,
        maximum = 0,
        minimum = 0
    }
};

local businesses_mafia = {
    b = false,
    last = 0,
    delay = 0,
    fractions = {16, 17, 18, 19, 30},
    pool = {}
};

local bot_bandit = {
    b = false,
    delay = 0,
    last = 0,
    players = {},
    pool = {}
};

local morg = {
    b = false,
    delay = 0,
    last = os.time(),
    judges = {},
    pool = {}
};

local pledge = {
    b = false,
    delay = 0,
    last = os.time(),
    action = 0,
    pool = {}
};

function loadMorg()
    local query = ("SELECT `fraction_id`, `active`, `uval_system`, `uval_time` FROM `arizona`.fractions_system WHERE `server_id` = %d;"):format(server_id);
    local data = mysqlQuery(query);
    morg.pool = {};

    for i = 1, 32 do
        morg.pool[i] = {
            active = false,
            process = false,
            error_stats = 0,
            error_first = false,
            error_second = false,
            money = 0,
            dormitory = false,
            check = 1,
            leader = {},
            zams = 0,
            online = 0,
            afk = 0,
            uval = {
                enabled = false,
                time = 14 * 24,
                pool = {}
            },
            sobes = {
                time = nil,
                place = nil
            },
            owner = {
                family = nil,
                leader = nil,
                zams = {}
            },
            ranks = {
                [1] = {
                    salary = 0,
                    pool = {},
                },
                [2] = {
                    salary = 0,
                    pool = {},
                },
                [3] = {
                    salary = 0,
                    pool = {},
                },
                [4] = {
                    salary = 0,
                    pool = {},
                },
                [5] = {
                    salary = 0,
                    pool = {},
                },
                [6] = {
                    salary = 0,
                    pool = {},
                },
                [7] = {
                    salary = 0,
                    pool = {},
                },
                [8] = {
                    salary = 0,
                    pool = {},
                },
                [9] = {
                    salary = 0,
                    pool = {},
                },
                [10] = {
                    salary = 0,
                    pool = {},
                }
            }
        }

        if (data) then
            if (data[i].active == 1) then
                morg.pool[i].active = true;

                if (data[i].uval_system == 1) then
                    morg.pool[i].uval.enabled = true;
                    morg.pool[i].uval.time = data[i].uval_time;
                end
            end
        end
    end

    for i = 1, 5 do
        morg.judges[i] = {
            nickname = nil,
            date = 0
        }
    end
end

local props = {
    b = false,
    delay = 0,
    days = 0,
    last = os.time(),
    pool = {}
};

local igForms = {
    igForms = {},
    b = false,
    last = "",
    accepted_first = nil,
    widget = {
        start_time = os.clock(),
        player = {
            id = -1
        },
        admin = {
            nick = "",
            id = -1
        }
    },
    show_error = false,
    errors = {
        {
            error = "%[Îøèáêà%] %{ffffff%}Äàííûé èãðîê íå ó÷àñòâóåò â ìåðîïðèÿòèè%!",
            answer = "Äàííûé èãðîê íå ó÷àñòâóåò â ìåðîïðèÿòèè!"
        },
        {
            error = "%[Èíôîðìàöèÿ%] %{ffffff%}Âû ìîæåòå âûäàòü åùå 0 RP Points %(çàâèñèò îò óðîâíÿ àäìèíèñòðèðîâàíèÿ%)",
            answer = "Áîò áîëüøå íå ìîæåò âûäàòü RP Points!"
        },
        {
            error = "%[Ïîäñêàçêà%] %{ffffff%}%/setmember %[id èãðîêà%] %[id îðãàíèçàöèè %(1%-32%)%] %[ðàíã %(1%-9%)%] %[ïðè÷èíà%]",
            answer = "Âû íåâåðíî çàïîëíèëè ôîðìó!"
        },
        {
            error = "%[Ïîäñêàçêà%] %{ffffff%}%/grppoint %[id èãðîêà%] %[ïðè÷èíà%]",
            answer = "Âû íåâåðíî çàïîëíèëè ôîðìó!"
        },
        {
            error = "%[Îøèáêà%] %{ffffff%}Èñïîëüçóéòå%: %/setfuel %[carid%] %[êîë-âî òîïëèâà%]",
            answer = "Âû ââåëè íåâåðíûé ID òðàíñïîðòà, ëèáî íåâåðíîå êîëè÷åñòâî òîïëèâà!"
        },
        {
            error = "%[Îøèáêà%] %{FFFFFF%}Èãðîê íå íàéäåí%!",
            answer = "Èãðîê íå â ñåòè!"
        },
        {
            error = "%[Îøèáêà%] %{FFFFFF%}Èãðîê íå â ñåòè%!",
            answer = "Èãðîê íå â ñåòè!"
        }
    },
    runners = {},
    list = {}
};

igForms.runners = {
    pgetip = function(form, regex)
        check.pgetip = {};

        sendMessage(form);
    end,
    pgetips = function(form, regex)
        check.pgetip = {};

        sendMessage(form);
    end,
    getip = function(form, regex)
        check.getip_analysis = true;

        sendMessage(form);
    end,
    spcarall = function(form, regex)
        if (not (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt")) then
            settings.last_respawn_cars = os.time();
            check.spawncars = "form_ig";

            license.sellLicenses = false;

            set_bot_position();

            newTask(function ()
                settings.last_respawn_cars = os.time();

                local query = ("UPDATE `arizona`.servers_raksamp SET `last_respawn_cars` = %d WHERE `server_id` = %d;"):format(settings.last_respawn_cars, server_id);
                AsyncMysqlQuery(query);

                sendMessage("/ao [Ñïàâí òðàíñïîðòà] Óâàæàåìûå èãðîêè, ÷åðåç 60 ñåêóíä áóäåò ñïàâí âñåãî òðàíñïîðòà!");
                sendMessage("/ao [Ñïàâí òðàíñïîðòà] Çàéìèòå ñâîé òðàíñïîðò, â ïðîòèâíîì ñëó÷àå îí ïðîïàäåò!");

                wait(60 * 1000);

                sendMessage("/vehicleapanel");
            end)
        end
    end,
    setmember = function(form, regex)
        local playerId, orgId, orgRank, reason = form:match(regex);

        if (tonumber(playerId) == tonumber(igForms.widget.admin.id)) then
            sendMessage("/a [Forma] +");
            sendMessage(form);
        end
    end,
    uval = function(form, regex)
        local playerId = form:match(regex);

        if (tonumber(playerId) == tonumber(igForms.widget.admin.id)) then
            sendMessage("/a [Forma] +");
            sendMessage(form);
        end
    end,
    plveh = function(form, regex)
        local playerId, carId = form:match(regex);

        if (settings.plveh_auto_set_id) then
            if (carId) then
                sendMessage("/plveh " .. playerId .. " " .. 462 .. " 0");
            else
                form = form .. " " .. 462;
                sendMessage(form .. " 0");
            end
        else
            if (carId) then
                sendMessage("/plveh " .. playerId .. " " .. carId .. " 0");
            else
                form = form .. " " .. 462;
                sendMessage(form .. " 0");
            end
        end
    end
};

setmetatable(igForms.list, {
    __call = function(self, data)
        if (type(data) == "table") then
            data.send_type = data.lvl <= settings.bot_admin_lvl and 3 or 1;
            data.pre_spec = false;
            data.runner = igForms.runners[data.name] or sendMessage;
            data.params = string.gsub(data.params, "%s+", "%%s+");

            local err = false;

            for i, form in ipairs(igForms.list) do
                if form.name == data.name then
                    igForms.list[i] = data;
                    err = true;
                    break;
                end
            end

            if (not err) then
                table.insert(self, data);
                table.sort(self, function(a, b)
                    return a.name < b.name;
                end)
            end
        end
    end
})

function initIgForms(data)
    if (not igForms.b) then return end;
    asyncHttpRequest("GET", "https://api-production-e4a5.up.railway.app/files/raksamp/ig_forms.json", nil, function(response)
        local filejson = json.decode(response.text);
        for i, v in ipairs(filejson) do
            for j, set in pairs(data) do
                local form_db_name = string.match(j, "^form_ig_(.*)$");
                if (form_db_name) then
                    if (v.name == form_db_name) then
                        v.state = set == 1;
                    end
                end
            end
            igForms.list(v);
        end
    end, function(err)
        igForms.b = false;
    end)
end

local offForms = {
    b = false,
    process = false,
    widget = {
        start_time = os.clock(),
        index = -1
    },
    runners = {},
    list = {},
    pool = {}
};

offForms.runners = {
    other = function(form_name, form, regex)
        local playerId = getPlayerIdByNickname(offForms.widget.args[offForms.widget.f_plId]);

        if (playerId == -1) then
            local new_cmd = ("%soff"):format(offForms.widget.args[1]);
            offForms.widget.args[1] = new_cmd;
        else
            offForms.widget.args[offForms.widget.f_plId] = getPlayerNickNameById(playerId);
        end
        offForms.widget.form = table.concat(offForms.widget.args, " ");

        sendMessage(offForms.widget.form);
    end,
    pay = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n, a = form:match(regex);

            if (getPlayerIdByNickname(n) == -1) then
                offForms.process = false;
                offForms.widget = {};
            else
                check.offForms = {
                    form = "pay",
                    nickname = n,
                    amount = tonumber(a)
                };

                license.sellLicenses = false;

                set_bot_position();

                sendMessage("/abankmenu");
            end
        end
    end,
    bank = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local a = form:match(regex);

            check.offForms = {
                form = "bank",
                amount = tonumber(a)
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/abankmenu");
        end
    end,
    setname = function(form_name, form, regex)
        local o, n = form:match(regex);

        if (getPlayerIdByNickname(o) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/setname " .. getPlayerIdByNickname(o) .. " " .. n);
        end
    end,
    makeleader = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n, o, r = form:match(regex);

            if (getPlayerIdByNickname(n) == -1) then
                offForms.process = false;
                offForms.widget = {};
            else
                check.offForms = {
                    form = "makeleader",
                    nickname = n,
                    organization = tonumber(o),
                    reason = r
                };

                license.sellLicenses = false;

                set_bot_position();

                sendMessage("/makeleader " ..  getPlayerIdByNickname(n));
            end
        end
    end,
    unleader = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local o, r = form:match(regex);

            check.offForms = {
                form = "unleader",
                organization = tonumber(o),
                reason = r
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/apanel");
        end
    end,
    makejudge = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n = form:match(regex);

            if (getPlayerIdByNickname(n) == -1) then
                offForms.process = false;
                offForms.widget = {};
            else
                check.offForms = {
                    form = "makejudge",
                    nickname = n
                };

                license.sellLicenses = false;

                set_bot_position();

                sendMessage("/apanel");
            end
        end
    end,
    unjudge = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n = form:match(regex);

            check.offForms = {
                form = "unjudge",
                nickname = n
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/apanel");
        end
    end,
    props = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local t, i, b = form:match(regex);

            if (tonumber(b) == 1) then
                b = "Ïîäòâåðäèòü âåðèôèêàöèþ";
            elseif (tonumber(b) == 0) then
                b = "Îòêëîíèòü âåðèôèêàöèþ";
            end

            check.offForms = {
                form = "props",
                id = tonumber(i),
                type = tonumber(t),
                action = b
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/props " .. t .. " " .. i);
        end
    end,
    rasform = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local t = form:match(regex);

            check.offForms = {
                form = "rasform",
                type = tonumber(t)
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/rasform");
        end
    end,
    ban = function(form_name, form, regex)
        local n, t, r = form:match(regex);

        sendMessage("/banoff 0 " .. n .. " " .. t .. " " .. r);
    end,
    ao = function(form_name, form, regex)
        sendMessage(form);
    end,
    agl = function(form_name, form, regex)
        local n, t = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/agl " .. n .. " " .. t);
        end
    end,
    delhname = function(form_name, form, regex)
        sendMessage(form);
    end,
    delbname = function(form_name, form, regex)
        sendMessage(form);
    end,
    famwarban = function(form_name, form, regex)
        sendMessage(form);
    end,
    unfamwarban = function(form_name, form, regex)
        sendMessage(form);
    end,
    stopfractionpeace = function(form_name, form, regex)
        sendMessage(form);
    end,
    stopfractionwar = function(form_name, form, regex)
        sendMessage(form);
    end,
    cancelfamgz = function(form_name, form, regex)
        sendMessage(form);
    end,
    setbizmafia = function(form_name, form, regex)
        local b, o = form:match(regex);

        check.offForms = {
            form = "setfamgz",
            organization = tonumber(o),
            businesses = json.decode(b),
            process = false,
            notLast = true
        };

        for id, business in ipairs(check.offForms.businesses) do
            if (#check.offForms.businesses == id) then
                check.offForms.notLast = false;
            end

            sendMessage("/setbizmafia " .. business .. " " .. o);

            wait(2000);
        end
    end,
    setfamgz = function(form_name, form, regex)
        local t, f = form:match(regex);

        check.offForms = {
            form = "setfamgz",
            family = f,
            territories = json.decode(t),
            process = false,
            notLast = true
        };

        for id, territory in ipairs(check.offForms.territories) do
            if (#check.offForms.territories == id) then
                check.offForms.notLast = false;
            end

            sendMessage("/setfamgz " .. territory .. " " .. f);

            wait(2000);
        end
    end,
    setgangzone = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local o, t = form:match(regex);

            check.offForms = {
                form = "setgangzone",
                organization = tonumber(o),
                territories = json.decode(t),
                process = false,
                notLast = true
            };

            license.sellLicenses = false;

            for id, territory in ipairs(check.offForms.territories) do
                if (#check.offForms.territories == id) then
                    check.offForms.notLast = false;
                end

                check.offForms.process = true;

                local x = core.zones.ghetto[tonumber(territory)].x1 + (core.zones.ghetto[tonumber(territory)].x2 - core.zones.ghetto[tonumber(territory)].x1) / 2;
                local y = core.zones.ghetto[tonumber(territory)].y1 + (core.zones.ghetto[tonumber(territory)].y2 - core.zones.ghetto[tonumber(territory)].y1) / 2;

                sendMessage("/aplpos " .. x .. " " .. y .. " 0 0 0");

                while (check.offForms and check.offForms.process) do
                    wait(2500);
                end
            end
        end
    end,
    unban = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n, r = form:match(regex);

            check.offForms = {
                form = "unban",
                nickname = n,
                reason = r
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/unban " .. n .. " " .. r);
        end
    end,
    notif = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local n, t = form:match(regex);

            check.offForms = {
                form = "notif",
                nickname = n,
                text = t
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage(form);
        end
    end,
    defmarker = function(form_name, form, regex)
        local n, r = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/defmarker " .. getPlayerIdByNickname(n) .. " " .. r);
        end
    end,
    unapunish = function(form_name, form, regex)
        local n, r = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            sendMessage("/unapunishoff " .. n .. " " .. r);
        else
            sendMessage("/skick " .. getPlayerIdByNickname(n));
            sendMessage("/unapunishoff " .. n .. " " .. r);
        end
    end,
    rmute = function(form_name, form, regex)
        local n, t, r = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/rmute " .. getPlayerIdByNickname(n) .. " " .. t .. " " .. r);
        end
    end,
    unrmute = function(form_name, form, regex)
        local n, r = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/unrmute " .. getPlayerIdByNickname(n) .. " " .. r);
        end
    end,
    setmember = function(form_name, form, regex)
        local n, f, a, r = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            offForms.process = false;
            offForms.widget = {};
        else
            sendMessage("/setmember " .. getPlayerIdByNickname(n) .. " " .. f .. " " .. a .. " " .. r);
        end
    end,
    banip = function(form_name, form, regex)
        local ip, r = form:match(regex);

        sendMessage("/banipoff " .. ip .. " " .. r);
    end,
    unbanip = function(form_name, form, regex)
        local ip = form:match(regex);

        sendMessage("/unbanip " .. ip);
    end,
    ungivedemotalon = function(form_name, form, regex)
        local n = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            sendMessage("/ungivedemotalonoff " .. n);
        else
            local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ó èãðîêà íåäîñòàòî÷íî òàëîíîâ.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            offForms.process = false;
            offForms.widget = {};
        end
    end,
    ungiveantimute = function(form_name, form, regex)
        local n = form:match(regex);

        if (getPlayerIdByNickname(n) == -1) then
            sendMessage("/ungiveantimuteoff " .. n);
        else
            local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ó èãðîêà íåäîñòàòî÷íî òàëîíîâ.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            offForms.process = false;
            offForms.widget = {};
        end
    end,
    votestart = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            local t, i, l, n, u = form:match(regex);
            local nicknames = json.decode(u);

            if (#nicknames == 1) then
                nicknames = {
                    "Çà " .. nicknames[1],
                    "Ïðîòèâ " .. nicknames[1],
                }
            end

            check.offForms = {
                form = "votestart",
                step = 0,
                time = tostring(t),
                name = n,
                ip = tostring(i),
                level = tostring(l),
                nicknames = nicknames
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/vote");
        end
    end,
    votestop = function(form_name, form, regex)
        if (check.morg or check.businesses_mafia or check.props or check.mpdonate or check.pledge or check.spawncars or check.compensations or check.recovery_account or check.recovery_fraction or check.server_stats == "svrnt") then
            offForms.process = false;
            offForms.widget = {};
        else
            check.offForms = {
                form = "votestop",
            };

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/vote");
        end
    end,
};

setmetatable(offForms.list, {
    __call = function(self, data)
        if (type(data) == "table") then
            data.runner = offForms.runners[data.name] or offForms.runners["other"];
            data.params = string.gsub(data.params, "%s+", "%%s+");

            local err = false;

            for i, form in ipairs(offForms.list) do
                if (form.name == data.name) then
                    offForms.list[i] = data;
                    err = true;
                    break;
                end
            end

            if (not err) then
                table.insert(self, data);
                table.sort(self, function(a, b)
                    return a.name < b.name;
                end)
            end
        end
    end
})

function initOffForms(data)
    if (not offForms.b) then return end;
    asyncHttpRequest("GET", "https://api-production-e4a5.up.railway.app/files/raksamp/off_forms.json", nil, function(response)
        local filejson = json.decode(u8:decode(response.text));
        for i, v in ipairs(filejson) do
            for db_name, set in pairs(data) do
                local form_db_name = db_name:match("^form_off_(.*)$");
                if (form_db_name) then
                    if (v.name == form_db_name) then
                        v.state = set == 1;
                    end
                end
            end
            offForms.list(v);
        end
    end, function(err)
        offForms.b = false;
    end)
end

local compensations = {
    b = false,
    process = false,
    widget = {
        start_time = os.clock(),
        index = -1
    },
    runners = {},
    list = {},
    pool = {}
};

compensations.runners = {
    other = function(form_name, form, regex)
        local playerId = getPlayerIdByNickname(compensations.widget.args[compensations.widget.f_plId]);

        if (playerId == -1) then
            local new_cmd = ("%soff"):format(compensations.widget.args[1]);
            compensations.widget.args[1] = new_cmd;
        else
            compensations.widget.args[compensations.widget.f_plId] = getPlayerNickNameById(playerId);
        end
        compensations.widget.form = table.concat(compensations.widget.args, " ");

        sendMessage(compensations.widget.form);
    end,
    giveantiwarn = function(form_name, form, regex)
        compensations.widget.args[1] = ("%soff"):format(compensations.widget.args[1]);
        compensations.widget.form = table.concat(compensations.widget.args, " ");

        sendMessage("/notif " .. compensations.widget.args[compensations.widget.f_plId] .. " Çàÿâêà íà êîìïåíñàöèþ ïî æàëîáå ¹" .. compensations.widget.complaintId .. " áûëà îäîáðåíà àäìèíèñòðàòîðîì " .. compensations.widget.administrator .. ".");
        sendMessage("/notif " .. compensations.widget.args[compensations.widget.f_plId] .. " Îæèäàéòå âûäà÷è îò Ãëàâíîãî àäìèíèñòðàòîðà/Çàìåñòèòåëÿ ãëàâíîãî àäìèíèñòðàòîðà.");

        local query = "UPDATE `arizona`.compensations_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Íåîáõîäèìî âûäàòü ôîðìó âðó÷íóþ: " .. compensations.widget.form) .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `compensation_id` = " .. compensations.widget.compensation_id .. " AND `server_id` = " .. server_id .. ';';
        mysqlQuery(query);

        compensations.process = false;
        compensations.widget = {};
    end,
};

setmetatable(compensations.list, {
    __call = function(self, data)
        if (type(data) == "table") then
            data.runner = compensations.runners[data.name] or compensations.runners["other"];
            data.params = string.gsub(data.params, "%s+", "%%s+");

            local err = false;

            for i, form in ipairs(compensations.list) do
                if (form.name == data.name) then
                    compensations.list[i] = data;
                    err = true;
                    break;
                end
            end

            if (not err) then
                table.insert(self, data);
                table.sort(self, function(a, b)
                    return a.name < b.name;
                end)
            end
        end
    end
})

function initCompensations()
    if (not compensations.b) then return end;
    asyncHttpRequest("GET", "https://api-production-e4a5.up.railway.app/files/raksamp/compensations.json", nil, function(response)
        local filejson = json.decode(u8:decode(response.text));
        for i, v in ipairs(filejson) do
            compensations.list(v);
        end
    end, function(err)
        compensations.b = false;
    end)
end

local recovery_fraction = {
    b = false,
    process = false,
    widget = {
        start_time = os.clock(),
        index = -1
    },
    pool = {}
};

local recovery_account = {
    b = false,
    process = false,
    widget = {
        start_time = os.clock(),
        index = -1
    },
    pool = {}
};

function initMessagesRemover()
    asyncHttpRequest("GET", "https://api-production-e4a5.up.railway.app/files/raksamp/messages_remover.json", nil, function(response)
        local filejson = json.decode(u8:decode(response.text));
        for i, v in ipairs(filejson) do
            table.insert(messagesRemover, v);
        end
    end, function(err)
        print("[ MessagesRemover | Êðèòè÷åñêàÿ îøèáêà ] Íå áûë ïîëó÷åí îòâåò îò API.")
    end)
end

function initGuard()
    asyncHttpRequest("GET", "https://api-production-e4a5.up.railway.app/files/raksamp/guard.json", nil, function(response)
        local filejson = json.decode(u8:decode(response.text));
        for i, v in ipairs(filejson) do
            table.insert(guard, v);
        end
    end, function(err)
        print("[ Guard | Êðèòè÷åñêàÿ îøèáêà ] Íå áûë ïîëó÷åí îòâåò îò API.")
    end)
end

do
    local function isset(p1, p2)
        if (p1 ~= nil) then return p1; end
        return p2;
    end

    local query = ("UPDATE `arizona`.servers_raksamp SET `started` = %d, `last_bot_start` = %d WHERE `server_id` = %d;"):format(1, os.time(), server_id);
    AsyncMysqlQuery(query);

    query = "SELECT * FROM `arizona`.servers_raksamp WHERE `server_id` = " .. server_id .. ";";
    local data = mysqlQuery(query)[1];

    settings.active = isset(data.active == 1, settings.active);
    settings.start = isset(data.start == 1, settings.start);
    settings.debug = isset(data.debug == 1, settings.debug);
    settings.server_ip = isset(data.server_ip, settings.server_ip);
    settings.server_port = isset(tonumber(data.server_port), settings.server_port);
    settings.bot_nickname = isset(data.bot_nickname, settings.bot_nickname);
    settings.bot_password_server = isset(data.bot_password_server, settings.bot_password_server);
    settings.bot_password_admin = isset(data.bot_password_admin, settings.bot_password_admin);
    settings.bot_password_bank = isset(data.bot_password_bank, settings.bot_password_bank);

    settings.last_bot_start = isset(data.last_bot_start, settings.last_bot_start);
    settings.last_bot_restart = isset(data.last_bot_restart, settings.last_bot_restart);
    settings.last_bot_stop = isset(data.last_bot_stop, settings.last_bot_stop);
    settings.last_bot_connect = isset(data.last_bot_connect, settings.last_bot_connect);
    settings.last_bot_disconnect = isset(data.last_bot_disconnect, settings.last_bot_disconnect);

    settings.spawn_position = isset(data.spawn_position, settings.spawn_position)
    settings.spawn_quaternion = {
        [0] = isset(tonumber(data.spawn_position_quaternion_zero), settings.spawn_quaternion[0]),
        [1] = isset(tonumber(data.spawn_position_quaternion_one), settings.spawn_quaternion[1]),
        [3] = isset(tonumber(data.spawn_position_quaternion_three), settings.spawn_quaternion[3]),
        [2] = isset(tonumber(data.spawn_position_quaternion_two), settings.spawn_quaternion[2]),
    };

    settings.license_system = isset(data.license_system == 1, settings.license_system);
    settings.license_first_position = isset(data.license_first_position, settings.license_first_position);
    settings.license_quaternion_first = {
        [0] = isset(data.license_first_position_quaternion_zero, settings.license_quaternion_first[0]),
        [1] = isset(data.license_first_position_quaternion_one, settings.license_quaternion_first[1]),
        [2] = isset(data.license_first_position_quaternion_two, settings.license_quaternion_first[2]),
        [3] = isset(data.license_first_position_quaternion_three, settings.license_quaternion_first[3])
    };

    settings.license_second_position = isset(data.license_second_position, settings.license_second_position);
    settings.license_quaternion_second = {
        [0] = isset(data.license_second_position_quaternion_zero, settings.license_quaternion_second[0]),
        [1] = isset(data.license_second_position_quaternion_one, settings.license_quaternion_second[1]),
        [2] = isset(data.license_second_position_quaternion_two, settings.license_quaternion_second[2]),
        [3] = isset(data.license_second_position_quaternion_three, settings.license_quaternion_second[3])
    };

    settings.skin_system = isset(data.skin_system == 1, settings.skin_system);
    settings.skin_id = isset(data.skin_id, settings.skin_id);

    settings.amember_system = isset(data.amember_system == 1, settings.amember_system);
    settings.amember_fraction = isset(data.amember_fraction, settings.amember_fraction);
    settings.amember_rank = isset(data.amember_rank, settings.amember_rank);

    settings.bot_admin_lvl = isset(tonumber(data.bot_admin_lvl), settings.bot_admin_lvl);

    settings.property_purchase_system = isset(data.property_purchase_system == 1, settings.property_purchase_system);

    settings.send_information_to_admins_system = isset(data.send_information_to_admins_system == 1, settings.send_information_to_admins_system);
    settings.send_information_to_admins_time = isset(tonumber(data.send_information_to_admins_time), settings.send_information_to_admins_time);
    settings.last_send_information_to_admins = isset(tonumber(data.last_send_information_to_admins), settings.last_send_information_to_admins);

    settings.auto_respawn_cars = isset(data.auto_respawn_cars == 1, settings.auto_respawn_cars);
    settings.auto_respawn_cars_time = isset(tonumber(data.auto_respawn_cars_time), settings.auto_respawn_cars_time);
    settings.last_respawn_cars = isset(tonumber(data.last_respawn_cars), settings.last_respawn_cars);

    settings.send_mpdonate_system = isset(data.send_mpdonate_system == 1, settings.send_mpdonate_system);
    settings.send_mpdonate_time = isset(tonumber(data.send_mpdonate_time), settings.send_mpdonate_time);
    settings.last_send_mpdonate = isset(tonumber(data.last_send_mpdonate), settings.last_send_mpdonate);

    settings.send_ao_system = isset(data.send_ao_system == 1, settings.send_ao_system);

    settings.send_conference_system = isset(data.send_conference_system == 1, settings.send_conference_system);
    settings.last_send_conference_first = isset(tonumber(data.last_send_conference_first), settings.last_send_conference_first);
    settings.send_conference_first_hour = isset(tonumber(data.send_conference_first_hour), settings.send_conference_first_hour);
    settings.send_conference_first_minute = isset(tonumber(data.send_conference_first_minute), settings.send_conference_first_minute);
    settings.last_send_conference_second = isset(tonumber(data.last_send_conference_second), settings.last_send_conference_second);
    settings.send_conference_second_hour = isset(tonumber(data.send_conference_second_hour), settings.send_conference_second_hour);
    settings.send_conference_second_minute = isset(tonumber(data.send_conference_second_minute), settings.send_conference_second_minute);
    settings.last_send_conference_third = isset(tonumber(data.last_send_conference_third), settings.last_send_conference_third);
    settings.send_conference_third_hour = isset(tonumber(data.send_conference_third_hour), settings.send_conference_third_hour);
    settings.send_conference_third_minute = isset(tonumber(data.send_conference_third_minute), settings.send_conference_third_minute);
    settings.last_send_conference_fourth = isset(tonumber(data.last_send_conference_fourth), settings.last_send_conference_fourth);
    settings.send_conference_fourth_hour = isset(tonumber(data.send_conference_fourth_hour), settings.send_conference_fourth_hour);
    settings.send_conference_fourth_minute = isset(tonumber(data.send_conference_fourth_minute), settings.send_conference_fourth_minute);
    settings.last_send_conference_fifth = isset(tonumber(data.last_send_conference_fifth), settings.last_send_conference_fifth);
    settings.send_conference_fifth_hour = isset(tonumber(data.send_conference_fifth_hour), settings.send_conference_fifth_hour);
    settings.send_conference_fifth_minute = isset(tonumber(data.send_conference_fifth_minute), settings.send_conference_fifth_minute);

    bot_bandit.b = isset(data.bot_bandit_checker_system == 1, bot_bandit.b);
    bot_bandit.delay = isset(tonumber(data.bot_bandit_checker_time), bot_bandit.delay);
    bot_bandit.last = isset(tonumber(data.last_bot_bandit_checker), bot_bandit.last);

    igForms.b = isset(data.form_ig_system == 1, igForms.b);
    settings.plveh_auto_set_id = isset(data.form_set_plveh_auto_set_id == 1, settings.plveh_auto_set_id);

    server_stats.b = isset(data.server_stats == 1, server_stats.b);

    morg.b = isset(data.fractions_system == 1, morg.b);
    morg.delay = isset(tonumber(data.fractions_time), morg.delay);
    morg.last = isset(tonumber(data.last_fractions), morg.last);

    businesses_mafia.b = isset(data.businesses_mafia_system == 1, businesses_mafia.b);
    businesses_mafia.delay = isset(tonumber(data.businesses_mafia_time), businesses_mafia.delay);
    businesses_mafia.last = isset(tonumber(data.last_businesses_mafia), businesses_mafia.last);

    pledge.b = isset(data.pledge_system == 1, pledge.b);
    pledge.delay = isset(tonumber(data.pledge_time), pledge.delay);
    pledge.last = isset(tonumber(data.last_pledge), pledge.last);

    props.b = isset(data.property_sell_system == 1, props.b);
    props.delay = isset(tonumber(data.property_sell_time), props.delay);
    props.days = isset(tonumber(data.property_sell_days), props.days);
    props.last = isset(tonumber(data.last_property_sell), props.last);

    offForms.b = isset(data.form_off_system == 1, offForms.b);

    compensations.b = isset(data.compensations_system == 1, compensations.b);

    recovery_account.b = isset(data.recovery_account_system == 1, recovery_account.b);

    recovery_fraction.b = isset(data.recovery_fraction_system == 1, recovery_fraction.b);

    if (not settings.debug) then
        initMessagesRemover();
    end

    initGuard();

    initIgForms(data);
    initOffForms(data);

    if (compensations.b) then
        initCompensations();
    end
end

do
    if (settings.server_ip ~= "" and settings.server_port ~= 0) then
        local ip = ("%s:%d"):format(settings.server_ip, settings.server_port);
        setServerAddress(ip);
    else
        settings.last_bot_disconnect = os.time();
        local query = ("UPDATE `arizona`.servers_raksamp SET `started` = %d, `last_bot_disconnect` = %d, `last_bot_stop` = %d WHERE `server_id` = %d;"):format(0, settings.last_bot_disconnect, os.time(), server_id);
        AsyncMysqlQuery(query);

        exit();
    end

    if (settings.bot_nickname ~= "") then
        setBotNick(settings.bot_nickname);
    else
        settings.last_bot_disconnect = os.time();
        local query = ("UPDATE `arizona`.servers_raksamp SET `started` = %d, `last_bot_disconnect` = %d, `last_bot_stop` = %d WHERE `server_id` = %d;"):format(0, settings.last_bot_disconnect, os.time(), server_id);
        AsyncMysqlQuery(query);

        exit();
    end
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
    if (dialogId == 0) then
        if (text:find("Â ýòîé îðãàíèçàöèè íèêòî íå ñîñòîèò!")) then
            if (check.morg) then
                morg.pool[tonumber(check.morg)].check = 3;
                sendMessage('/lmenu');
            end
        end

        if (text:find("%{FFFFFF%}Îøèáêà! Ó ýòîé îðãàíèçàöèè óæå åñòü ëèäåð!")) then
            if (check.offForms) then
                if (check.offForms.form == "makeleader") then
                    local query = "UPDATE `arizona`.form_off_system SET `error` = 1, `text_error` = '" .. u8("Ó ýòîé îðãàíèçàöèè óæå åñòü ëèäåð.") .. "', `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    check.offForms = nil;
                    offForms.process = false;
                    offForms.widget = {};
                end
            end
        end

        if (text:find("Íà äàííûé ìîìåíò ïîä âàøåì êîíòðîëåì íåò áèçíåñîâ!")) then
            if (check.businesses_mafia) then
                check.businesses_mafia = true;
            end
        end

        if (title:find("Ñîáåñåäîâàíèÿ"))  then
            for line in text:gmatch("[^\n]+") do
                line = line:gsub("{%x+}", "");
                local organization, interview_time, location = line:match("(.-)%s+(%d?%d:%d%d)%s+(.*)$");

                if (not organization) then
                    organization, interview_time, location = line:match("(.-)%s+(Íå çàïëàíèðîâàíî)%s+(.*)$");
                end

                if (organization) then
                    organization = organization:gsub("- ", "");

                    for id, v in ipairs(core.orgs.list) do
                        if (v.stats == organization) then
                            if (interview_time ~= "Íå çàïëàíèðîâàíî") then
                                morg.pool[tonumber(v.id)].sobes.time = interview_time;
                            end

                            if (interview_time ~= "Íå íàçíà÷åíî!") then
                                morg.pool[tonumber(v.id)].sobes.place = location;
                            end
                        end
                    end
                end
            end
        end

        if (title:find("Óâåäîìëåíèå ñîçäàíî"))  then
            local nickname = text:match("Íèê:%s*{%x+}(%S+)");

            if (check.offForms and check.offForms.form == "notif") then
                if (check.offForms.nickname == nickname) then
                    local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    check.offForms = nil;
                    offForms.process = false;
                    offForms.widget = {};
                end
            end
        end
    end

    if (dialogId == 2) then
        settings.last_bot_connect = os.time();
        local query = ("UPDATE `arizona`.servers_raksamp SET `last_bot_connect` = %d WHERE `server_id` = %d;"):format(os.time(), server_id);
        AsyncMysqlQuery(query);

        sendDialogResponse(dialogId, 1, -1, settings.bot_password_server);
    end

    if (dialogId == 26) then
        if (check.offForms) then
            if (check.offForms.form == "makeleader") then
                local organization = findListInDialog(text, style, "%[" .. check.offForms.organization .. "%]");
                sendDialogResponse(dialogId, 1, organization, "");
            end
        end
    end

    if (dialogId == 33) then
        if (check.offForms) then
            if (check.offForms.form == "pay") then
                local action = findListInDialog(text, style, "Ïåðåâåñòè äåíüãè ñ îñíîâíîãî ñ÷åòà");
                sendDialogResponse(dialogId, 1, action, "");
            elseif (check.offForms.form == "bank") then
                local action = findListInDialog(text, style, "Ïîïîëíèòü îñíîâíîé ñ÷åò");
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 34) then
        if (check.offForms.form == "bank") then
            sendDialogResponse(dialogId, 1, -1, tostring(check.offForms.amount));
        end
    end

    if (dialogId == 37) then
        if (check.offForms.form == "pay") then
            sendDialogResponse(dialogId, 1, -1, check.offForms.nickname);
        end
    end

    if (dialogId == 41) then
        if (check.offForms.form == "pay") then
            sendDialogResponse(dialogId, 1, -1, tostring(check.offForms.amount));
        end
    end

    if (dialogId == 91) then
        local nickname = title:gsub("{%x+}", "");
        if (check.offForms and check.offForms.form == "unban") then
            if (check.offForms.nickname == nickname) then
                sendDialogResponse(dialogId, 1, -1, "");

                check.offForms = nil;
            end
        end

        if (check.recovery_account) then
            sendDialogResponse(dialogId, 1, -1, "");
        end
    end

    if (dialogId == 115) then
        if (check.offForms.form == "unleader") then
            for id, v in ipairs(core.orgs.list) do
                if (v.id == check.offForms.organization) then
                    check.offForms.organization_name = v.stats;
                end
            end

            local action = findListInDialog(text, style, check.offForms.organization_name);

            sendDialogResponse(dialogId, 1, action, "");
        end
    end

    if (dialogId == 211) then
        sendDialogResponse(dialogId, 1, -1, settings.bot_password_admin);
    end

    if (dialogId == 266) then
        sendDialogResponse(dialogId, 1, 0, "");
        sendMessage("/ao [Ñïàâí òðàíñïîðòà] Âåñü òðàíñïîðò áûë óñïåøíî çàñïàâíåí!");
        check.spawncars = nil;
    end

    if (dialogId == 567) then
        local count = 0;

        for line in text:gmatch("[^\n]+") do
            count = count + 1;
            local nickname, time_value, time_unit, rank_name, rank_number, additional_days, total_hours = line:match("(%S+)%s+(%d+)%s+(%S+)%s+(.+)%[(%d+)%]%s+%((%d+)%s+äíåé%)?%s+%[%s+(%d+%.%d+)%s+÷àñ");
            local isPayed = line:find("{90EE90}") ~= nil;

            if (nickname) then
                nickname = nickname:gsub("{.-}%s*", "");
                time_value = tonumber(time_value);

                if time_unit:match("äíåé") then
                    time_value = time_value * 24;
                end

                rank_number = tonumber(rank_number);
                rank_name = rank_name:gsub("{%x+}", "");
                total_hours = tonumber(total_hours);

                if ((time_value >= morg.pool[tonumber(check.morg)].uval.time * 24) and (not isPayed)) then
                    if (morg.pool[tonumber(check.morg)].uval.enabled) then
                        table.insert(morg.pool[tonumber(check.morg)].uval.pool, {
                            nickname = nickname,
                            time = tonumber(time_value),
                        });
                    end
                else
                    if (tonumber(rank_number) == 0) then
                        sendMessage("/uvaloff " .. nickname);
                        sendMessage("/notif " .. nickname .. " Âû áûëè óâîëåíû èç îðãàíèçàöèè â ñâÿçè ñ âîçíèêíîâåíèåì áàãà, îáðàòèòåñü ê àäìèíèñòðàöèè äëÿ âîçâðàòà ðàíãà.");
                        sendMessage("/a [ CheckFractions | Error ] FractionID: " .. tostring(check.morg) .. " | PlayerName: " .. nickname);
                    elseif (tonumber(rank_number) > 0 and tonumber(rank_number) <= 11) then
                        table.insert(morg.pool[tonumber(check.morg)].ranks[tonumber(rank_number)].pool, {
                            nickname = nickname,
                            rank = tonumber(rank_number),
                            rank_name = u8(rank_name),
                            last = tonumber(time_value),
                            days = tonumber(additional_days),
                            payed = isPayed
                        });
                    end
                end
            else
                nickname, time_value, time_unit, rank_name, rank_number, total_hours = line:match("(%S+)%s+(%d+)%s+(%S+)%s+(.+)%[(%d+)%]%s+%[%s+(%d+%.%d+)%s+÷àñ");

                if (nickname) then
                    nickname = nickname:gsub("{.-}%s*", "");
                    time_value = tonumber(time_value);

                    if time_unit:match("äíåé") then
                        time_value = time_value * 24;
                    end

                    rank_number = tonumber(rank_number);
                    rank_name = rank_name:gsub("{%x+}", "");
                    total_hours = tonumber(total_hours);

                    if ((time_value >= morg.pool[tonumber(check.morg)].uval.time * 24) and (not isPayed)) then
                        if (morg.pool[tonumber(check.morg)].uval.enabled) then
                            table.insert(morg.pool[tonumber(check.morg)].uval.pool, {
                                nickname = nickname,
                                time = tonumber(time_value),
                            });
                        end
                    else
                        if (tonumber(rank_number) == 0) then
                            sendMessage("/uvaloff " .. nickname);
                            sendMessage("/notif " .. nickname .. " Âû áûëè óâîëåíû èç îðãàíèçàöèè â ñâÿçè ñ âîçíèêíîâåíèåì áàãà, îáðàòèòåñü ê àäìèíèñòðàöèè äëÿ âîçâðàòà ðàíãà.");
                            sendMessage("/a [ CheckFractions | Error ] FractionID: " .. tostring(check.morg) .. " | PlayerName: " .. nickname);
                        elseif (tonumber(rank_number) > 0 and tonumber(rank_number) <= 11) then
                            table.insert(morg.pool[tonumber(check.morg)].ranks[tonumber(rank_number)].pool, {
                                nickname = nickname,
                                rank = tonumber(rank_number),
                                rank_name = u8(rank_name),
                                last = tonumber(time_value),
                                days = 0,
                                payed = isPayed
                            });
                        end
                    end
                end
            end
        end

        local nextList = findListInDialog(text, style, "Âïåðåä");
        local prevList = findListInDialog(text, style, "Íàçàä");

        if ((nextList) and (not prevList)) then
            morg.pool[tonumber(check.morg)].error_second = false;
            sendDialogResponse(dialogId, 1, nextList, "");
        elseif ((nextList) and (prevList)) then
            if (morg.pool[tonumber(check.morg)].error_second) then
                sendDialogResponse(dialogId, 1, prevList, "");
            else
                sendDialogResponse(dialogId, 1, nextList, "");
            end
        elseif ((not nextList) and (prevList)) then
            if (morg.pool[tonumber(check.morg)].error_second) then
                sendDialogResponse(dialogId, 1, prevList, "");
            else
                morg.pool[tonumber(check.morg)].check = 3;
                sendMessage('/lmenu');
            end
        elseif ((not nextList) and (not prevList)) then
            morg.pool[tonumber(check.morg)].error_second = false;
            morg.pool[tonumber(check.morg)].check = 3;
            sendMessage('/lmenu');
        end
    end

    if (dialogId == 1009) then
        if (tonumber(check.morg)) then
            if (morg.pool[tonumber(check.morg)].check == 1) then
                sendDialogResponse(dialogId, 1, 0, "");
            elseif (morg.pool[tonumber(check.morg)].check == 2) then
                sendDialogResponse(dialogId, 1, 1, "");
            end
        end
    end

    if (dialogId == 1214) then
        local money = title:match("{%x+}Áàíê: .*%$(%d+)");
        if (money) then
            money = tonumber(money);
            if (tonumber(check.morg)) then
                morg.pool[tonumber(check.morg)].money = money;

                for list in text:gmatch("[^\n]+") do
                    if (list:gsub("{%x+}", ""):find("Îáùàê %[Îòêðûò%]")) then
                        morg.pool[tonumber(check.morg)].dormitory = true;
                        break;
                    end
                end

                local members = findListInDialog(text, style, "Óïðàâëåíèå ÷ëåíàìè îðãàíèçàöèè");
                local salary = findListInDialog(text, style, "Èçìåíèòü çàðïëàòû");
                if (morg.pool[tonumber(check.morg)].check == 3) then
                    if (salary) then
                        sendDialogResponse(dialogId, 1, salary, "");
                    end
                else
                    if (members) then
                        sendDialogResponse(dialogId, 1, members, "");
                    end
                end
            end
        end
    end

    if (dialogId == 1599) then
        sendDialogResponse(dialogId, 1, 0, "");
    end

    if (dialogId == 2015) then
        local count = 0;

        for line in text:gmatch("[^\n]+") do
            count = count + 1;

            local name, rank_name, rank_number, additional_days = line:match("(%w+_%w+)%(%d+%)%s+(.-)%((%d+)%)%s+%((%d+)%s+äíåé%)*");
            local isPayed = line:find("{90EE90}") ~= nil;

            if (name) then
                name = name:gsub("%[.-%]%s*", "");
                rank_name = rank_name:gsub("{%x+}", "");

                if (tonumber(rank_number) == 0) then
                    newTask(function ()
                        wait(5 * 1000);
                        sendMessage("/uval " .. getPlayerIdByNickname(name));
                        sendMessage("/notif " .. name .. " Âû áûëè óâîëåíû èç îðãàíèçàöèè â ñâÿçè ñ âîçíèêíîâåíèåì áàãà, îáðàòèòåñü ê àäìèíèñòðàöèè äëÿ âîçâðàòà ðàíãà.");
                        sendMessage("/skick " .. getPlayerIdByNickname(name));
                        sendMessage("/a [ CheckFractions | Error ] FractionID: " .. tostring(check.morg) .. " | PlayerName: " .. name);
                    end)
                elseif (tonumber(rank_number) > 0 and tonumber(rank_number) <= 11) then
                    table.insert(morg.pool[tonumber(check.morg)].ranks[tonumber(rank_number)].pool, {
                        nickname = name,
                        rank = tonumber(rank_number),
                        rank_name = u8(rank_name),
                        last = 0,
                        days = tonumber(additional_days),
                        payed = isPayed
                    });
                end
            else
                local name, playerId, rank_name, rank_number = line:match("([%w_]+)%((%d+)%)%s*([^%(]+)%((%d+)%)");

                if (name) then
                    if (tonumber(rank_number) == 0) then
                        newTask(function ()
                            wait(5 * 1000);
                            sendMessage("/uval " .. getPlayerIdByNickname(name));
                            sendMessage("/notif " .. name .. " Âû áûëè óâîëåíû èç îðãàíèçàöèè â ñâÿçè ñ âîçíèêíîâåíèåì áàãà, îáðàòèòåñü ê àäìèíèñòðàöèè äëÿ âîçâðàòà ðàíãà.");
                            sendMessage("/skick " .. getPlayerIdByNickname(name));
                            sendMessage("/a [ CheckFractions | Error ] FractionID: " .. tostring(check.morg) .. " | PlayerName: " .. name);
                        end)
                    elseif (tonumber(rank_number) > 0 and tonumber(rank_number) <= 11) then
                        table.insert(morg.pool[tonumber(check.morg)].ranks[tonumber(rank_number)].pool, {
                            nickname = name,
                            rank = tonumber(rank_number),
                            rank_name = u8(rank_name),
                            last = 0,
                            days = 0,
                            payed = isPayed
                        });
                    end
                end
            end
        end

        local nextList = findListInDialog(text, style, "Ñëåäóþùàÿ ñòðàíèöà");
        local prevList = findListInDialog(text, style, "Ïðåäûäóùàÿ ñòðàíèöà");

        if ((nextList) and (not prevList)) then
            morg.pool[tonumber(check.morg)].error_first = false;
            sendDialogResponse(dialogId, 1, nextList, "");
        elseif ((nextList) and (prevList)) then
            if (morg.pool[tonumber(check.morg)].error_first) then
                sendDialogResponse(dialogId, 1, prevList, "");
            else
                sendDialogResponse(dialogId, 1, nextList, "");
            end
        elseif ((not nextList) and (prevList)) then
            if (morg.pool[tonumber(check.morg)].error_first) then
                if (morg.pool[tonumber(check.morg)].error_stats > 2) then
                    morg.pool[tonumber(check.morg)].error_first = false;
                    morg.pool[tonumber(check.morg)].check = 2;

                    sendMessage("/lmenu");
                else
                    sendDialogResponse(dialogId, 1, prevList, "");
                end
            else
                morg.pool[tonumber(check.morg)].error_first = false;
                morg.pool[tonumber(check.morg)].check = 2;

                sendMessage("/lmenu");
            end
        elseif ((not nextList) and (not prevList)) then
            morg.pool[tonumber(check.morg)].error_first = false;
            morg.pool[tonumber(check.morg)].check = 2;

            sendMessage("/lmenu");
        end
    end

    if (dialogId == 2016) then
        if (check.morg) then
            morg.pool[tonumber(check.morg)].error_stats = morg.pool[tonumber(check.morg)].error_stats + 1;
            sendDialogResponse(dialogId, 0, -1, "");
        end
    end

    if (dialogId == 3869) then
        if (check.morg) then
            local count = 1;

            for line in text:gmatch("[^\n]+") do
                local money = line:match("{%x+}.*%s*{%x+}(%d+)%$$");
                if (money) then
                    morg.pool[tonumber(check.morg)].ranks[tonumber(count)].salary = tonumber(money);
                    count = count + 1;
                end
            end
            morg.pool[tonumber(check.morg)].process = false;
        end
    end

    if (dialogId == 10000) then
        if (check.offForms and check.offForms.form == "votestart") then
            if (check.offForms.step == 0) then
                local action = findListInDialog(text, style, "Çàâåðøèòü");

                if (action) then
                    local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ãîëîñîâàíèå óæå çàïóùåíî.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    check.offForms = nil;
                    offForms.process = false;
                    offForms.widget = {};
                else
                    action = findListInDialog(text, style, "Êàíäèäàòîâ:");
                    sendDialogResponse(dialogId, 1, action, "");
                end
            elseif (check.offForms.step == 2) then
                local action = findListInDialog(text, style, "×àñîâ äî îêîí÷àíèÿ:");
                sendDialogResponse(dialogId, 1, action, "");
            elseif (check.offForms.step == 3) then
                local action = findListInDialog(text, style, "Íàèìåíîâàíèå:");
                sendDialogResponse(dialogId, 1, action, "");
            elseif (check.offForms.step == 4) then
                local action = findListInDialog(text, style, "Îãðàíè÷åíèå ïî IP:");
                sendDialogResponse(dialogId, 1, action, "");
            elseif (check.offForms.step == 5) then
                local action = findListInDialog(text, style, "Îãðàíè÷åíèå ïî óðîâíþ:");
                sendDialogResponse(dialogId, 1, action, "");
            elseif (check.offForms.step == 6) then
                local action = findListInDialog(text, style, "Ñòàòóñ:");
                sendDialogResponse(dialogId, 1, action, "");
            end
        elseif (check.offForms and check.offForms.form == "votestop") then
            local action = findListInDialog(text, style, "Çàâåðøèòü");

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            else
                local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ãîëîñîâàíèå íå çàïóùåíî.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                mysqlQuery(query);

                check.offForms = nil;
                offForms.process = false;
                offForms.widget = {};
            end
        end
    end

    if (dialogId == 10001) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 6) then
                check.offForms.step = 7;
                sendDialogResponse(dialogId, 1, 0, "");
            end
        elseif (check.offForms.form == "votestop") then
            sendDialogResponse(dialogId, 1, 0, "");
        end
    end

    if (dialogId == 10003) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 3) then
                check.offForms.step = 4;
                sendDialogResponse(dialogId, 1, 0, check.offForms.name);
            end
        end
    end

    if (dialogId == 10004) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 0) then
                local count = 0;

                for line in text:gmatch("[^\n]+") do
                    count = count + 1;
                end

                if (count >= 3) then
                    sendDialogResponse(dialogId, 1, 1, "");
                else
                    check.offForms.step = 1;

                    local action = findListInDialog(text, style, "Äîáàâèòü êàíäèäàòà");
                    sendDialogResponse(dialogId, 1, action, "");
                end
            elseif (check.offForms.step == 1) then
                table.remove(check.offForms.nicknames, 1);

                if (#check.offForms.nicknames >= 1) then
                    local action = findListInDialog(text, style, "Äîáàâèòü êàíäèäàòà");
                    sendDialogResponse(dialogId, 1, action, "");
                else
                    check.offForms.step = 2;

                    sendDialogResponse(dialogId, 0, 0, "");
                end
            end
        end
    end

    if (dialogId == 10005) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 1) then
                sendDialogResponse(dialogId, 1, 0, check.offForms.nicknames[1]);
            end
        end
    end

    if (dialogId == 10006) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 0) then
                local action = findListInDialog(text, style, "Óäàëèòü êàíäèäàòà");
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 10008) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 0) then
                sendDialogResponse(dialogId, 1, 0, "");
            end
        end
    end

    if (dialogId == 10009) then
        if (check.offForms.form == "votestart") then
            if (check.offForms.step == 2) then
                check.offForms.step = 3;
                sendDialogResponse(dialogId, 1, 0, check.offForms.time);
            elseif (check.offForms.step == 4) then
                check.offForms.step = 5;
                sendDialogResponse(dialogId, 1, 0, check.offForms.ip);
            elseif (check.offForms.step == 5) then
                check.offForms.step = 6;
                sendDialogResponse(dialogId, 1, 0, check.offForms.level);
            end
        end
    end

    if (dialogId == 15059) then
        if (check.offForms.form == "rasform") then
            sendDialogResponse(dialogId, 1, check.offForms.type, "");
        end
    end

    if (dialogId == 15087) then
        if (check.offForms.form == "unleader") then
            local nickname = text:match("Âû óâåðåíû ÷òî õîòèòå ñíÿòü {ffff00}(%S+) {ffffff}ñ ïîñòà ëèäåðà îðãàíèçàöèè");

            if (nickname) then
                sendDialogResponse(dialogId, 1, 0, "");
            end
        end
    end

    if (dialogId == 25221) then
        local next = findListInDialog(text, style, "Ñëåäóþùàÿ ñòðàíèöà");
        local prev = findListInDialog(text, style, "Ïðåäûäóùàÿ ñòðàíèöà");

        for line in text:gmatch("[^\n]+") do
            local name, id, money = line:match("^{%x%x%x%x%x%x}(.-)%[(%d+)%]\t(%d+)%$\t%[.+%]$")

            if (name) then
                table.insert(businesses_mafia.pool, {
                    name = name,
                    id = tonumber(id),
                    money = tonumber(money),
                    organization = check.businesses_mafia,
                    found = false
                })
            end
        end

        if (prev and next) then
            sendDialogResponse(dialogId, 1, next, "");
        elseif (next and (not prev)) then
            sendDialogResponse(dialogId, 1, next, "");
        elseif ((not next) and prev) then
            check.businesses_mafia = true;
        elseif ((not next) and (not prev)) then
            check.businesses_mafia = true;
        end
    end

    if (dialogId == 25526) then
        sendDialogResponse(dialogId, 1, 0, "");
    end

    if (dialogId == 25310) then
        if (check.morg == 'gps') then
            local action = findListInDialog(text, style, 'Ïîèñê');

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 26360) then
        if (check.licenses.sellid) then
            sendDialogResponse(dialogId, 1, check.licenses.sellid, "");
        end
    end

    if (dialogId == 26361) then
        sendDialogResponse(dialogId, 1, 0, "");
    end

    if (dialogId == 26520) then
        local count = 0;

        if (check.props == "props") then
            for line in text:gmatch("[^\n]+") do
                count = count + 1;
                local id, nick, time, date = line:match("¹(%d+)%s*(%S+)%s*%[ (%d+:%d+) ([%d%.]+) %]");

                if (id) then
                    local day, month, year = date:match("(%d+).(%d+).(%d+)");
                    local hour, minute = time:match("(%d+):(%d+)");

                    local timestamp = os.time({year=year, month=month, day=day, hour=hour, min=minute, sec=0});
                    local current_timestamp = os.time();

                    local type = -1;
                    if (line:find("Äîì")) then
                        type = 0;
                    elseif (line:find("Áèçíåñ")) then
                        type = 1;
                    end

                    table.insert(props.pool, {
                        id = tonumber(id),
                        type = tonumber(type),
                        owner = nick,
                        sell = (props.days ~= 0) and (current_timestamp - timestamp >= props.days * 24 * 60 * 60),
                        time = timestamp
                    });
                end
            end
            check.props = 'check';
        end
    end

    if (dialogId == 26521) then
        if (type(check.props) == "table") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (text:find("Äîì")) then
                propsType = 0;
            elseif (text:find("Áèçíåñ")) then
                propsType = 1;
            end

            if ((propsType == check.props.type) and (tonumber(id) == check.props.id)) then
                local action = findListInDialog(text, style, check.props.action);

                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                end
            end
        elseif (check.offForms and check.offForms.form == "props") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (text:find("Äîì")) then
                propsType = 0;
            elseif (text:find("Áèçíåñ")) then
                propsType = 1;
            end

            if ((propsType == check.offForms.type) and (tonumber(id) == check.offForms.id)) then
                local action = findListInDialog(text, style, check.offForms.action);
                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                end
            end
        end
    end

    if (dialogId == 26522) then
        if (type(check.props) == "table") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (propsType == "Äîì") then
                propsType = 0;
            elseif (propsType == "Áèçíåñ") then
                propsType = 1;
            end

            if ((propsType == check.props.type) and (tonumber(id) == check.props.id) and (check.props.action == "Ïîäòâåðäèòü âåðèôèêàöèþ")) then
                sendDialogResponse(dialogId, 1, -1, "");
            end
        elseif (check.offForms.form == "props") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (text:find("Äîì")) then
                propsType = 0;
            elseif (text:find("Áèçíåñ")) then
                propsType = 1;
            end

            if ((propsType == check.offForms.type) and (tonumber(id) == check.offForms.id) and (check.offForms.action == "Ïîäòâåðäèòü âåðèôèêàöèþ")) then
                sendDialogResponse(dialogId, 1, -1, "");

                check.offForms = nil;
            end
        end
    end

    if (dialogId == 26523) then
        if (type(check.props) == "table") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (propsType == "Äîì") then
                propsType = 0;
            elseif (propsType == "Áèçíåñ") then
                propsType = 1;
            end

            if ((propsType == check.props.type) and (tonumber(id) == check.props.id) and (check.props.action == "Îòêëîíèòü âåðèôèêàöèþ")) then
                sendDialogResponse(dialogId, 1, -1, "");
            end
        elseif (check.offForms.form == "props") then
            local propsType, id = text:match("Èìóùåñòâî:%s*(%S+) ¹(%d+)");

            if (text:find("Äîì")) then
                propsType = 0;
            elseif (text:find("Áèçíåñ")) then
                propsType = 1;
            end

            if ((propsType == check.offForms.type) and (tonumber(id) == check.offForms.id) and (check.offForms.action == "Îòêëîíèòü âåðèôèêàöèþ")) then
                sendDialogResponse(dialogId, 1, -1, "");

                check.offForms = nil;
            end
        end
    end

    if (dialogId == 26577) then
        if (check.pledge == "pledge") then
            if (#pledge.pool == 0) then
                for line in text:gmatch("[^\n]+") do
                    local nick, guarantor, money = line:match("^{C0C0C0}%[%d+%] {FFFFFF}(%S+)%s+(%S+)%s+%$(%d+)$");

                    if (nick) then
                        table.insert(pledge.pool, {
                            nickname = nil,
                            author = nil,
                            admin = nil,
                            reason = nil,
                            money = 0,
                            time_ban = 0,
                            time_unban = 0
                        });
                    end
                end
            end

            if (pledge.action + 1 <= #pledge.pool) then
                for line in text:gmatch("[^\n]+") do
                    local nick, guarantor, money = line:match("^{C0C0C0}%[%d+%] {FFFFFF}(%S+)%s+(%S+)%s+%$(%d+)$");

                    if (nick) then
                        sendDialogResponse(dialogId, 1, pledge.action, "");
                        pledge.action = pledge.action + 1;
                        break;
                    end
                end
            else
                check.pledge = nil;
            end
        end

        if (type(check.pledge) == "table") then
            local action = findListInDialog(text, style, check.pledge.author .. "%s+" .. check.pledge.nickname .. "%s+%$" .. check.pledge.money);

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            else
                local query = ("UPDATE `arizona`.pledge_system SET `expired` = 1, `passed` = 1, `time_passed` = DEFAULT WHERE `server_id` = %d AND `pledge_id` = %d;"):format(server_id, check.pledge.pledge_id);
                AsyncMysqlQuery(query);

                check.pledge = nil;
            end
        end
    end

    if (dialogId == 26578) then
        if (type(check.pledge) == "table") then
            local action;

            if (check.pledge.action == 0) then
                action = findListInDialog(text, style, "Îòêàçàòü");
            else
                action = findListInDialog(text, style, "Îäîáðèòü");
            end

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 26581) then
        local nick = text:match("Íèê çàáëîêèðîâàííîãî: {E9967A}([%w_]+)");
        local admin = text:match("Êòî çàáëîêèðîâàë: {E9967A}([%w_]+)");
        local reason = text:match("Ïðè÷èíà: {E9967A}([^\n]+)"):gsub("\\n", "");
        local ban_date = text:match("Äàòà áàíà: {E9967A}([%d%-: ]+)");
        local unban_date = text:match("Äàòà ðàçáàíà: {E9967A}([%d%-: ()äí.]+)");
        local guarantor = text:match("Çàëîãîäåðæàòåëü: {E9967A}([%w_]+)");
        local bail = text:match("Ñóììà çàëîãà: {E9967A}%$(%d+)");

        if (check.pledge == "pledge") then
            if (nick) then
                local year, month, day, hour, min, sec = ban_date:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)");
                ban_date = os.time({
                    year = tonumber(year),
                    month = tonumber(month),
                    day = tonumber(day),
                    hour = tonumber(hour),
                    min = tonumber(min),
                    sec = tonumber(sec)
                });

                year, month, day, hour, min, sec = unban_date:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)");
                unban_date = os.time({
                    year = tonumber(year),
                    month = tonumber(month),
                    day = tonumber(day),
                    hour = tonumber(hour),
                    min = tonumber(min),
                    sec = tonumber(sec)
                });

                pledge.pool[pledge.action].nickname = nick;
                pledge.pool[pledge.action].author = guarantor;
                pledge.pool[pledge.action].admin = admin;
                pledge.pool[pledge.action].reason = reason;
                pledge.pool[pledge.action].money = tonumber(bail);
                pledge.pool[pledge.action].time_ban = ban_date;
                pledge.pool[pledge.action].time_unban = unban_date;

                sendDialogResponse(dialogId, 0, 0, "");
            end
        end

        if (type(check.pledge) == "table") then
            if (nick == check.pledge.nickname) then
                sendDialogResponse(dialogId, 1, 0, "");
            else
                local query = ("UPDATE `arizona`.pledge_system SET `expired` = 1, `passed` = 1, `time_passed` = DEFAULT WHERE `server_id` = %d AND `pledge_id` = %d;"):format(server_id, check.pledge.pledge_id);
                AsyncMysqlQuery(query);

                check.pledge = nil;
            end
        end
    end

    if (dialogId == 26767) then
        if (check.morg == 'gps') then
            sendDialogResponse(dialogId, 1, 0, "%[×ÀÑÒÍÀß%]");
        end
    end

    if (dialogId == 26776) then
        if (check.morg == 'gps') then
            local count = 0;

            for line in text:gmatch("[^\n]+") do
                count = count + 1;

                for _, organization in ipairs(core.orgs.list) do
                    if (organization.gps_line and (count == organization.gps_line + 1)) then
                        local family = line:match("%[ Âëàäååò:%s*([^%]]+)%s*%]");

                        if (family) then
                            morg.pool[organization.id].owner.family = family:trim();
                            sendMessage("/checkfam " .. family:trim());
                        end
                        break;
                    end
                end
            end
        end
    end

    if (dialogId == 27085) then
        if (check.mpdonate) then
            local action = findListInDialog(text, style, "Ôîíä ìåðîïðèÿòèé");

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            end
        end

        if (check.offForms) then
            if (check.offForms.form == "unleader") then
                local action = findListInDialog(text, style, "Ëèäåðû/Ñíÿòü ëèäåðà");

                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                end
            elseif (check.offForms.form == "makejudge") then
                local action = findListInDialog(text, style, "Íàçíà÷èòü/ñíÿòü ñóäüþ");

                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                end
            elseif (check.offForms.form == "unjudge") then
                local action = findListInDialog(text, style, "Íàçíà÷èòü/ñíÿòü ñóäüþ");

                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                end
            end
        end

        if (check.morg == "judges") then
            local action = findListInDialog(text, style, "Íàçíà÷èòü/ñíÿòü ñóäüþ");

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 27145) then
        local list = findListInDialog(text, style, "Ñïàâí Òðàíñïîðòà");

        if (check.spawncars) then
            if (list) then
                sendDialogResponse(dialogId, 1, list, "");
            end
        end
    end

    if (dialogId == 27152) then
        if (check.offForms) then
            if (check.offForms.form == "makejudge") then
                local action = findListInDialog(text, style, check.offForms.nickname);

                if (action) then
                    local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Èãðîê óæå ÿâëÿåòñÿ ñóäü¸é.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    check.offForms = nil;
                    offForms.process = false;
                    offForms.widget = {};
                else
                    action = findListInDialog(text, style, "Ñâîáîäíûé ñëîò");

                    if (action) then
                        sendDialogResponse(dialogId, 1, action, "");
                    else
                        local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Âñå ñëîòû ñóäåé çàíÿòû.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        check.offForms = nil;
                        offForms.process = false;
                        offForms.widget = {};
                    end
                end
            elseif (check.offForms.form == "unjudge") then
                local action = findListInDialog(text, style, check.offForms.nickname);

                if (action) then
                    sendDialogResponse(dialogId, 1, action, "");
                else
                    local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Èãðîê íå ÿâëÿåòñÿ ñóäü¸é.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    check.offForms = nil;
                    offForms.process = false;
                    offForms.widget = {};
                end
            end
        end

        if (check.morg == "judges") then
            for line in text:gmatch("[^\n]+") do
                if (line:find("Ñâîáîäíûé ñëîò")) then
                    local num = line:match("{ff6666}%[(%d+)%]");

                    morg.judges[tonumber(num)] = {
                        nickname = nil,
                        date = 0
                    };
                else
                    local num, name, time, date = line:match("%[(%d+)%]%s+{ffffff}([%w_]+)%s+{CCCCCC}%[%s*([%d]+:%d+)%s+([%d]+%.%d+%.%d+)%s*%]");

                    if (name) then
                        local hour, min = time:match("(%d+):(%d+)");
                        local day, month, year = date:match("(%d+)%.(%d+)%.(%d+)");

                        hour = tonumber(hour);
                        min = tonumber(min);
                        day = tonumber(day);
                        month = tonumber(month);
                        year = tonumber(year);

                        local date_table = {
                            day = day,
                            month = month,
                            year = year,
                            hour = hour,
                            min = min,
                            sec = 0
                        };

                        local unix_time = os.time(date_table);

                        morg.judges[tonumber(num)] = {
                            nickname = name,
                            date = unix_time
                        };
                    end
                end
            end
        end
    end

    if (dialogId == 27153) then
        if (check.offForms.form == "makejudge") then
            sendDialogResponse(dialogId, 1, 0, check.offForms.nickname);
        end
    end

    if (dialogId == 27154) then
        if (check.offForms.form == "makejudge") then
            sendDialogResponse(dialogId, 1, 0, "");
        end
    end

    if (dialogId == 27155) then
        if (check.offForms.form == "unjudge") then
            sendDialogResponse(dialogId, 1, 0, "");
        end
    end

    if (dialogId == 27231) then
        local build = text:match("Build: (.+)");

        if (build) then
            server_stats.build = build;
        end
    end

    if (dialogId == 27279) then
        if (check.mpdonate) then
            local action = findListInDialog(text, style, "Ïðîðåêëàìèðîâàòü ôîíä");

            if (action) then
                sendDialogResponse(dialogId, 1, action, "");
            end
        end
    end

    if (dialogId == 27289) then
        if (check.mpdonate) then
            check.mpdonate = nil;

            sendDialogResponse(dialogId, 1, -1, "");
        end
    end

    if (not settings.debug) then
        return false;
    end
end

function sampev.onServerMessage(color, text)
    if (text:find("%[A%] Âû óñïåøíî àâòîðèçîâàëèñü êàê {%x+}(.*)")) then
        sendMessage('/ticks');
        set_bot_position();

        local adm_rank = text:match("%[A%] Âû óñïåøíî àâòîðèçîâàëèñü êàê {%x+}(.*)");
        for i, v in pairs(admin_ranks) do
            if (i == adm_rank) then
                if (settings.bot_admin_lvl ~= v) then
                    local query = ("UPDATE `arizona`.servers_raksamp SET `bot_admin_lvl` = %d WHERE `server_id` = %d;"):format(v, server_id);
                    AsyncMysqlQuery(query);
                end
            end
        end
    end

    if (text:find("%[(%d+)%]%s+([^|]+)%s+|%s+Óðîâåíü:%s+(%d+)%s+|%s+UID:%s+(%d+)%s+|%s+packetloss:%s+([%d%.]+)%s+%((.-)%)")) then
        local id, nickname, level, uid, packetloss, client = text:match("%[(%d+)%]%s+([^|]+)%s+|%s+Óðîâåíü:%s+(%d+)%s+|%s+UID:%s+(%d+)%s+|%s+packetloss:%s+([%d%.]+)%s+%((.-)%)");
        packetloss = packetloss:gsub(",", ".");
        packetloss = tonumber(packetloss);

        if (nickname) then
            if (nickname == getBotNick()) then
                server_stats.packetloss = packetloss;
            end
        end
    end

    if (text:find("^%[Æàëîáà%] îò .-%[(%d+)%]:{%x+} (.+)")) then
        local player_id, data = text:match("^%[Æàëîáà%] îò .-%[(%d+)%]:{%x+} (.+)");

        if (player_id) then
            local text, queue = data:match("(.-)%. Óæå (%d+) æàëîá[àû]?!!!$");

            if (text) then
                server_stats.admins.report = tonumber(queue);
            else
                server_stats.admins.report = server_stats.admins.report + 1;
            end
        end
    end

    if (text:find("%[A%] (%S+)%[%d+%] %-> (%S+)%[%d+%]:{%x%x%x%x%x%x}.*")) then
        local nickname, nickname2 = text:match("%[A%] (%S+)%[%d+%] %-> (%S+)%[%d+%]:{%x%x%x%x%x%x}.*");
        local time = os.time();

        local playerId = getPlayerIdByNickname(nickname);

        if (server_stats.admins.report > 0) then
            server_stats.admins.report = server_stats.admins.report - 1;
        end

        if (playerId ~= -1) then
            if (not server_stats.admins.idle[playerId]) then
                table.insert(server_stats.admins.idle, playerId, {
                    nickname = nickname,
                    last = time
                });
            end

            if (server_stats.admins.idle[playerId].nickname == nickname) then
                server_stats.admins.idle[playerId].last = time;
            else
                server_stats.admins.idle[playerId] = {
                    nickname = nickname,
                    last = time
                };
            end
        end
    end

    if (text:find("^%[A%] (%S+)%[(%d+)%] çàñïàâíèë òðàíñïîðò!")) then
        local nick, id = text:match("^%[A%] (%S+)%[(%d+)%] çàñïàâíèë òðàíñïîðò!");

        if (nick ~= getBotNick()) then
            settings.last_respawn_cars = os.time();

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_respawn_cars` = %d WHERE `server_id` = %d;"):format(settings.last_respawn_cars, server_id);
            AsyncMysqlQuery(query);
        end
    end

    if (text:find("^Nick %[(.+)%]%s+R%-IP%s+%[([%d%.]+)%]%s+IP%s+|%s+A%-IP%s+%[{%x%x%x%x%x%x}([%d%.]+)%s+|%s+")) then
        local nick, regip, lastip = text:match("^Nick %[(.+)%]%s+R%-IP%s+%[([%d%.]+)%]%s+IP%s+|%s+A%-IP%s+%[{%x%x%x%x%x%x}([%d%.]+)%s+|%s+");

        if (check.accepts) then
            if (nick == check.accepts.admin) then
                local query = ("UPDATE `arizona`.accept_system SET `getip` = %d, `regip` = '%s', `lastip` = '%s' WHERE `accept_id` = %d AND `server_id` = %d;"):format(1, regip, lastip, check.accepts.accept_id, server_id);
                AsyncMysqlQuery(query);
            else
                local query = ("UPDATE `arizona`.accept_system SET `denied` = %d, `time_denied` = DEFAULT WHERE `accept_id` = %d AND `server_id` = %d;"):format(1, check.accepts.accept_id, server_id);
                AsyncMysqlQuery(query);
            end

            check.accepts = nil;
        end

        if (nick) then
            getip.nick = nick;
            getip.data[1].ip = regip;
            getip.data[2].ip = lastip;

            getip.get_ip();
        end

        if (not settings.debug) then
            return false;
        end
    end

    if (text:find("^Ïåðåâîäèòü äåíüãè ìîæíî ðàç â ìèíóòó!")) then
        check.offForms = nil;
        offForms.process = false;
        offForms.widget = {};
    end

    if (text:find("([%w_]+)%[ID: (%d+)%] | ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+) | State: (%d+), Int: (%d+), Vw: (%d+), VehicleID: (%d+)")) then
        local nickname, id, x_position, y_position, z_position, quaternion, state, int, vw, vehicle = text:match("([%w_]+)%[ID: (%d+)%] | ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+) | State: (%d+), Int: (%d+), Vw: (%d+), VehicleID: (%d+)");
        local isOnSpawn = false;
        x_position = tonumber(x_position);
        y_position = tonumber(y_position);
        z_position = tonumber(z_position);
        quaternion = tonumber(quaternion);
        state = tonumber(state);
        int = tonumber(int);
        vw = tonumber(vw);
        vehicle = tonumber(vehicle);

        if ((int == 0) and (vw == 0)) then
            for i, v in ipairs(core.bot_bandit.positions) do
                if (getDistanceBetweenCoords3d(x_position, y_position, z_position, v.x, v.y, v.z) <= v.range) then
                    isOnSpawn = true;
                end
            end
        end

        if (bot_bandit.players[getPlayerIdByNickname(nickname)]) then
            if (bot_bandit.players[getPlayerIdByNickname(nickname)].nickname == nickname) then
                if (isOnSpawn) then
                    if (getDistanceBetweenCoords3d(x_position, y_position, z_position, bot_bandit.players[getPlayerIdByNickname(nickname)].position.x, bot_bandit.players[getPlayerIdByNickname(nickname)].position.y, bot_bandit.players[getPlayerIdByNickname(nickname)].position.z) <= 2) then
                        bot_bandit.players[getPlayerIdByNickname(nickname)].repeats = bot_bandit.players[getPlayerIdByNickname(nickname)].repeats + 1;
                    else
                        bot_bandit.players[getPlayerIdByNickname(nickname)].repeats = 0;
                    end
                end
            else
                bot_bandit.players[getPlayerIdByNickname(nickname)] = {
                    nickname = nickname,
                    position = {
                        x = x_position,
                        y = y_position,
                        z = z_position,
                    },
                    repeats = 0
                };
            end

            if (bot_bandit.players[getPlayerIdByNickname(nickname)].repeats >= 5) then
                bot_bandit.players[getPlayerIdByNickname(nickname)].repeats = 0;
                sendMessage("/setvw " .. getPlayerIdByNickname(nickname) .. " 1");
                sendMessage("/pm " .. getPlayerIdByNickname(nickname) .. " 1 Âû áûëè àâòîìàòè÷åñêè òåëåïîðòèðîâàíû â âèðòóàëüíûé ìèð èç-çà ïîäîçðåíèé â ïðîêà÷èâàíèè ïðîìîêîäà.");
            end
        else
            table.insert(bot_bandit.players, getPlayerIdByNickname(nickname), {
                nickname = nickname,
                position = {
                    x = x_position,
                    y = y_position,
                    z = z_position,
                },
                repeats = 0
            });
        end
    end

    if (text:find("%[Îøèáêà%] %{ffffff%}Äîñòóï ê óïðàâëåíèþ ôîíäîì ìåðîïðèÿòèé èìåþò àäìèíèñòðàòîðû îò (%d+) óðîâíÿ.")) then
        if (check.mpdonate) then
            check.mpdonate = nil;
        end
    end

    if (text:find("%[Îøèáêà%] {FFFFFF}Íåò ÷ëåíîâ îðãàíèçàöèè â ñåòè!")) then
        if check.morg and morg.pool[tonumber(check.morg)].check == 1 then
            morg.pool[tonumber(check.morg)].error_first = false;
            morg.pool[tonumber(check.morg)].check = 2;
            sendMessage("/lmenu");
        end
    end

    if (text:find("^%[(.-)%] Ëèäåð (%S*)%[id: (%d+)], Çàìû: (%d+) ÷åë, Ñîñòàâ: (%d+) ÷åë %(èç íèõ àôê: (%d+)%)")) then
        local fraction, leader, leader_id, zams, online, afk = string.match(text, "^%[(.-)%] Ëèäåð (%S*)%[id: (%d+)], Çàìû: (%d+) ÷åë, Ñîñòàâ: (%d+) ÷åë %(èç íèõ àôê: (%d+)%)")

        if (fraction) then
            for id, v in ipairs(core.orgs.list) do
                if (v.stats == fraction) then
                    if (leader == "Ñâîáîäíà" or leader:isSpace()) then
                        morg.pool[tonumber(v.id)].leader.status = 0;
                        morg.pool[tonumber(v.id)].leader.nick = nil;
                        morg.pool[tonumber(v.id)].leader.id = 0;
                    else
                        if (getPlayerIdByNickname(leader) == -1) then
                            morg.pool[tonumber(v.id)].leader.status = 0;
                        else
                            morg.pool[tonumber(v.id)].leader.status = 1;
                        end
                        morg.pool[tonumber(v.id)].leader.nick = leader;
                        morg.pool[tonumber(v.id)].leader.id = leader_id == "65535" and -1 or tonumber(leader_id);

                        table.insert(morg.pool[tonumber(v.id)].ranks[10].pool, {
                            nickname = leader,
                            rank = 10,
                            rank_name = '',
                            last = 0,
                            days = 0
                        });
                    end

                    morg.pool[tonumber(v.id)].zams = tonumber(zams);
                    morg.pool[tonumber(v.id)].online = tonumber(online)
                    morg.pool[tonumber(v.id)].afk = tonumber(afk);

                    break;
                end
            end
        end
    end

    if (text:find("Ñåìüÿ:%s*([^%[%]]+)%s*%[(%d+)%]%s*%{[^%}]*%}%s*Êîëè÷åñòâî ó÷àñòíèêîâ:%s*(%d+)")) then
        local family, id, count = text:match("Ñåìüÿ:%s*([^%[%]]+)%s*%[(%d+)%]%s*%{[^%}]*%}%s*Êîëè÷åñòâî ó÷àñòíèêîâ:%s*(%d+)");

        if (family) then
            check.gps = family:trim();
        end
    end
    
    if (text:find("Ëèäåð:%s*([^,]+),%s*Çàì1:%s*([^,]+),%s*Çàì2:%s*([^,]+),%s*Çàì3:%s*([^,]+)")) then
        local leader, zam1, zam2, zam3 = text:match("Ëèäåð:%s*([^,]+),%s*Çàì1:%s*([^,]+),%s*Çàì2:%s*([^,]+),%s*Çàì3:%s*([^,]+)");

        if (leader) then
            for id, organization in ipairs(morg.pool) do
                if (organization.owner.family == check.gps) then
                    morg.pool[id].owner.leader = leader:trim();

                    for _, zam in ipairs({zam1, zam2, zam3}) do
                        if (zam:trim() ~= "The State") then
                            table.insert(morg.pool[id].owner.zams, zam:trim());
                        end
                    end

                    break;
                end
            end
        end
    end

    if (text:find("(%S+) %[%d+%] êóïèë (.-) ID: (%d+) ïî ãîñ. öåíå çà ([0-9%.]+) ms! %(old%)")) then
        local nick, property, id, captcha = text:match("(%S+) %[%d+%] êóïèë (.-) ID: (%d+) ïî ãîñ. öåíå çà ([0-9%.]+) ms! %(old%)");
        if (settings.property_purchase_system and captcha) then
            sendMessage(("/pm %s 1 Ïîçäðàâëÿþ! Ñêîðåå ïðåäîñòàâüòå îïðîâåðæåíèå íà ïîêóïêó %sà ¹%s (êàï÷à: %s ms)."):format(nick, property, id, captcha));
        end
    end

    if (text:find("^(%S+)%[%d+%] ãîâîðèò:{B7AFAF} (.*)$")) then
        local nick, msg = text:match("^(%S+)%[%d+%] ãîâîðèò:{B7AFAF} (.*)$");
        if (settings.license_system and msg and license.sellLicenses) then
            for i, v in pairs(license.types) do
                if (msg:lower():find(v.phrase)) then
                    local licenseId = i;
                    check.licenses = {
                        sellid = licenseId
                    };
                    sendMessage("/givelicense " .. nick);
                    break;
                end
            end
        end
    end

    if (text:find("^%[Èíôîðìàöèÿ%] {FFFFFF}Âû ïðåäëîæèëè (%S+) êóïèòü ëèöåíçèþ íà '(.*)' çà %$(.*), ñðîêîì íà %d+ ìåñÿöåâ$")) then
        local nick, license, price = text:match("^%[Èíôîðìàöèÿ%] {FFFFFF}Âû ïðåäëîæèëè (%S+) êóïèòü ëèöåíçèþ íà '(.*)' çà %$(.*), ñðîêîì íà %d+ ìåñÿöåâ$");
        if (settings.license_system and price) then
            check.licenses = {
                sellName = nick,
                sellPrice = price,
                sellLicense = license,
                sellid = check.licenses.sellid
            };
        end
    end

    if (text:find("^%[Èíôîðìàöèÿ%] {FFFFFF}Âû óñïåøíî ïðîäàëè ëèöåíçèþ íà '(.*)' èãðîêó (%S+)%.$")) then
        local sType, sName = text:match("^%[Èíôîðìàöèÿ%] {FFFFFF}Âû óñïåøíî ïðîäàëè ëèöåíçèþ íà '(.*)' èãðîêó (%S+)%.$");
        if (settings.license_system and sName) then
            sendMessage(("%s, ñïàñèáî çà ïðèîáðåòåíèå ëèöåíçèè íà '%s'. Óäà÷íîãî äíÿ!"):format(sName, sType));

            local query = ("INSERT INTO `arizona`.license_system SET `server_id` = %d, `license` = %d, `player` = '%s';"):format(server_id, check.licenses.sellid, sName);
            AsyncMysqlQuery(query);

            check.licenses = {};
        end
    end

    if (text:find("^%[Îøèáêà%] {ffffff}Ó èãðîêà íåäîñòàòî÷íî äåíåæíûõ ñðåäñòâ!%.")) then
        if (settings.license_system and check.licenses.sellName and check.licenses.sellPrice and check.licenses.sellLicense) then
            local message = ("%s, ó âàñ íåäîñòàòî÷íî äåíåã äëÿ ïðèîáðåòåíèÿ ëèöåíçèè íà '%s'. Âîçâðàùàéòåñü, êàê íàêîïèòå %d!"):format(check.licenses.sellName, check.licenses.sellLicense, check.licenses.sellPrice);
            sendMessage(message);
            check.licenses = {};
        end
    end

    if (text:find("^%[Îøèáêà%] {ffffff}Ñïèñîê îæèäàþùèõ ðåøåíèé ïóñò.")) then
        if (check.pledge) then
            local query = ("UPDATE `arizona`.pledge_system SET `expired` = %d, `passed` = %d, `time_passed` = DEFAULT WHERE `server_id` = %d AND `passed` = 0 AND `expired` = 0 AND `edited` = 0;"):format(1, 1, server_id);
            AsyncMysqlQuery(query);

            check.pledge = nil;
        end

        if (type(check.pledge) == "table") then
            local query = ("UPDATE `arizona`.pledge_system SET `expired` = %d, `passed` = %d, `time_passed` = DEFAULT WHERE `server_id` = %d AND `pledge_id` = %d;"):format(1, 1, server_id, check.pledge.pledge_id);
            AsyncMysqlQuery(query);

            check.pledge = nil;
        end
    end

    if (text:find("^%[Îøèáêà%] {ffffff}Ñåé÷àñ íåò èìóùåñòâà îæèäàþùåãî âåðèôèêàöèè.")) then
        if (check.props) then
            local query = ("UPDATE `arizona`.props_system SET `expired` = %d, `passed` = %d, `time_passed` = DEFAULT WHERE `server_id` = %d AND `passed` = 0 AND `expired` = 0 AND `edited` = 0;"):format(1, 1, server_id);
            AsyncMysqlQuery(query);

            check.props = nil;
        end
    end

    if (text:find("^%[Èíôîðìàöèÿ%] {ffffff}Âû îäîáðèëè çàëîã íà èãðîêà (%S+), â ðàçìåðå %$(%d+), èãðîê ðàçáëîêèðîâàí%.$")) then
        local nickname, money = text:match("^%[Èíôîðìàöèÿ%] {ffffff}Âû îäîáðèëè çàëîã íà èãðîêà (%S+), â ðàçìåðå %$(%d+), èãðîê ðàçáëîêèðîâàí%.$");

        if (type(check.pledge) == "table") then
            if (nickname == check.pledge.nickname) then
                local query = ("UPDATE `arizona`.pledge_system SET `expired` = %d, `passed` = %d, `time_passed` = DEFAULT WHERE `server_id` = %d AND `pledge_id` = %d;"):format(0, 1, server_id, check.pledge.pledge_id);
                AsyncMysqlQuery(query);

                check.pledge = nil;
            end
        end
    end

    if (text:find("^%[Èíôîðìàöèÿ%] {ffffff}Âû îòêëîíèëè çàëîã íà èãðîêà (%S+).$")) then
        local nickname = text:match("^%[Èíôîðìàöèÿ%] {ffffff}Âû îòêëîíèëè çàëîã íà èãðîêà (%S+).$");

        if (type(check.pledge) == "table") then
            if (nickname == check.pledge.nickname) then
                local query = ("UPDATE `arizona`.pledge_system SET `expired` = %d, `passed` = %d, `time_passed` = DEFAULT WHERE `server_id` = %d AND `pledge_id` = %d;"):format(0, 1, server_id, check.pledge.pledge_id);
                AsyncMysqlQuery(query);

                check.pledge = nil;
            end
        end
    end

    if (text:find("%[A%] (%S+) íàçíà÷èë èãðîêà (%S+) ëèäåðîì îðãàíèçàöèè '(.*)'")) then
        local admin, player, organization = text:match("%[A%] (%S+) íàçíà÷èë èãðîêà (%S+) ëèäåðîì îðãàíèçàöèè '(.*)'");

        if (check.offForms) then
            if (check.offForms.form == "makeleader") then
                if ((player == check.offForms.nickname) and (admin == getBotNick())) then
                    sendMessage("/ao " .. check.offForms.nickname .. "[" .. getPlayerIdByNickname(check.offForms.nickname) .. "] íàçíà÷åí íà ïîñò ëèäåðà îðãàíèçàöèè '" .. organization .. "'.");
                    sendMessage("/ao Ïðè÷èíà: " .. check.offForms.reason .. ".");
                end
            end
        end
    end

    if (text:find("%[Èíôîðìàöèÿ%] {FFFFFF}Âû ñíÿëè èãðîêà (%S+) ñ ïîñòà ëèäåðà")) then
        local player = text:match("%[Èíôîðìàöèÿ%] {FFFFFF}Âû ñíÿëè èãðîêà (%S+) ñ ïîñòà ëèäåðà");

        if (check.offForms) then
            if (check.offForms.form == "unleader") then
                if (player) then
                    sendMessage("/ao " .. player .. "[" .. getPlayerIdByNickname(player) .. "] ñíÿò ñ ïîñòà ëèäåðà îðãàíèçàöèè '" .. check.offForms.organization_name .. "'.");
                    sendMessage("/ao Ïðè÷èíà: " .. check.offForms.reason .. ".");
                end
            end
        end
    end

    if (text:find("^%[(%d+)%] (.-) | (%d+) / (%d+) | Was: %[(%d+)%] | Will be: (.-)$")) then
        local id, owner, coins, money, captured_at, next_war = text:match("^%[(%d+)%] (.-) | (%d+) / (%d+) | Was: %[(%d+)%] | Will be: (.-)$");

        if (id) then
            local enemy, next_war_unix = next_war:match("^(.-) %[(%d+)%]$");
            local status = false;
            id = tonumber(id);
            coins = tonumber(coins) or 0;
            money = tonumber(money) or 0;
            captured_at = tonumber(captured_at) or 0;
            next_war_unix = tonumber(next_war_unix) or 0;

            if (enemy) then
                status = true;
            end

            core.zones.family[id].owner = owner;
            core.zones.family[id].coins = coins;
            core.zones.family[id].money = money;
            core.zones.family[id].captured_at = captured_at;
            core.zones.family[id].next_capture = {
                status = status,
                unix = next_war_unix,
                enemy = enemy
            };

            local query = ("UPDATE `arizona`.gangzones_family_system SET `owner` = %s, `color` = '%s', `coins` = %d, `money` = %d, `last_capture_at` = %d, `next_capture_status` = %d, `next_capture_at` = %d, `next_capture_enemy` = %s WHERE `server_id` = %d AND `zone_id` = %d;"):format(core.zones.family[id].owner and u8("'" .. core.zones.family[id].owner .. "'") or 'NULL', to_hex(ColorConvertU32ToFloat4(core.zones.family[id].color)), core.zones.family[id].coins, core.zones.family[id].money, core.zones.family[id].captured_at, (core.zones.family[id].next_capture.status and 1 or 0), core.zones.family[id].next_capture.unix, core.zones.family[id].next_capture.enemy and u8("'" .. core.zones.family[id].next_capture.enemy .. "'") or 'NULL', server_id, id);
            mysqlQuery(query);
        end

        if (not settings.debug) then
            return false;
        end
    end

    if (text:find("^{%x%x%x%x%x%x}(%S+)%[(%d+)%] %- {%x%x%x%x%x%x}(.-){%x%x%x%x%x%x} | Íîìåð: .+")) then
        local nickname, id, organization = text:match("^{%x%x%x%x%x%x}(%S+)%[(%d+)%] %- {%x%x%x%x%x%x}(.-){%x%x%x%x%x%x} | Íîìåð: .+");

        if (nickname and id and organization) then
            local afk = text:match("AFK: (%d+) ñåêóíä");

            if (afk) then
                afk = tonumber(afk);
            end

            if (check.server_stats == "leaders") then
                server_stats.leaders.total = server_stats.leaders.total + 1;
                if (afk) then
                    server_stats.leaders.afk = server_stats.leaders.afk + 1;
                end

                for _, org in ipairs(core.orgs.list) do
                    if (org.stats == organization) then
                        organization = org.id;
                    end
                end

                table.insert(server_stats.leaders.list, {
                    nickname = nickname,
                    id = tonumber(id),
                    organization = organization,
                    afk = afk,
                });
            elseif (check.server_stats == "zams") then
                server_stats.zams.total = server_stats.zams.total + 1;
                if (afk) then
                    server_stats.zams.afk = server_stats.zams.afk + 1;
                end

                for _, org in ipairs(core.orgs.list) do
                    if (org.stats == organization) then
                        organization = org.id;
                    end
                end

                table.insert(server_stats.zams.list, {
                    nickname = nickname,
                    id = tonumber(id),
                    organization = organization,
                    afk = afk,
                });
            end
        end

        if (not settings.debug) then
            return false;
        end
    end

    if (text:find("^%- %- %- %- Ñîâïàäåíèå ñ: [0-9.]+%. %- %- %- %-")) then
        if (type(check.pgetip) == "table") then
            newTask(function()
                wait(350);

                if (#check.pgetip <= 1) then
                    sendMessage("/a Íå íàéäåíî äðóãèõ àêêàóíòîâ, èãðàþùèõ ñ ýòîãî IP â äàííûé ìîìåíò!");
                else
                    local answer = string.format("Íàéäåíî %s %s, èãðàþùèõ ñ ýòîãî IP:", #check.pgetip, plural(#check.pgetip, {
                        "àêêàóíò",
                        "àêêàóíòà",
                        "àêêàóíòîâ"
                    }));

                    sendMessage("/a " .. answer);

                    for i, v in ipairs(check.pgetip) do
                        wait(350);
                        sendMessage("/a " .. v);
                    end
                end

                check.pgetip = nil;
            end)

            if (not settings.debug) then
                return false;
            end
        end
    end

    if (text:find("^%- (%S+)$")) then
        local player = text:match("^%- (%S+)$");

        if (player and color == -89368321) then
            table.insert(check.pgetip, player);

            if (not settings.debug) then
                return false;
            end
        end
    end

    if (text:find("^%[A%] (%S+)%[(%d+)%]: (.*)")) then
        local acNick, acId, acText = text:match("^%[A%] (%S+)%[(%d+)%]: (.*)");

        if (acText) then
            acId = tonumber(acId);
            acNick = acNick:gsub("^%[.*%]", "", 1);

            if (igForms.b and acText:startsWith("/") and (not is_self(acId))) then
                local args = string.split(acText);

                args[1] = string.lower(args[1] or "");

                for _, form in ipairs(igForms.list) do
                    if (args[1] == ("/%s"):format(form.name) and form.send_type >= 2) then
                        local f_plId = form.param_target + 1;
                        local widget = igForms.widget;
                        widget.start_time = os.clock();
                        widget.accepted = nil;
                        widget.admin = {
                            nick = acNick,
                            id = acId
                        };
                        widget.player.id = tonumber(args[f_plId]) or getPlayerIdByNickname(args[f_plId]) or -1;
                        widget.form = table.concat(args, " ");
                        widget.runner = form.runner;
                        widget.match = ("/%s %s"):format(form.name, form.params);
                        igForms.last = widget.form;
                        igForms.show_error = false;
                        igForms.accepted_first = nil;

                        newTask(function()
                            widget.accepted = {
                                os.clock(),
                                true
                            };

                            if (form.name ~= "setmember" and form.name ~= "uval") then
                                sendMessage("/a [Forma] +");
                            else
                                igForms.accepted_first = getBotNick();
                            end

                            local time = os.clock();

                            while (not igForms.accepted_first) do
                                if (os.clock() - time > 3) then
                                    break;
                                end

                                wait(0);
                            end

                            if (igForms.accepted_first == getBotNick()) then
                                widget.runner(widget.form, widget.match);

                                local query = ("INSERT INTO `arizona`.form_ig_system SET `server_id` = %d, `form` = '%s', `sender` = '%s';"):format(server_id, u8(widget.form), acNick);
                                AsyncMysqlQuery(query);

                                wait(3000);
                                igForms.widget.form = nil;
                                igForms.widget.accepted = nil

                                if (not settings.debug) then
                                    return false;
                                end
                            end
                        end)
                    end
                end
            end

            if (acText == "[Forma] +") then
                if (igForms.accepted_first == nil) then
                    igForms.accepted_first = acNick;
                end

                if (igForms.widget.accepted == nil) then
                    igForms.widget.accepted = {
                        os.clock(),
                        false
                    };
                end

                if (not settings.debug) then
                    return false;
                end
            end
        end
    end

    if (text:find("^{%x%x%x%x%x%x}([A-z0-9_]+)%[(%d+)%]")) then
        local isRed = text:find("Íà÷àëüíèê") ~= nil;
        local nick, id = text:match("^{%x%x%x%x%x%x}([A-z0-9_]+)%[(%d+)%]");
        local alvl = isRed and "8" or text:match("%[(%d+) lvl%]");
        local recon = text:match("/re (%d+)");
        local afk = text:match("%[AFK: ([%d:]+)");
        local reputation = text:match("Ðåïóòàöèÿ: ([%-%d]+)");

        if (nick and alvl and reputation) then
            local idle = os.time();
            alvl = tonumber(alvl);
            id = tonumber(id);
            reputation = tonumber(reputation);
            recon = tonumber(recon);

            if (afk and afk:find(":")) then
                local params = afk:split(":");

                if (#params == 2) then
                    table.insert(params, 1, 0);
                end

                local h = (tonumber(params[1]) or 0) * 3600;
                local m = (tonumber(params[2]) or 0) * 60;
                local s = tonumber(params[3]) or 0;
                afk = h + m + s;
            else
                afk = tonumber(afk) or 0;
            end

            local found = false;
            local admin = -1;
            for i, v in ipairs(server_stats.admins.list) do
                if (v.nickname == nick) then
                    found = true;
                    admin = i;
                    if (server_stats.admins.idle[admin]) then
                        if (nick == server_stats.admins.idle[admin].nickname) then
                            idle = server_stats.admins.idle[admin].last;
                        else
                            server_stats.admins.idle[admin] = {
                                nickname = nick,
                                last = idle
                            };
                        end
                    else
                        table.insert(server_stats.admins.idle, admin, {
                            nickname = nick,
                            last = idle
                        });
                    end
                end
            end

            if (found) then
                server_stats.admins.list[admin].idle = os.time() - idle;
                server_stats.admins.list[admin].id = id;
                server_stats.admins.list[admin].lvl = alvl;
                server_stats.admins.list[admin].rep = reputation;
                server_stats.admins.list[admin].afk = afk;
                server_stats.admins.list[admin].re = recon;
                query = ("SELECT * FROM `arizona`.admins WHERE `nick` = '%s';"):format(nick);
				local data = mysqlQuery(query);

				if (not data[1]) then
					query = ("INSERT INTO `arizona`.admins SET `nick` = '%s', `level` = %d, `reputation` = '%s';"):format(nick, alvl, reputation);
					AsyncMysqlQuery(query);
				else
					query = ("UPDATE `arizona`.admins SET `level` = %d, `reputation` = '%s' WHERE `nick` = '%s';").format(alvl, reputation, nick);
					AsyncMysqlQuery(query);
				end
            else
                table.insert(server_stats.admins.list, {
                    nickname = nick,
                    id = id,
                    idle = os.time() - idle,
                    lvl = alvl,
                    rep = reputation,
                    afk = afk,
                    re = recon,
                    is_self = is_self(id)
                });
            end

            if (not settings.debug) then
                return false;
            end
        end
    end

    if (igForms.widget.accepted and igForms.widget.accepted[2] and (not igForms.show_error) and (igForms.accepted_first == getBotNick())) then
        for i, v in ipairs(igForms.errors) do
            if (text:find(v.error)) then
                igForms.show_error = true;
                sendMessage("/a @" .. igForms.widget.admin.nick .. ", " .. v.answer);
                break;
            end
        end
    end

    if (offForms.widget.form) then
        for i, v in ipairs(offForms.list) do
            if (v.name == offForms.widget.form_name) then
                local query;
                for j, z in ipairs(v.errors) do
                    if (text:match(z.error)) then
                        query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8(z.answer) .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        check.offForms = nil;
                        offForms.process = false;
                        offForms.widget = {};
                    end
                end

                for j, z in ipairs(v.success) do
                    if (text:match(z)) then
                        if (check.offForms and (not check.offForms.notLast)) then
                            query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                            mysqlQuery(query);

                            check.offForms = nil;
                            offForms.process = false;
                            offForms.widget = {};
                        elseif (not check.offForms) then
                            query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. offForms.widget.form_id .. " AND `server_id` = " .. server_id .. ';';
                            mysqlQuery(query);

                            check.offForms = nil;
                            offForms.process = false;
                            offForms.widget = {};
                        end
                    end
                end

                break;
            end
        end
    end

    if (compensations.widget.form) then
        for i, v in ipairs(compensations.list) do
            if (v.name == compensations.widget.form_name) then
                local query;
                for j, z in ipairs(v.errors) do
                    if (text:match(z.error)) then
                        query = "UPDATE `arizona`.compensations_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8(z.answer) .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `compensation_id` = " .. compensations.widget.compensation_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        compensations.process = false;
                        compensations.widget = {};
                    end
                end

                for j, z in ipairs(v.success) do
                    if (text:match(z)) then
                        query = "UPDATE `arizona`.compensations_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `compensation_id` = " .. compensations.widget.compensation_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        sendMessage("/notif " .. compensations.widget.player .. " Çàÿâêà íà êîìïåíñàöèþ ïî æàëîáå ¹" .. compensations.widget.complaintId .. " áûëà îäîáðåíà àäìèíèñòðàòîðîì " .. compensations.widget.administrator .. ".");

                        compensations.process = false;
                        compensations.widget = {};
                    end
                end

                break;
            end
        end
    end

    if (check.recovery_fraction) then
        if (text:find("%[A%] %S+%[ID: %d+%] óñòðîèë %S+ %[%d+%] â .* íà %d+ ðàíã%. Ïðè÷èíà: .*")) then
            local query = "UPDATE `arizona`.recovery_fraction_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. check.recovery_fraction.uid .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            sendMessage("/notif " .. check.recovery_fraction.player .. " Çàÿâêà íà âîññòàíîâëåíèå âî ôðàêöèè ïî æàëîáå ¹" .. check.recovery_fraction.complaintId .. " áûëà îäîáðåíà àäìèíèñòðàòîðîì " .. check.recovery_fraction.administrator .. ".");

            check.recovery_fraction = nil;
        end

        if (text:find("^%[Ïîäñêàçêà%] {ffffff}%/setmember %[id èãðîêà%] %[id îðãàíèçàöèè %(1%-32%)%] %[ðàíã %(1%-9%)%] %[ïðè÷èíà%]$")) then
            local query = "UPDATE `arizona`.recovery_fraction_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Äàííàÿ îðãàíèçàöèÿ îòêëþ÷åíà íà ñåðâåðå.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. check.recovery_fraction.uid .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            sendMessage("/notif " .. check.recovery_fraction.player .. " Çàÿâêà íà âîññòàíîâëåíèå âî ôðàêöèè ïî æàëîáå ¹" .. check.recovery_fraction.complaintId .. " áûëà îòêëîíåíà èç-çà îøèáêè.");

            check.recovery_fraction = nil;
        end
    end

    if (check.recovery_account) then
        if (text:find("A: %S+ ðàçáàíèë èãðîêà %S+, ïðè÷èíà: .*")) then
            local query = "UPDATE `arizona`.recovery_account_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. check.recovery_account.uid .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            sendMessage("/notif " .. check.recovery_account.player .. " Çàÿâêà íà âîññòàíîâëåíèå àêêàóíòà ïî æàëîáå ¹" .. check.recovery_account.complaintId .. " áûëà îäîáðåíà àäìèíèñòðàòîðîì " .. check.recovery_account.administrator .. ".");

            check.recovery_account = nil;
        end

        if (text:find("Èãðîê %S+ íå çàáàíåí")) then
            local query = "UPDATE `arizona`.recovery_account_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Èãðîê íå çàáàíåí.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. check.recovery_account.uid .. " AND `server_id` = " .. server_id .. ';';
            mysqlQuery(query);

            sendMessage("/notif " .. check.recovery_account.player .. " Çàÿâêà íà âîññòàíîâëåíèå àêêàóíòà ïî æàëîáå ¹" .. check.recovery_account.complaintId .. " áûëà îòêëîíåíà èç-çà îøèáêè.");

            check.recovery_account = nil;
        end
    end

    for i, v in ipairs(guard) do
        if (text:find(v.regular)) then
            local array = table.pack(text:match(v.regular));

            if ((v.position == -1) or ((array[v.position + 1] == getBotId() or array[v.position + 1] == getBotNick()) and (array[v.target + 1] ~= getBotId() and array[v.target + 1] ~= getBotNick()))) then
                if (v.action == "exit") then
                    settings.last_bot_disconnect = os.time();
                    local query = ("UPDATE `arizona`.servers_raksamp SET `start` = %d, `started` = %d, `last_bot_disconnect` = %d, `last_bot_stop` = %d WHERE `server_id` = %d;"):format(0, 0, settings.last_bot_disconnect,  os.time(), server_id);
                    AsyncMysqlQuery(query);

                    exit();
                elseif (v.action == "aclear") then
                    sendMessage("/aclear " .. getBotId());
                elseif (v.action == "unfreeze") then
                    sendMessage("/unfreeze " .. getBotId());
                elseif (v.action == "spawn") then
                    set_bot_position();
                elseif (v.action == "spplayer") then
                    sendMessage("/spplayer " .. array[v.target + 1]);
                elseif (v.action == "sethp") then
                    sendMessage("/sethp " .. getBotId() .. " 100");
                end

                return false;
            end
        end
    end

    for i, v in ipairs(messagesRemover) do
        if (text:find(v.regular)) then
            if (v.position_first == -1) then
                return false;
            else
                local array = table.pack(text:match(v.regular));
                local player_first = array[v.position_first + 1];

                if (v.position_second == -1) then
                    if (getBotNick() == player_first or getBotId() == tonumber(player_first)) then
                        return false;
                    end
                else
                    local player_second = array[v.position_second + 1];

                    if ((getBotNick() == player_first or getBotId() == tonumber(player_first)) and (getBotNick() == player_second or getBotId() == tonumber(player_second))) then
                        return false;
                    end
                end
            end
        end
    end
end

function sampev.onConnectionRequestAccepted(ip, port, playerId, challenge)
    if (CHECK_TASK and not CHECK_TASK:isAlive()) then
        CHECK_TASK:kill();
    end

    CHECK_TASK = newTask(function()
        repeat
            wait(0);
        until isBotSpawned();

        wait(1500);
        sendMessage("/apanel");
    end)
end

function sampev.onConnectionClosed()
    settings.bot_is_spawned = false;
    license.sellLicenses = false;
    check = {
        afk = {}
    };
    settings.last_bot_disconnect = os.time();

    local query = ("UPDATE `arizona`.servers_raksamp SET `last_bot_disconnect` = %d WHERE `server_id` = %d;"):format(settings.last_bot_disconnect, server_id);
    AsyncMysqlQuery(query);
end

function sampev.onConnectionLost()
    settings.bot_is_spawned = false;
    license.sellLicenses = false;
    check = {
        afk = {}
    };
    settings.last_bot_disconnect = os.time();

    local query = ("UPDATE `arizona`.servers_raksamp SET `last_bot_disconnect` = %d WHERE `server_id` = %d;"):format(settings.last_bot_disconnect, server_id);
    AsyncMysqlQuery(query);
end

function sampev.onSendTakeDamage(data)
    sendMessage("/sethp " .. getBotId() .. " 100");
end

function sampev.onSetPlayerSkin(playerId, skinId)
    if ((is_self(playerId)) and (settings.bot_is_spawned) and (settings.skin_system) and (skinId ~= settings.skin_id)) then
        if ((not check.morg) and (not check.props) and (not check.mpdonate) and (not check.spawncars) and (not check.pledge) and (not check.offForms)) then
            if (settings.license_system) then
                if (license.sellLicenses) then
                    sendMessage("/setskin " .. getBotId() .. " " .. settings.skin_id .. " 0");
                end
            else
                sendMessage("/setskin " .. getBotId() .. " " .. settings.skin_id .. " 0");
            end
        end
    end
end

function sampev.onSetInterior(interior)
    if (interior == 218) then
        sendMessage("/sethp " .. getBotId() .. " 100");
        set_bot_position();
    end
end

function sampev.onSetPlayerPos(position)
    if (check.offForms) then
        if (check.offForms.form == "setgangzone") then
            sendMessage("/setgangzone " .. check.offForms.organization);

            if (not check.offForms.notLast) then
                set_bot_position();
            end

            check.offForms.process = false;
        end
    end
end

function sampev.onPlayerChatBubble(playerId, color, distance, duration, message)
    if (color == -1 and distance == 7 and duration == 3000) then
        local found = false;
        for i, v in ipairs(check.afk) do
            if (v.id == playerId) then
                v.lastUpdate = os.time();
                found = true;
                break;
            end
        end

        if (not found) then
            table.insert(check.afk, {
                id = playerId,
                lastUpdate = os.time()
            });
        end
    end
end

function sampev.onCreateGangZone(zoneId, squareStart, squareEnd, color)
    color = int32_to_uint32(color);
    for id, zone in ipairs(core.zones.ghetto) do
        if ((zone.x1 == math.floor(squareStart.x)) and (zone.y1 == math.floor(squareStart.y)) and (zone.x2 == math.floor(squareEnd.x)) and (zone.y2 == math.floor(squareEnd.y))) then
            zone.organization = 0;

            for _, organization in ipairs(core.orgs.list) do
                if (organization.color_zone == color) then
                    zone.color = color;
                    zone.organization = organization.id;
                    break;
                end
            end

            local query = ("UPDATE `arizona`.gangzones_ghetto_system SET `organization` = %d, `color` = '%s' WHERE `server_id` = %d AND `zone_id` = %d;"):format(zone.organization, to_hex(ColorConvertU32ToFloat4(color)), server_id, id);
            mysqlQuery(query);
        end
    end

    for id, zone in ipairs(core.zones.family) do
        if ((zone.x1 == math.floor(squareStart.x)) and (zone.y1 == math.floor(squareStart.y)) and (zone.x2 == math.floor(squareEnd.x)) and (zone.y2 == math.floor(squareEnd.y))) then
            zone.color = color;
            break;
        end
    end
end

function sampev.onShowTextDraw(textdrawId, textdraw)
    if (textdrawId == 1332) then
        if (textdraw.text:find("ticks:%s*(%d+)%s*/%s*min:%s*(%d+)%s*/%s*avg:%s*(%d+)%s*/%s*max:%s*(%d+)")) then
            local ticks, min, avg, max = textdraw.text:match("ticks:%s*(%d+)%s*/%s*min:%s*(%d+)%s*/%s*avg:%s*(%d+)%s*/%s*max:%s*(%d+)");

            server_stats.ticks = {
                current = tonumber(ticks),
                average = tonumber(avg),
                maximum = tonumber(max),
                minimum = tonumber(min)
            };
        end
    end
end

function onLoad()
    newTask(function ()
        repeat wait(0) until settings.active;

        newTask(loadMorg);
        newTask(handle_errors);
        newTask(system_tasks);
        newTask(accept);
        newTask(server_stats_check);
        newTask(businesses_mafia_check);
        newTask(send_admin_information);
        newTask(bot_bandit_checker);
        newTask(auto_car_spawn);
        newTask(auto_ao_messages);
        newTask(auto_conference_ao);
        newTask(auto_send_mpdonate);
        newTask(afk_nearby_check);
        newTask(license_nearby_check);
        newTask(props_check);
        newTask(pledge_check);
        newTask(fractions_check);
        newTask(offline_forms);
        newTask(compensations_forms);
        newTask(recovery_fraction_forms);
        newTask(recovery_account_forms);

        while (true) do
            wait(0);

            if (#sendMessage.queue > 0 and os.clock() - sendMessage.timer >= 1) then
                sendInput(sendMessage.queue[1]);
                table.remove(sendMessage.queue, 1);
                sendMessage.timer = os.clock();
            end
        end
    end)
end

function onRequestConnect()
    asyncHttpRequest("GET", ("http://%s:80/"):format(settings.server_ip), nil, function(response)
        if (response.status_code == 200) then
            print("[ OpenMP:API ] API óñïåøíî îáðàáîòàíî.");
        else
            print("[ OpenMP:API | Êðèòè÷åñêàÿ îøèáêà ] Íå áûë ïîëó÷åí îòâåò îò API.");
        end
    end, function(err)
        print("[ OpenMP:API | Êðèòè÷åñêàÿ îøèáêà ] Íå áûë ïîëó÷åí îòâåò îò API.");
    end)
end

function handle_errors()
    local functions = {
        server_stats = {
            duration = 0,
            start = 0
        },
        businesses_mafia = {
            duration = 0,
            start = 0
        },
        bot_bandit = {
            duration = 0,
            start = 0
        },
        spawncars = {
            duration = 0,
            start = 0
        },
        mpdonate = {
            duration = 0,
            start = 0
        },
        props = {
            duration = 0,
            start = 0
        },
        morg = {
            duration = 0,
            start = 0
        },
        pledge = {
            duration = 0,
            start = 0
        },
        offForms = {
            duration = 0,
            start = 0
        }
    };

    local function reset_bot()
        settings.bot_is_spawned = false;
        license.sellLicenses = false;
        check = {
            afk = {}
        };
        settings.last_bot_disconnect = os.time();
        functions = {
            server_stats = {
                duration = 0,
                start = 0
            },
            businesses_mafia = {
                duration = 0,
                start = 0
            },
            bot_bandit = {
                duration = 0,
                start = 0
            },
            spawncars = {
                duration = 0,
                start = 0
            },
            mpdonate = {
                duration = 0,
                start = 0
            },
            props = {
                duration = 0,
                start = 0
            },
            morg = {
                duration = 0,
                start = 0
            },
            pledge = {
                duration = 0,
                start = 0
            },
            offForms = {
                duration = 0,
                start = 0
            }
        };

        local query = ("UPDATE `arizona`.servers_raksamp SET `last_bot_disconnect` = %d WHERE `server_id` = %d;"):format(settings.last_bot_disconnect, server_id);
        AsyncMysqlQuery(query);

        reconnect();
    end

    local function handle()
        if (check.server_stats and check.server_stats == 'svrnt') then
            if (functions.server_stats.start == 0) then
                functions.server_stats = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.server_stats.duration = os.time() - functions.server_stats.start;
            end
        else
            functions.server_stats = {
                duration = 0,
                start = 0
            };
        end

        if (check.bot_bandit) then
            if (functions.bot_bandit.start == 0) then
                functions.bot_bandit = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.bot_bandit.duration = os.time() - functions.bot_bandit.start;
            end
        else
            functions.bot_bandit = {
                duration = 0,
                start = 0
            };
        end

        if (check.spawncars) then
            if (functions.spawncars.start == 0) then
                functions.spawncars = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.spawncars.duration = os.time() - functions.spawncars.start;
            end
        else
            functions.spawncars = {
                duration = 0,
                start = 0
            };
        end

        if (check.mpdonate) then
            if (functions.mpdonate.start == 0) then
                functions.mpdonate = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.mpdonate.duration = os.time() - functions.mpdonate.start;
            end
        else
            functions.mpdonate = {
                duration = 0,
                start = 0
            };
        end

        if (check.props) then
            if (functions.props.start == 0) then
                functions.props = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.props.duration = os.time() - functions.props.start;
            end
        else
            functions.props = {
                duration = 0,
                start = 0
            };
        end

        if (check.morg) then
            if (functions.morg.start == 0) then
                functions.morg = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.morg.duration = os.time() - functions.morg.start;
            end
        else
            functions.morg = {
                duration = 0,
                start = 0
            };
        end

        if (check.pledge) then
            if (functions.pledge.start == 0) then
                functions.pledge = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.pledge.duration = os.time() - functions.pledge.start;
            end
        else
            functions.pledge = {
                duration = 0,
                start = 0
            };
        end

        if (check.offForms) then
            if (functions.offForms.start == 0) then
                functions.offForms = {
                    start = os.time(),
                    duration = 0
                };
            else
                functions.offForms.duration = os.time() - functions.offForms.start;
            end
        else
            functions.offForms = {
                duration = 0,
                start = 0
            };
        end

        for i, v in pairs(functions) do
            if (v.duration >= 10 * 60) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'check." .. i .. "' îøèáî÷íî çàâèñëà íà " .. v.duration .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();
                break;
            end
        end
    end

    local function handle_idle()
        if (settings.auto_respawn_cars) then
            if (os.time() - settings.last_respawn_cars >= settings.auto_respawn_cars_time * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'auto_respawn_cars' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - settings.last_respawn_cars .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end

        if (settings.send_mpdonate_system) then
            if (os.time() - settings.last_send_mpdonate >= settings.send_mpdonate_time * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'send_mpdonate' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - settings.last_send_mpdonate .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end

        if (props.b) then
            if (os.time() - props.last >= props.delay * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'check_props' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - props.last .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end

        if (bot_bandit.b) then
            if (os.time() - bot_bandit.last >= bot_bandit.delay * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'bot_bandit_checker' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - bot_bandit.last .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end

        if (morg.b) then
            if (os.time() - morg.last >= morg.delay * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'check_fractions' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - morg.last .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end

        if (pledge.b) then
            if (os.time() - pledge.last >= pledge.delay * 60 * 2) then
                print("[ Èíôîðìàöèÿ | handleErrors ] Ôóíêöèÿ 'check_pledge' îøèáî÷íî íå çàïóñêàëàñü " .. os.time() - pledge.last .. " ñåêóíä. Ñèñòåìà ïåðåçàïóùåíà.");
                reset_bot();

                return;
            end
        end
    end

    while (true) do
        wait(0);
        handle();

        if (settings.bot_is_spawned) then
            if (settings.last_bot_connect > settings.last_bot_disconnect and (os.time() - settings.last_bot_connect >= 1.5 * 60 * 60)) then
                handle_idle();
            end
        end
    end
end

function system_tasks()
    local tasks = {};
    local function check_and_send()
        for i, v in ipairs(tasks) do
            local year, month, day, hour, min, sec = v.time:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)");

            local date_table = {
                year = tonumber(year),
                month = tonumber(month),
                day = tonumber(day),
                hour = tonumber(hour),
                min = tonumber(min),
                sec = tonumber(sec)
            };

            local target_time = os.time(date_table);
            local current_time = os.time();

            if ((current_time - target_time) < (7 * 24 * 60 * 60)) then
                if (v.task == "stop") then
                    settings.last_bot_disconnect = current_time;
                    local query = "UPDATE `arizona`.tasks_system SET `half_passed` = 1, `time_half_passed` = DEFAULT WHERE `passed` = 0 AND `task_id` = " .. v.task_id .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    query = ("UPDATE `arizona`.servers_raksamp SET `start` = %d, `started` = %d, `last_bot_disconnect` = %d, `last_bot_stop` = %d WHERE `server_id` = %d;"):format(0, 0, settings.last_bot_disconnect, current_time, server_id);
                    mysqlQuery(query);

                    exit();
                elseif (v.task == "restart") then
                    if (v.half_passed) then
                        local query = "UPDATE `arizona`.tasks_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Áîò óæå çàïóùåí.") .. "' WHERE `passed` = 0 AND `task_id` = " .. v.task_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);
                    else
                        settings.last_bot_disconnect = current_time;
                        local query = "UPDATE `arizona`.tasks_system SET `half_passed` = 1, `time_half_passed` = DEFAULT WHERE `passed` = 0 AND `task_id` = " .. v.task_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        query = ("UPDATE `arizona`.servers_raksamp SET `started` = %d, `last_bot_disconnect` = %d, `last_bot_restart` = %d WHERE `server_id` = %d;"):format(0, settings.last_bot_disconnect, current_time, server_id);
                        mysqlQuery(query);

                        exit();
                    end
                end
            end
        end
    end

    while (true) do
        wait(1 * 1000);
        tasks = {};

        local query = "SELECT * FROM `arizona`.tasks_system WHERE `passed` = 0 AND `server_id` = " .. server_id .. ';';
        local data = mysqlQuery(query);

        if (data) then
            for i, v in ipairs(data) do
                table.insert(tasks, {
                    task_id = v.task_id,
                    task = v.task,
                    time = v.time_created
                });
            end
        end

        check_and_send();
    end
end

function accept()
    local process = false;
    local accepts = {};

    local function check_and_send()
        process = true;
        for i, v in ipairs(accepts) do
            local current_time = os.time();
            check.accepts = {
                admin = v.admin,
                accept_id = v.accept_id
            };

            if (getPlayerIdByNickname(v.admin)) then
                sendMessage("/getip " .. getPlayerIdByNickname(v.admin));
            else
                local query = ("UPDATE `arizona`.accept_system SET `denied` = %d, `time_denied` = DEFAULT WHERE `accept_id` = %d AND `server_id` = %d;"):format(1, v.accept_id, server_id);
                AsyncMysqlQuery(query);
            end

            while (check.accepts) do
                wait(0);

                if (os.time() - current_time > 60) then
                    local query = ("UPDATE `arizona`.accept_system SET `getip` = %d WHERE `accept_id` = %d AND `server_id` = %d;"):format(1, check.accepts.accept_id, server_id);
                    AsyncMysqlQuery(query);
                    check.accepts = nil;
                end
            end
        end
        process = false;
    end

    while (true) do
        wait(1 * 1000);
        if (settings.bot_is_spawned) then
            if (not process) then
                accepts = {};

                local query = "SELECT * FROM `arizona`.accept_system WHERE `time_created` >= NOW() - INTERVAL 1 HOUR AND `accepted` = 0  AND `denied` = 0 AND `getip` = 0 AND `sent` = 0 AND `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(accepts, {
                            admin = v.admin,
                            accept_id = v.accept_id
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function server_stats_check()
    local first = true;
    local query = "SELECT * FROM `arizona`.server_stats_system WHERE `server_id` = " .. server_id .. ';';
    local data = mysqlQuery(query);
    server_stats.special = data[1].special_list;

    local function check_and_send()
        local time = os.time();
        server_stats.admins.special = {
            total = 0
        };
        server_stats.admins.chief = {
            total = 0,
            afk = 0
        };
        server_stats.admins.admins = {
            total = 0,
            afk = 0
        };
        server_stats.admins.helpers = {
            total = 0,
            afk = 0
        };
        server_stats.leaders = {
            total = 0,
            afk = 0,
            list = {}
        };
        server_stats.zams = {
            total = 0,
            afk = 0,
            list = {}
        };

        for i, v in ipairs(server_stats.special) do
            local playerId = getPlayerIdByNickname(v);
            local playerName = v;

            if (playerId ~= -1) then
                local found = false;
                server_stats.admins.special.total = server_stats.admins.special.total + 1;

                for x, y in ipairs(server_stats.admins.list) do
                    if (y.nickname == playerName) then
                        found = true;
                    end
                end

                if (not found) then
                    table.insert(server_stats.admins.list, {
                        nickname = playerName,
                        id = playerId,
                        lvl = 8,
                        rep = 0,
                        afk = 0,
                        re = nil,
                        is_self = false
                    });
                end
            end
        end

        if (first) then
            DEBUG("[ DEBUG | server_stats ] morg: " .. tostring(check.morg) .. " | props: " .. tostring(check.props) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | pledge: " .. tostring(check.pledge) .. " | spawncars: " .. tostring(check.spawncars) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
            if (not (check.morg or check.props or check.mpdonate or check.pledge or check.spawncars or check.bot_bandit or check.businesses_mafia or check.compensations or check.recovery_account or check.recovery_fraction)) then
                check.server_stats = "svrnt";
                set_bot_position();
                sendMessage("/svrnt");
                wait(5000);
                first = false;
            end
        end

        check.server_stats = "leaders";
        sendMessage("/leaders_tools");
        wait(5000);
        check.server_stats = "zams";
        sendMessage("/zams_tools");
        wait(1500);
        check.server_stats = nil;
        sendMessage("/admins");
        sendMessage("/id " .. getBotId());
        sendMessage("/famgzinfo_tools");
        wait(1500);

        for i, v in ipairs(server_stats.admins.list) do
            if (getPlayerIdByNickname(v.nickname) == -1) then
                table.remove(server_stats.admins.list, i);
            end

            if (not v.is_self) then
                if (v.lvl == 1 or v.lvl == 2) then
                    server_stats.admins.helpers.total = server_stats.admins.helpers.total + 1;
                    if (v.afk > 0) then
                        server_stats.admins.helpers.afk = server_stats.admins.helpers.afk + 1;
                    end
                elseif (v.lvl == 3 or v.lvl == 4) then
                    server_stats.admins.admins.total = server_stats.admins.admins.total + 1;
                    if (v.afk > 0) then
                        server_stats.admins.admins.afk = server_stats.admins.admins.afk + 1;
                    end
                elseif (v.lvl == 5 or v.lvl == 6 or v.lvl == 7) then
                    server_stats.admins.chief.total = server_stats.admins.chief.total + 1;
                    if (v.afk > 0) then
                        server_stats.admins.chief.afk = server_stats.admins.chief.afk + 1;
                    end
                end
            end
        end

        if (server_stats.build) then
            query = ("UPDATE `arizona`.server_stats_system SET `last` = %d, `ticks_current` = %d, `ticks_average` = %d, `ticks_maximum` = %d, `ticks_minimum` = %d, `packetloss` = %f, `build` = '%s', `players` = %d, `report` = %d, `special_total` = %d, `chief_total` = %d, `chief_afk` = %d, `admins_total` = %d, `admins_afk` = %d, `helpers_total` = %d, `helpers_afk` = %d, `leaders_total` = %d, `leaders_afk` = %d, `zams_total` = %d, `zams_afk` = %d, `admins_list` = '%s', `leaders_list` = '%s', `zams_list` = '%s' WHERE `server_id` = %d;"):format(time, server_stats.ticks.current, server_stats.ticks.average, server_stats.ticks.maximum, server_stats.ticks.minimum, server_stats.packetloss, server_stats.build, getPlayerCount(), server_stats.admins.report, server_stats.admins.special.total, server_stats.admins.chief.total, server_stats.admins.chief.afk, server_stats.admins.admins.total, server_stats.admins.admins.afk, server_stats.admins.helpers.total, server_stats.admins.helpers.afk, server_stats.leaders.total, server_stats.leaders.afk, server_stats.zams.total, server_stats.zams.afk, json.encode(server_stats.admins.list), json.encode(server_stats.leaders.list), json.encode(server_stats.zams.list), server_id);
        else
            query = ("UPDATE `arizona`.server_stats_system SET `last` = %d, `ticks_current` = %d, `ticks_average` = %d, `ticks_maximum` = %d, `ticks_minimum` = %d, `packetloss` = %f, `players` = %d, `report` = %d, `special_total` = %d, `chief_total` = %d, `chief_afk` = %d, `admins_total` = %d, `admins_afk` = %d, `helpers_total` = %d, `helpers_afk` = %d, `leaders_total` = %d, `leaders_afk` = %d, `zams_total` = %d, `zams_afk` = %d, `admins_list` = '%s', `leaders_list` = '%s', `zams_list` = '%s' WHERE `server_id` = %d;"):format(time, server_stats.ticks.current, server_stats.ticks.average, server_stats.ticks.maximum, server_stats.ticks.minimum, server_stats.packetloss, getPlayerCount(), server_stats.admins.report, server_stats.admins.special.total, server_stats.admins.chief.total, server_stats.admins.chief.afk, server_stats.admins.admins.total, server_stats.admins.admins.afk, server_stats.admins.helpers.total, server_stats.admins.helpers.afk, server_stats.leaders.total, server_stats.leaders.afk, server_stats.zams.total, server_stats.zams.afk, json.encode(server_stats.admins.list), json.encode(server_stats.leaders.list), json.encode(server_stats.zams.list), server_id);
        end

        AsyncMysqlQuery(query);
    end

    while (server_stats.b) do
        wait(1 * 1000 * 60);
        if (settings.bot_is_spawned) then
            check_and_send();
        else
            first = true;
        end
    end
end

function businesses_mafia_check()
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | businesses_mafia ] morg: " .. tostring(check.morg) .. " | props: " .. tostring(check.props) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | pledge: " .. tostring(check.pledge) .. " | spawncars: " .. tostring(check.spawncars) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.morg) then return end;
        if (check.spawncars) then return end;
        if (check.bot_bandit) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local time = os.time();

        if (time - businesses_mafia.last > (businesses_mafia.delay * 60)) then
            process = true;
            check.businesses_mafia = true;
            businesses_mafia.last = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_businesses_mafia` = %d WHERE `server_id` = %d;"):format(businesses_mafia.last, server_id);
            AsyncMysqlQuery(query);

            license.sellLicenses = false;

            set_bot_position();

            for _, fraction_id in ipairs(businesses_mafia.fractions) do
                check.businesses_mafia = fraction_id;
                sendMessage("/ambiz " .. fraction_id);

                while (check.businesses_mafia == fraction_id) do
                    wait(100);
                end
            end

            table.sort(businesses_mafia.pool, function(a, b)
                return a.id < b.id;
            end)

            for _, business in ipairs(core.zones.mafia) do
                local found = true;

                for _, businessPool in ipairs(businesses_mafia.pool) do
                    if (business.id ~= businessPool.id) then
                        found = false;
                        break;
                    end
                end

                if (not found) then
                    query = ("UPDATE `arizona`.businesses_mafia_system SET `organization` = %d, `money` = %d WHERE `server_id` = %d AND `business_id` = %d;"):format(0, 0, server_id, business.id);
                    mysqlQuery(query);
                end
            end

            for _, business in ipairs(businesses_mafia.pool) do
                query = ("UPDATE `arizona`.businesses_mafia_system SET `organization` = %d, `money` = %d WHERE `server_id` = %d AND `business_id` = %d;"):format(business.organization, business.money, server_id, business.id);
                mysqlQuery(query);
            end

            check.businesses_mafia = false;
            process = false;
        end
    end

    while (businesses_mafia.b) do
        wait(1000);
        if (settings.bot_is_spawned) then
            check_and_send();
        else
            process = false;
        end
    end
end

function send_admin_information()
    if (not settings.send_information_to_admins_system) then return end;

    local function get_forms_list()
        local t = {};

        for i, v in ipairs(igForms.list) do
            if (v.state) then
                table.insert(t, "/" .. v.name);
            end
        end

        return t;
    end

    local function splitCommands(commands, maxLength)
        local lines = {};
        local currentLine = "Àâòîìàòè÷åñêè ïðèíèìàåòñÿ: ";

        for _, command in ipairs(commands) do
            if #currentLine + #command + 2 > maxLength then
                table.insert(lines, currentLine);
                currentLine = command;
            else
                if currentLine ~= "Àâòîìàòè÷åñêè ïðèíèìàåòñÿ: " then
                    currentLine = currentLine .. ", " .. command;
                else
                    currentLine = currentLine .. command;
                end
            end
        end

        table.insert(lines, currentLine);
        return lines;
    end

    local function check_and_send()
        local time = os.time();
        local last_message_seconds_ago = time - settings.last_send_information_to_admins;

        if (last_message_seconds_ago > (settings.send_information_to_admins_time * 60)) then
            settings.last_send_information_to_admins = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_send_information_to_admins` = %d WHERE `server_id` = %d;"):format(settings.last_send_information_to_admins, server_id);
            AsyncMysqlQuery(query);

            sendMessage("/a ---------------------------Èíôîðìàöèÿ äëÿ àäìèíèñòðàöèè---------------------------");

            if (igForms.b) then
                local t = get_forms_list();
                local commandLines = splitCommands(t, 90);
                for _, line in ipairs(commandLines) do
                    sendMessage("/a " .. line);
                end
            end

            sendMessage("/a Ïåðåä ïðèíÿòèåì ôîðì îò äðóãèõ àäìèíèñòðàòîðîâ,");
            sendMessage("/a îáÿçàòåëüíî ïðîâåðüòå íàëè÷èå àäìèí òåãà è ïðî÷èòàéòå ïðè÷èíó âûäà÷è.");
            sendMessage("/a ---------------------------Èíôîðìàöèÿ äëÿ àäìèíèñòðàöèè---------------------------");
        end
    end

    while (settings.send_information_to_admins_system) do
        wait(1 * 1000 * 60);
        if (settings.bot_is_spawned) then
            check_and_send();
        end
    end
end

function bot_bandit_checker()
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | bot_bandit ] morg: " .. tostring(check.morg) .. " | props: " .. tostring(check.props) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | pledge: " .. tostring(check.pledge) .. " | spawncars: " .. tostring(check.spawncars) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.morg) then return end;
        if (check.spawncars) then return end;
        if (check.businesses_mafia) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        if (os.time() - bot_bandit.last >= bot_bandit.delay * 60) then
            process = true;
            check.bot_bandit = true;
            bot_bandit.last = os.time();

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_bot_bandit_checker` = %d WHERE `server_id` = %d;"):format(bot_bandit.last, server_id);
            AsyncMysqlQuery(query);

            license.sellLicenses = false;

            set_bot_position();

            for _, position in ipairs(core.bot_bandit.positions) do
                sendMessage("/aplpos " .. position.x .. " " .. position.y .. " " .. position.z - 3 .. " 0 0");
                wait(5000);

                for id, player in pairs(getAllPlayers()) do
                    if (player.exist) then
                        local isInRange = false;

                        for _, pos in ipairs(core.bot_bandit.positions) do
                            if (getDistanceBetweenCoords3d(player.position.x, player.position.y, player.position.z, pos.x, pos.y, pos.z) <= pos.range) then
                                isInRange = true;
                                break;
                            end
                        end

                        if (bot_bandit.players[id]) then
                            if (bot_bandit.players[id].nickname == player.nick) then
                                if (isInRange) then
                                    if (getDistanceBetweenCoords3d(player.position.x, player.position.y, player.position.z, bot_bandit.players[id].position.x, bot_bandit.players[id].position.y, bot_bandit.players[id].position.z) <= 5) then
                                        bot_bandit.players[id].repeats = bot_bandit.players[id].repeats + 1;
                                    else
                                        bot_bandit.players[id].repeats = 0;
                                    end
                                end
                            else
                                bot_bandit.players[id] = {
                                    nickname = player.nick,
                                    position = {
                                        x = player.position.x,
                                        y = player.position.y,
                                        z = player.position.z,
                                    },
                                    repeats = 0
                                };
                            end

                            if (bot_bandit.players[id].repeats >= 2) then
                                bot_bandit.players[id].repeats = 0;
                                sendMessage("/setvw " .. id .. " 1");
                                sendMessage("/pm " .. id .. " 1 Âû áûëè àâòîìàòè÷åñêè òåëåïîðòèðîâàíû â âèðòóàëüíûé ìèð èç-çà ïîäîçðåíèé â ïðîêà÷èâàíèè ïðîìîêîäà.");
                            end
                        else
                            if ((player.score > 0) and (player.score <= 5)) then
                                table.insert(bot_bandit.players, id, {
                                    nickname = player.nick,
                                    position = {
                                        x = player.position.x,
                                        y = player.position.y,
                                        z = player.position.z,
                                    },
                                    repeats = 0
                                });
                            end
                        end
                    end
                end
            end

            bot_bandit.last = os.time();
            check.bot_bandit = false;
            process = false;
        end
    end

    while (bot_bandit.b) do
        wait(1000);

        if (settings.bot_is_spawned) then
            check_and_send();
        else
            process = false;
        end
    end
end

function auto_car_spawn()
    if (not settings.auto_respawn_cars) then return end;

    local function check_and_spawn()
        DEBUG("[ DEBUG | auto_car_spawn ] morg: " .. tostring(check.morg) .. " | props: " .. tostring(check.props) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | pledge: " .. tostring(check.pledge) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.morg) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local time = os.time();
        local last_cars_spawn_second_ago = time - settings.last_respawn_cars;

        if (last_cars_spawn_second_ago > (settings.auto_respawn_cars_time * 60)) then
            check.spawncars = "auto";
            settings.last_respawn_cars = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_respawn_cars` = %d WHERE `server_id` = %d;"):format(settings.last_respawn_cars, server_id);
            AsyncMysqlQuery(query);

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/ao [Ñïàâí òðàíñïîðòà] Óâàæàåìûå èãðîêè, ÷åðåç 60 ñåêóíä áóäåò ñïàâí âñåãî òðàíñïîðòà!");
            sendMessage("/ao [Ñïàâí òðàíñïîðòà] Çàéìèòå ñâîé òðàíñïîðò, â ïðîòèâíîì ñëó÷àå îí ïðîïàäåò!");

            wait(60 * 1000);

            sendMessage("/vehicleapanel");
        end
    end

    while (settings.auto_respawn_cars) do
        wait(1 * 1000 * 60);
        if (settings.bot_is_spawned) then
            check_and_spawn();
        else
            process = false;
        end
    end
end

function auto_ao_messages()
    if (not settings.send_ao_system) then return end;

    local process = false;

    local function check_and_send()
        local edited = false;
        local time = os.time();
        local day = tonumber(os.date("%w", os.time() + server_time));
        local hour = tonumber(os.date("%H", os.time() + server_time));
        local minute = tonumber(os.date("%M", os.time() + server_time));

        process = true;
        for _, pool in ipairs(ao_messages) do
            if (pool.type == 0) then
                for _, times in ipairs(pool.time) do
                    if ((day == times.day) and (hour == times.hour) and (minute == times.minute) and (time - times.last > 60 * 1000)) then
                        edited = true;
                        times.last = time;

                        for _, message in ipairs(pool.text) do
                            sendMessage("/ao " .. message);
                        end
                    end
                end
            elseif (pool.type == 1) then
                if (time - pool.time.last > (pool.time.delay * 60)) then
                    edited = true;
                    pool.time.last = time;

                    for _, message in ipairs(pool.text) do
                        sendMessage("/ao " .. message);
                    end
                end
            end

            if (edited) then
                local query = ("UPDATE `arizona`.ao_system SET `time` = '%s' WHERE `server_id` = %d AND `ao_id` = %d;"):format(json.encode(pool.time), server_id, pool.id);
                AsyncMysqlQuery(query);
            end
        end
        process = false;
    end

    while (settings.send_ao_system) do
        wait(1000);
        if (settings.bot_is_spawned) then
            if (not process) then
                ao_messages = {};
                local query = "SELECT * FROM `arizona`.ao_system WHERE `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(ao_messages, {
                            id = v.ao_id,
                            type = v.type,
                            time = v.time,
                            text = v.text
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function auto_conference_ao()
    if (not settings.send_conference_system) then return end;

    local function check_and_send()
        local time = os.time();
        local day = tonumber(os.date("%w", os.time() + server_time));
        local hour = tonumber(os.date("%H", os.time() + server_time));
        local minute = tonumber(os.date("%M", os.time() + server_time));

        if (time - settings.last_send_conference_first >= 604800) then
            if ((day == 2) and (hour == settings.send_conference_first_hour) and (minute == settings.send_conference_first_minute)) then
                settings.last_send_conference_first = settings.last_send_conference_first + 604800;

                local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_conference_first` = %d WHERE `server_id` = %d;"):format(settings.last_send_conference_first, server_id);
                AsyncMysqlQuery(q);

                sendMessage("/ao [Êîíôåðåíöèÿ] Ïî ñðåäàì â 18 ÷àñîâ â Discord Àrizona Gàmes ïðîõîäèò òåò-à-òåò êîíôåðåíöèÿ.");
                sendMessage("/ao [Êîíôåðåíöèÿ] Âû ñìîæåòå ðåøèòü âàø âîïðîñ íàïðÿìóþ ñ Ãëàâíîé àäìèíèñòðàöèåé èëè Êðàñíîé àäìèíèñòðàöèåé!");
            end
        end

        if (time - settings.last_send_conference_second >= 604800) then
            if ((day == 2) and (hour == settings.send_conference_second_hour) and (minute == settings.send_conference_second_minute)) then
                settings.last_send_conference_second = settings.last_send_conference_second + 604800;

                local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_conference_second` = %d WHERE `server_id` = %d;"):format(settings.last_send_conference_second, server_id);
                AsyncMysqlQuery(q);

                sendMessage("/ao [Êîíôåðåíöèÿ] Ïî ñðåäàì â 18 ÷àñîâ â Discord Àrizona Gàmes ïðîõîäèò òåò-à-òåò êîíôåðåíöèÿ.");
                sendMessage("/ao [Êîíôåðåíöèÿ] Âû ñìîæåòå ðåøèòü âàø âîïðîñ íàïðÿìóþ ñ Ãëàâíîé àäìèíèñòðàöèåé èëè Êðàñíîé àäìèíèñòðàöèåé!");
            end
        end

        if (time - settings.last_send_conference_third >= 604800) then
            if ((day == 2) and (hour == settings.send_conference_third_hour) and (minute == settings.send_conference_third_minute)) then
                settings.last_send_conference_third = settings.last_send_conference_third + 604800;

                local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_conference_third` = %d WHERE `server_id` = %d;"):format(settings.last_send_conference_third, server_id);
                AsyncMysqlQuery(q);

                sendMessage("/ao [Êîíôåðåíöèÿ] Ïî ñðåäàì â 18 ÷àñîâ â Discord Àrizona Gàmes ïðîõîäèò òåò-à-òåò êîíôåðåíöèÿ.");
                sendMessage("/ao [Êîíôåðåíöèÿ] Âû ñìîæåòå ðåøèòü âàø âîïðîñ íàïðÿìóþ ñ Ãëàâíîé àäìèíèñòðàöèåé èëè Êðàñíîé àäìèíèñòðàöèåé!");
            end
        end

        if (time - settings.last_send_conference_fourth >= 604800) then
            if ((day == 3) and (hour == settings.send_conference_fourth_hour) and (minute == settings.send_conference_fourth_minute)) then
                settings.last_send_conference_fourth = settings.last_send_conference_fourth + 604800;

                local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_conference_fourth` = %d WHERE `server_id` = %d;"):format(settings.last_send_conference_fourth, server_id);
                AsyncMysqlQuery(q);

                sendMessage("/ao [Êîíôåðåíöèÿ] ×åðåç 30 ìèíóò â Discord Àrizona Gàmes ïðîéä¸ò òåò-à-òåò êîíôåðåíöèÿ.");
                sendMessage("/ao [Êîíôåðåíöèÿ] Âû ñìîæåòå ðåøèòü âàø âîïðîñ íàïðÿìóþ ñ Ãëàâíîé àäìèíèñòðàöèåé èëè Êðàñíîé àäìèíèñòðàöèåé!");
            end
        end

        if (time - settings.last_send_conference_fifth >= 604800) then
            if ((day == 3) and (hour == settings.send_conference_fifth_hour) and (minute == settings.send_conference_fifth_minute)) then
                settings.last_send_conference_fifth = settings.last_send_conference_fifth + 604800;

                local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_conference_fifth` = %d WHERE `server_id` = %d;"):format(settings.last_send_conference_fifth, server_id);
                AsyncMysqlQuery(q);

                sendMessage("/ao [Êîíôåðåíöèÿ] Íà äàííûé ìîìåíò â Discord Àrizona Gàmes ïðîõîäèò òåò-à-òåò êîíôåðåíöèÿ.");
                sendMessage("/ao [Êîíôåðåíöèÿ] Âû ñìîæåòå ðåøèòü âàø âîïðîñ íàïðÿìóþ ñ Ãëàâíîé àäìèíèñòðàöèåé èëè Êðàñíîé àäìèíèñòðàöèåé!");
            end
        end
    end

    while (settings.send_conference_system) do
        wait(1 * 1000 * 60);
        if (settings.bot_is_spawned) then
            check_and_send();
        end
    end
end

function auto_send_mpdonate()
    if (not settings.send_mpdonate_system) then return end;

    local function check_and_send()
        DEBUG("[ DEBUG | mpdonate ] morg: " .. tostring(check.morg) .. " | props: " .. tostring(check.props) .. " | spawncars: " .. tostring(check.spawncars) .. " | pledge: " .. tostring(check.pledge) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.morg) then return end;
        if (check.pledge) then return end;
        if (check.spawncars) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.compensations) then return end;

        local time = os.time();

        if (time - settings.last_send_mpdonate >= settings.send_mpdonate_time * 60) then
            settings.last_send_mpdonate = time;
            check.mpdonate = true;
            license.sellLicenses = false;

            set_bot_position();

            local q = ("UPDATE `arizona`.servers_raksamp SET `last_send_mpdonate` = %d WHERE `server_id` = %d;"):format(settings.last_send_mpdonate, server_id);
            AsyncMysqlQuery(q);

            sendMessage("/apanel");
        end
    end

    while (settings.send_conference_system) do
        wait(1 * 1000 * 60);
        if (settings.bot_is_spawned) then
            check_and_send();
        else
            process = false;
        end
    end
end

function afk_nearby_check()
    check.afk = {};

    while (true) do
        wait(1000);
        local currentTime = os.time();
        for i, v in ipairs(check.afk) do
            if ((currentTime - v.lastUpdate) > 5) then
                table.remove(check.afk, i);
            end
        end
    end
end

function license_nearby_check()
    if (not settings.license_system) then return end;

    wait(1500);

    local i = 1;
    while (settings.license_system) do
        wait(10 * 1000);
        local isLicensorNearby = false;
        for id, player in pairs(getAllPlayers()) do
            if (player.exist) then
                if (player.color == -10079360) then
                    local found = false;
                    for j, v in ipairs(check.afk) do
                        if (id == v.id) then
                            found = true;
                            break;
                        end
                    end

                    if (not found) then
                        isLicensorNearby = true;
                    end
                end
            end
        end

        if (license.sellLicenses == isLicensorNearby) then
            if ((settings.bot_is_spawned) and (not check.morg) and (not check.props) and (not check.spawncars) and (not check.offForms) and (not check.mpdonate) and (not check.pledge) and (not check.bot_bandit) and (not check.businesses_mafia) and (not check.compensations) and (not check.recovery_fraction) and (not check.recovery_account)) then
                license.sellLicenses = not isLicensorNearby;

                set_bot_position();
            end
        end
        i = i + 1;
    end
end

function props_check()
    if (not props.b) then return end

    local props_names = {
        [0] = {
            [0] = "äîìà",
            [1] = "áèçíåñà"
        },
        [1] = {
            [0] = "äîì",
            [1] = "áèçíåñ"
        }
    };

    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | props_check ] morg: " .. tostring(check.morg) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | pledge: " .. tostring(check.pledge) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.morg) then return end;
        if (check.spawncars) then return end;
        if (check.pledge) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local time = os.time();
        local last_message_seconds_ago = time - props.last;

        if (last_message_seconds_ago > (props.delay * 60)) then
            process = true;
            check.props = "props";
            props.last = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_property_sell` = %d WHERE `server_id` = %d;"):format(props.last, server_id);
            AsyncMysqlQuery(query);

            query = ("SELECT * FROM `arizona`.properties_system WHERE `server_id` = %d;"):format(server_id);
            local properties = mysqlQuery(query);
            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/props");

            while (check.props == "props") do
                wait(100);
            end

            for _, poolData in ipairs(props.pool) do
                if (poolData.sell) then
                    check.props = {
                        id = poolData.id,
                        type = poolData.type,
                        action = "Îòêëîíèòü âåðèôèêàöèþ"
                    };

                    query = ("DELETE FROM `arizona`.properties_system WHERE `id` = %d AND `type` = %d AND `owner` = '%s' AND `time` = %d AND `server_id` = %d;"):format(poolData.id, poolData.type, poolData.owner, poolData.time, server_id);
                    AsyncMysqlQuery(query);

                    sendMessage("/notif " .. poolData.owner .. " Âû íå ïðåäîñòàâèëè îïðîâåðæåíèå íà ëîâëþ " .. props_names[0][poolData.type] .. " ¹" .. poolData.id .. ". Âåðèôèêàöèÿ îòêëîíåíà, à " .. props_names[1][poolData.type] .. " îòïðàâëåí íà àóêöèîí.");
                    sendMessage("/props " .. poolData.type .. " " .. poolData.id);
                    wait(5000);
                else
                    query = ("SELECT * FROM `arizona`.properties_system WHERE `id` = %d AND `type` = %d AND `owner` = '%s' AND `time` = %d AND `server_id` = %d;"):format(poolData.id, poolData.type, poolData.owner, poolData.time, server_id);
                    local data = mysqlQuery(query);

                    if (not data[1]) then
                        query = ("INSERT INTO `arizona`.properties_system SET `id` = %d, `type` = %d, `owner` = '%s', `time` = %d, `server_id` = %d;"):format(poolData.id, poolData.type, poolData.owner, poolData.time, server_id);
                        AsyncMysqlQuery(query);
                    end
                end
            end

            for _, property in ipairs(properties) do
                local found = false;

                for _, poolData in ipairs(props.pool) do
                    if (property.id == poolData.id) then
                        found = true;
                        break;
                    end
                end

                if (not found) then
                    query = ("DELETE FROM `arizona`.properties_system WHERE `id` = %d AND `type` = %d AND `owner` = '%s' AND `time` = %d AND `server_id` = %d;"):format(property.id, property.type, property.owner, property.time, server_id);
                    AsyncMysqlQuery(query);
                end
            end

            props.pool = {};
            check.props = nil;
            process = false;
        end
    end

    while (true) do
        wait(1000);
        if (settings.bot_is_spawned) then
            check_and_send();
        else
            process = false;
        end
    end
end

function pledge_check()
    if (not pledge.b) then return end
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | pledge_check ] morg: " .. tostring(check.morg) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | props: " .. tostring(check.props) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.morg) then return end;
        if (check.spawncars) then return end;
        if (check.props) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local time = os.time();
        local last_message_seconds_ago = time - pledge.last;

        if (last_message_seconds_ago > (pledge.delay * 60)) then
            process = true;
            check.pledge = "pledge";
            pledge.last = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_pledge` = %d WHERE `server_id` = %d;"):format(pledge.last, server_id);
            AsyncMysqlQuery(query);

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/apledge");

            while (check.pledge) do
                wait(100);
            end

            for _, bail in ipairs(pledge.pool) do
                if (bail.nickname) then
                    query = ("SELECT * FROM `arizona`.pledge_system WHERE `nickname` = '%s' AND `author` = '%s' AND `admin` = '%s' AND `reason` = '%s' AND `money` = %d AND `time_ban` = %d AND `time_unban` = %d AND `server_id` = %d;"):format(bail.nickname, bail.author, bail.admin, u8(bail.reason), bail.money, bail.time_ban, bail.time_unban, server_id);
                    local data = mysqlQuery(query);

                    if (not data[1]) then
                        query = ("INSERT INTO `arizona`.pledge_system SET `server_id` = %d, `nickname` = '%s', `author` = '%s', `admin` = '%s', `reason` = '%s', `money` = %d, `time_ban` = %d, `time_unban` = %d;"):format(server_id, bail.nickname, bail.author, bail.admin, u8(bail.reason), bail.money, bail.time_ban, bail.time_unban);
                        AsyncMysqlQuery(query);
                    end
                end
            end

            pledge.action = 0;
            pledge.pool = {};
            process = false;
        end
    end

    local function accept()
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.morg) then return end;
        if (check.spawncars) then return end;
        if (check.props) then return end;
        if (check.server_stats == "svrnt") then return end;

        local query = "SELECT * FROM `arizona`.pledge_system WHERE `server_id` = " .. server_id .. ' AND `accepted` = 1 AND `passed` = 0 AND `expired` = 0;';
        local data = mysqlQuery(query);

        if (data) then
            process = true;
            for _, bail in ipairs(data) do
                check.pledge = {
                    pledge_id = bail.pledge_id,
                    action = bail.action,
                    nickname = bail.nickname,
                    author = bail.author,
                    money = bail.money
                };

                wait(5000);
                sendMessage("/apledge");

                while (check.pledge) do
                    wait(100);
                end
            end
            process = false;
        end
    end

    while (true) do
        wait(1000);
        if (settings.bot_is_spawned) then
            check_and_send();
            accept();
        else
            process = false;
        end
    end
end

function fractions_check()
    if (not morg.b) then return end;

    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | fractions_check ] pledge: " .. tostring(check.pledge) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | props: " .. tostring(check.props) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | compensations: " .. tostring(check.compensations) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.spawncars) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local time = os.time();
        local last_message_seconds_ago = time - morg.last;

        if (last_message_seconds_ago > (morg.delay * 60)) then
            process = true;
            check.morg = "orgmembers";
            morg.last = time;

            local query = ("UPDATE `arizona`.servers_raksamp SET `last_fractions` = %d WHERE `server_id` = %d;"):format(time, server_id);
            AsyncMysqlQuery(query);

            license.sellLicenses = false;

            set_bot_position();

            sendMessage("/orgmembers -1");
            wait(1500);

            check.morg = "sobes";
            sendMessage("/sobes");
            wait(5000);

            check.morg = "judges";
            sendMessage("/apanel");
            wait(5000);

            check.morg = "gps";
            sendMessage("/gps");
            wait(5000);

            local members  = {};
            local salary = {};
            for i = 1, 32 do
                members[i] = {};
                salary[i] = {
                    rank_1_salary = 0,
                    rank_2_salary = 0,
                    rank_3_salary = 0,
                    rank_4_salary = 0,
                    rank_5_salary = 0,
                    rank_6_salary = 0,
                    rank_7_salary = 0,
                    rank_8_salary = 0,
                    rank_9_salary = 0,
                    rank_10_salary = 0,
                };
            end

            for id, judge in ipairs(morg.judges) do
                query = ("UPDATE `arizona`.judges_system SET `nickname` = %s, `time_assignment` = %s WHERE `judge_id` = %d AND `server_id` = %d;"):format(judge.nickname and "'" .. judge.nickname .. "'" or "null", judge.date > 0 and tostring(judge.date) or "null", id, server_id);
                AsyncMysqlQuery(query);
            end

            for id, poolData in ipairs(morg.pool) do
                if (poolData.active) then
                    poolData.process = true;
                    poolData.error_stats = 0;
                    poolData.error_first = true;
                    poolData.error_second = true;
                    check.morg = id;

                    sendMessage("/amember " .. id .. " 9");
                    sendMessage("/members");

                    while (poolData.process) do
                        wait(0);
                    end

                    for rank = 1, 10 do
                        for i, rankData in ipairs(poolData.ranks[rank].pool) do
                            table.insert(members[id], rankData);
                            rankData = {};
                        end
                        salary[id]["rank_" .. tostring(rank) .. "_salary"] = poolData.ranks[rank].salary;
                    end

                    if ((poolData.sobes.time) and (poolData.sobes.place)) then
                        query = ("UPDATE `arizona`.fractions_system SET `money` = %d, `dormitory` = %s, `leaders` = %d, `zams` = %d, `online` = %d, `afk` = %d, `rank_1_salary` = %d, `rank_2_salary` = %d, `rank_3_salary` = %d, `rank_4_salary` = %d, `rank_5_salary` = %d, `rank_6_salary` = %d, `rank_7_salary` = %d, `rank_8_salary` = %d, `rank_9_salary` = %d, `rank_10_salary` = %d, `members` = '%s', `sobes_time` = '%s', `sobes_place` = '%s', `owner_family` = %s, `owner_leader` = %s, `owner_deputies` = '%s' WHERE `fraction_id` = %d AND `server_id` = %d;"):format(poolData.money, poolData.dormitory, poolData.leader.status, poolData.zams, poolData.online, poolData.afk, salary[id].rank_1_salary, salary[id].rank_2_salary, salary[id].rank_3_salary, salary[id].rank_4_salary, salary[id].rank_5_salary, salary[id].rank_6_salary, salary[id].rank_7_salary, salary[id].rank_8_salary, salary[id].rank_9_salary, salary[id].rank_10_salary, json.encode(members[id]), u8(poolData.sobes.time), u8(poolData.sobes.place), poolData.owner.family and "'" .. poolData.owner.family .. "'" or 'null', poolData.owner.leader and "'" .. poolData.owner.leader .. "'" or 'null', json.encode(poolData.owner.zams), id, server_id);
                        AsyncMysqlQuery(query);
                    else
                        query = ("UPDATE `arizona`.fractions_system SET `money` = %d, `dormitory` = %s, `leaders` = %d, `zams` = %d, `online` = %d, `afk` = %d, `rank_1_salary` = %d, `rank_2_salary` = %d, `rank_3_salary` = %d, `rank_4_salary` = %d, `rank_5_salary` = %d, `rank_6_salary` = %d, `rank_7_salary` = %d, `rank_8_salary` = %d, `rank_9_salary` = %d, `rank_10_salary` = %d, `members` = '%s', `sobes_time` = %s, `sobes_place` = %s, `owner_family` = %s, `owner_leader` = %s, `owner_deputies` = '%s' WHERE `fraction_id` = %d AND `server_id` = %d;"):format(poolData.money, poolData.dormitory, poolData.leader.status, poolData.zams, poolData.online, poolData.afk, salary[id].rank_1_salary, salary[id].rank_2_salary, salary[id].rank_3_salary, salary[id].rank_4_salary, salary[id].rank_5_salary, salary[id].rank_6_salary, salary[id].rank_7_salary, salary[id].rank_8_salary, salary[id].rank_9_salary, salary[id].rank_10_salary, json.encode(members[id]), 'null', 'null', poolData.owner.family and "'" .. poolData.owner.family .. "'" or 'null', poolData.owner.leader and "'" .. poolData.owner.leader .. "'" or 'null', json.encode(poolData.owner.zams), id, server_id);
                        AsyncMysqlQuery(query);
                    end

                    members[id] = {};
                    poolData.sobes.time = nil;
                    poolData.sobes.place = nil;
                end
            end

            for id, poolData in ipairs(morg.pool) do
                for i, uvalData in ipairs(poolData.uval.pool) do
                    sendMessage("/uvaloff " .. uvalData.nickname);
                    sendMessage("/notif " .. uvalData.nickname .. " Âû áûëè àâòîìàòè÷åñêè óâîëåíû èç îðãàíèçàöèè èç-çà òîãî, ÷òî âû íå çàõîäèëè â èãðó " .. tostring(uvalData.time / 24) .. " äíåé.");
                end
            end

            check.morg = nil;
            process = false;
            loadMorg();
            set_bot_position();
        end
    end

    while (true) do
        wait(1000);
        if (settings.bot_is_spawned) then
            check_and_send();
        else
            process = false;
        end
    end
end

function offline_forms()
    if (not offForms.b) then return end;
    local process = false;

    local function check_and_send()
        process = true;

        for i, v in ipairs(offForms.pool) do
            offForms.process = true;
            local args = string.split(v.form);
            args[1] = string.lower(args[1] or "");

            for j, formData in ipairs(offForms.list) do
                if (args[1] == ("/%s"):format(formData.name)) then
                    if (formData.state) then
                        local f_plId = formData.param_target + 1;

                        local year, month, day, hour, min, sec = v.time:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)");

                        local date_table = {
                            year = tonumber(year),
                            month = tonumber(month),
                            day = tonumber(day),
                            hour = tonumber(hour),
                            min = tonumber(min),
                            sec = tonumber(sec)
                        };

                        local target_time = os.time(date_table);
                        local current_time = os.time();

                        if ((current_time - target_time) >= (7 * 24 * 60 * 60)) then
                            local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ïðîøëî 7 äíåé.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. v.form_id .. " AND `server_id` = " .. server_id .. ';';
                            mysqlQuery(query);

                            offForms.process = false;
                            offForms.widget = {};
                            check.offForms = nil;
                        else
                            wait(1 * 1000 * 3);

                            offForms.widget.form_name = args[1]:gsub("/", "");
                            offForms.widget.args = args;
                            offForms.widget.form_id = v.form_id;
                            offForms.widget.f_plId = f_plId;
                            offForms.widget.form = table.concat(args, " ");
                            offForms.widget.runner = formData.runner;
                            offForms.widget.match = ("/%s %s"):format(formData.name, formData.params):gsub(" ", "%%s+");
                            offForms.widget.runner(offForms.widget.form_name, offForms.widget.form, offForms.widget.match);

                            while (offForms.process) do
                                wait(0);

                                if (os.time() - current_time > 10) then
                                    offForms.process = false;
                                    offForms.widget = {};
                                    check.offForms = nil;
                                end
                            end
                        end
                    else
                        local query = "UPDATE `arizona`.form_off_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8('Ôîðìà îòêëþ÷åíà íà ñåðâåðå.') .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `form_id` = " .. v.form_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        offForms.process = false;
                        offForms.widget = {};
                        check.offForms = nil;
                    end
                end
            end
        end
        offForms.pool = {};
        process = false;
    end

    while (offForms.b) do
        wait(1 * 1000 * 10);
        if (settings.bot_is_spawned) then
            if (not process) then
                offForms.pool = {};

                local query = "SELECT * FROM `arizona`.form_off_system WHERE `accepted` = 1 AND `passed` = 0 AND `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(offForms.pool, {
                            form_id = v.form_id,
                            form = v.form,
                            time = v.time_created
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function compensations_forms()
    if (not compensations.b) then return end;
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | compensations_forms ] pledge: " .. tostring(check.pledge) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | props: " .. tostring(check.props) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | morg: " .. tostring(check.morg) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | recovery_fraction: " .. tostring(check.recovery_fraction), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.spawncars) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.morg) then return end;
        if (check.recovery_account) then return end;
        if (check.recovery_fraction) then return end;

        local spawned = false;
        process = true;

        for _, v in ipairs(compensations.pool) do
            compensations.process = true;
            local args = string.split(v.form);
            args[1] = string.lower(args[1] or "");

            for _, formData in ipairs(compensations.list) do
                if (args[1] == ("/%s"):format(formData.name)) then
                    local f_plId = formData.param_target + 1;
                    local complaintId = tonumber(v.url:match("%d+"));

                    if (not spawned) then
                        spawned = true;
                        license.sellLicenses = false;
                        check.compensations = true;

                        set_bot_position();
                    end

                    if (v.denied) then
                        local query = "UPDATE `arizona`.compensations_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `compensation_id` = " .. v.compensation_id .. " AND `server_id` = " .. server_id .. ';';
                        mysqlQuery(query);

                        sendMessage("/notif " .. args[f_plId] .. " Çàÿâêà íà êîìïåíñàöèþ ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà àäìèíèñòðàòîðîì " .. v.administrator .. ".");
                    else
                        local year, month, day, hour, min, sec = v.time:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)");

                        local date_table = {
                            year = tonumber(year),
                            month = tonumber(month),
                            day = tonumber(day),
                            hour = tonumber(hour),
                            min = tonumber(min),
                            sec = tonumber(sec)
                        };

                        local target_time = os.time(date_table);
                        local current_time = os.time();

                        if ((current_time - target_time) >= (7 * 24 * 60 * 60)) then
                            local query = "UPDATE `arizona`.compensations_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ïðîøëî 7 äíåé.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `compensation_id` = " .. v.compensation_id .. " AND `server_id` = " .. server_id .. ';';
                            mysqlQuery(query);

                            sendMessage("/notif " .. args[f_plId] .. " Çàÿâêà íà êîìïåíñàöèþ ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà èç-çà îøèáêè.");

                            compensations.process = false;
                            compensations.widget = {};
                        else
                            wait(1 * 1000 * 3);

                            compensations.widget.form_name = args[1]:gsub("/", "");
                            compensations.widget.args = args;
                            compensations.widget.compensation_id = v.compensation_id;
                            compensations.widget.f_plId = f_plId;
                            compensations.widget.player = args[f_plId];
                            compensations.widget.administrator = v.administrator;
                            compensations.widget.complaintId = complaintId;
                            compensations.widget.form = table.concat(args, " ");
                            compensations.widget.runner = formData.runner;
                            compensations.widget.match = ("/%s %s"):format(formData.name, formData.params):gsub(" ", "%%s+");
                            compensations.widget.runner(compensations.widget.form_name, compensations.widget.form, compensations.widget.match);

                            while (compensations.process) do
                                wait(0);

                                if (os.time() - current_time > 10) then
                                    compensations.process = false;
                                    compensations.widget = {};
                                end
                            end
                        end
                    end
                end
            end
        end
        compensations.pool = {};
        check.compensations = false;
        process = false;
    end

    while (compensations.b) do
        wait(1 * 1000 * 10);
        if (settings.bot_is_spawned) then
            if (not process) then
                compensations.pool = {};

                local query = "SELECT * FROM `arizona`.compensations_system WHERE `accepted` = 1 AND `passed` = 0 AND `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(compensations.pool, {
                            compensation_id = v.compensation_id,
                            form = v.form,
                            denied = v.denied == 1,
                            url = v.url,
                            administrator = v.user_accepted,
                            time = v.time_created
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function recovery_fraction_forms()
    if (not recovery_fraction.b) then return end;
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | recovery_fraction_forms ] pledge: " .. tostring(check.pledge) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | props: " .. tostring(check.props) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | morg: " .. tostring(check.morg) .. " | recovery_account: " .. tostring(check.recovery_account) .. " | compensations: " .. tostring(check.compensations), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.spawncars) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.morg) then return end;
        if (check.compensations) then return end;
        if (check.recovery_account) then return end;

        local spawned = false;
        process = true;

        for _, form in ipairs(recovery_fraction.pool) do
            local complaintId = tonumber(form.url:match("%d+"));
            recovery_fraction.process = true;

            if (form.denied) then
                if (not spawned) then
                    spawned = true;
                    license.sellLicenses = false;
                    check.recovery_fraction = true;

                    set_bot_position();
                end

                local query = "UPDATE `arizona`.recovery_fraction_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. form.uid .. " AND `server_id` = " .. server_id .. ';';
                mysqlQuery(query);

                sendMessage("/notif " .. form.player .. " Çàÿâêà íà âîññòàíîâëåíèå âî ôðàêöèè ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà àäìèíèñòðàòîðîì " .. form.administrator .. ".");
            else
                local year, month, day, hour, min, sec = form.time:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)");

                local date_table = {
                    year = tonumber(year),
                    month = tonumber(month),
                    day = tonumber(day),
                    hour = tonumber(hour),
                    min = tonumber(min),
                    sec = tonumber(sec)
                };

                local target_time = os.time(date_table);
                local current_time = os.time();

                if ((current_time - target_time) >= (7 * 24 * 60 * 60)) then
                    if (not spawned) then
                        spawned = true;
                        license.sellLicenses = false;
                        check.recovery_fraction = true;

                        set_bot_position();
                    end

                    local query = "UPDATE `arizona`.recovery_fraction_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ïðîøëî 7 äíåé.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. form.uid .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    sendMessage("/notif " .. form.player .. " Çàÿâêà íà âîññòàíîâëåíèå âî ôðàêöèè ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà èç-çà îøèáêè.");

                    recovery_fraction.process = false;
                else
                    if (getPlayerIdByNickname(form.player) >= 0) then
                        if (not spawned) then
                            spawned = true;
                            license.sellLicenses = false;
                            check.recovery_fraction = true;

                            set_bot_position();
                        end

                        check.recovery_fraction = {
                            uid = form.uid,
                            player = form.player,
                            administrator = form.administrator,
                            complaintId = complaintId
                        };

                        sendMessage("/setmember " .. getPlayerIdByNickname(form.player) .. " " .. form.fraction .. " " .. form.rank .. " ïî æàëîáå ¹" .. complaintId);
                    end

                    while (recovery_fraction.process) do
                        wait(0);

                        if (os.time() - current_time > 10) then
                            recovery_fraction.process = false;
                        end
                    end
                end
            end
        end

        recovery_fraction.pool = {};
        check.recovery_fraction = false;
        process = false;
    end

    while (recovery_fraction.b) do
        wait(1 * 1000 * 10);
        if (settings.bot_is_spawned) then
            if (not process) then
                recovery_fraction.pool = {};

                local query = "SELECT * FROM `arizona`.recovery_fraction_system WHERE `accepted` = 1 AND `passed` = 0 AND `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(recovery_fraction.pool, {
                            uid = v.uid,
                            denied = v.denied == 1,
                            url = v.url,
                            fraction = v.fraction,
                            rank = v.rank,
                            player = v.user_created,
                            administrator = v.user_accepted,
                            time = v.time_created
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function recovery_account_forms()
    if (not recovery_account.b) then return end;
    local process = false;

    local function check_and_send()
        DEBUG("[ DEBUG | recovery_account_forms ] pledge: " .. tostring(check.pledge) .. " | mpdonate: " .. tostring(check.mpdonate) .. " | spawncars: " .. tostring(check.spawncars) .. " | props: " .. tostring(check.props) .. " | bot_bandit: " .. tostring(check.bot_bandit) .. " | businesses_mafia: " .. tostring(check.businesses_mafia) .. " | server_stats: " .. tostring(check.server_stats == "svrnt") .. " | morg: " .. tostring(check.morg) .. " | recovery_fraction: " .. tostring(check.recovery_fraction) .. " | compensations: " .. tostring(check.compensations), settings.debug);
        if (process) then return end;
        if (check.mpdonate) then return end;
        if (check.offForms) then return end;
        if (check.props) then return end;
        if (check.pledge) then return end;
        if (check.spawncars) then return end;
        if (check.server_stats == "svrnt") then return end;
        if (check.businesses_mafia) then return end;
        if (check.bot_bandit) then return end;
        if (check.morg) then return end;
        if (check.compensations) then return end;
        if (check.recovery_fraction) then return end;

        local spawned = false;
        process = true;

        for _, form in ipairs(recovery_account.pool) do
            local complaintId = tonumber(form.url:match("%d+"));
            recovery_account.process = true;

            if (not spawned) then
                spawned = true;
                license.sellLicenses = false;
                check.recovery_account = true;

                set_bot_position();
            end

            if (form.denied) then
                local query = "UPDATE `arizona`.recovery_account_system SET `passed` = 1, `time_passed` = DEFAULT WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. form.uid .. " AND `server_id` = " .. server_id .. ';';
                mysqlQuery(query);

                sendMessage("/notif " .. form.player .. " Çàÿâêà íà âîññòàíîâëåíèå àêêàóíòà ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà àäìèíèñòðàòîðîì " .. form.administrator .. ".");
            else
                local year, month, day, hour, min, sec = form.time:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)");

                local date_table = {
                    year = tonumber(year),
                    month = tonumber(month),
                    day = tonumber(day),
                    hour = tonumber(hour),
                    min = tonumber(min),
                    sec = tonumber(sec)
                };

                local target_time = os.time(date_table);
                local current_time = os.time();

                if ((current_time - target_time) >= (7 * 24 * 60 * 60)) then
                    local query = "UPDATE `arizona`.recovery_account_system SET `passed` = 1, `time_passed` = DEFAULT, `error` = 1, `text_error` = '" .. u8("Ïðîøëî 7 äíåé.") .. "' WHERE `accepted` = 1 AND `passed` = 0 AND `uid` = " .. form.uid .. " AND `server_id` = " .. server_id .. ';';
                    mysqlQuery(query);

                    sendMessage("/notif " .. form.player .. " Çàÿâêà íà âîññòàíîâëåíèå àêêàóíòà ïî æàëîáå ¹" .. complaintId .. " áûëà îòêëîíåíà èç-çà îøèáêè.");

                    recovery_account.process = false;
                else
                    check.recovery_account = {
                        uid = form.uid,
                        player = form.player,
                        administrator = form.administrator,
                        complaintId = complaintId
                    };

                    sendMessage("/unban " .. form.player .. " ïî æàëîáå ¹" .. complaintId);

                    while (recovery_account.process) do
                        wait(0);

                        if (os.time() - current_time > 10) then
                            recovery_account.process = false;
                        end
                    end
                end
            end
        end

        recovery_account.pool = {};
        check.recovery_account = false;
        process = false;
    end

    while (recovery_account.b) do
        wait(1 * 1000 * 10);
        if (settings.bot_is_spawned) then
            if (not process) then
                recovery_account.pool = {};

                local query = "SELECT * FROM `arizona`.recovery_account_system WHERE `accepted` = 1 AND `passed` = 0 AND `server_id` = " .. server_id .. ';';
                local data = mysqlQuery(query);

                if (data) then
                    for i, v in ipairs(data) do
                        table.insert(recovery_account.pool, {
                            uid = v.uid,
                            denied = v.denied == 1,
                            url = v.url,
                            player = v.user_created,
                            administrator = v.user_accepted,
                            time = v.time_created
                        });
                    end
                end

                check_and_send();
            end
        else
            process = false;
        end
    end
end

function set_bot_position()
    sendMessage("/spawn");

    if (settings.license_system) then
        if (license.sellLicenses) then
            sendMessage("/aplpos " .. settings.license_second_position);
        else
            sendMessage("/aplpos " .. settings.license_first_position);
        end
    else
        sendMessage("/aplpos " .. settings.spawn_position);
    end

    if (settings.amember_system) then
        if ((not check.morg) and (not check.props) and (not check.mpdonate) and (not check.spawncars) and (not check.pledge) and (not check.offForms) and (check.server_stats ~= 'svrnt')) then
            sendMessage("/amember " .. settings.amember_fraction .. " " .. settings.amember_rank);
        end
    end

    settings.bot_is_spawned = true;
end

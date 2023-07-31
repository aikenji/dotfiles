local ls = require("luasnip")
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {

    -- img
    ls.snippet(
        {
            trig = "img",
            dscr = "Insert image in html",
            priority = 100,
        },
        fmta([[<img src="$^" alt="$^" height=$^>]], {
            i(1, "url"),
            i(2, "alt"),
            i(3, "size"),
        }, { delimiters = "$^" })
    ),
}

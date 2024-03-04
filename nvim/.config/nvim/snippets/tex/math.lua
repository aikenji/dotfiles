local get_visual = function(args, parent)
    if #parent.snippet.env.LS_SELECT_RAW > 0 then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end

return {
    s({ trig = ";a", snippetType = "autosnippet" }, {
        t("\\alpha"),
    }),

    s({ trig = "ff", dscr = "ff into '\frac{}{}'" }, fmta("\\frac{<>}{<>}", { i(1, "url"), i(2, "display name") })),

    s(
        { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
        fmta("\\textit{<>}", {
            d(1, get_visual),
        })
    ),
}

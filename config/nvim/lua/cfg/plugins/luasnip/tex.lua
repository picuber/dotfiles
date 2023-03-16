local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

local function refFn(args)
	local type = string.lower(args[1][1])
	local short = {
		appendix = "appendix",
		chapter = "chapter",
		section = "sec",
		subsection = "ssec",
		subsubsection = "sssec",
		listing = "lst",
		figure = "fig",
	}
	if short[type] then
		return short[type]
	else
		return "sec"
	end
end

local function lowerFn(args)
	return string.lower(args[1][1])
end

ls.add_snippets("tex", {
	s({ trig = "    i", name = "\\item" }, {
		t("\\item "),
	}),

	s({ trig = "it", name = "itemize" }, {
		t({ "\\begin{itemize}", "    \\item " }),
		i(0),
		t({ "", "\\end{itemize}" }),
	}),

	s({ trig = "t", name = "TOP" }, {
		t("\\"),
		c(1, { t("Top"), t("STop"), t("SSTop") }),
		t("{"),
		i(2),
		t("}{"),
		i(0),
		t("}"),
	}),

	s({ trig = "bf", name = "bold" }, {
		t("\\textbf{"),
		i(1),
		t("} "),
		i(0),
	}),

	s({ trig = "ref", name = "reference" }, {
		c(
			1,
			{ t("Listing"), t("Section"), t("Subsection"), t("Subsubsection"), t("Figure"), t("Appendix"), t("Chapter") }
		),
		t("~\\ref{"),
		f(refFn, 1),
		t(":"),
		i(2),
		t("}"),
		i(0),
	}),

	s({ trig = "sec", name = "section" }, {
		t("\\"),
		c(1, { t("section"), t("subsection"), t("subsubsection"), t("chapter") }),
		t("{"),
		i(2),
		t("}\\label{"),
		f(refFn, 1),
		t(":"),
		f(lowerFn, 2),
		i(3),
		t("}"),
		i(0),
	}),

	s({ trig = "ls", name = "lstinline" }, {
		t("\\lstinline{"),
		i(1),
		t("}"),
		i(0),
	}),
}, { key = "tex" })

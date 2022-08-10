local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
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

ls.add_snippets("javascript", {
	s({ trig = "cl", name = "console.log()" }, {
		t('console.log("'),
		i(0),
		t('");'),
	}),

	s({ trig = "fn", name = "anonymous arrow function" }, {
		t("("),
		i(1),
		t(")"),
		i(2),
		t(" => {"),
		i(0),
		t("}"),
	}),

	s({ trig = "cfn", name = "const arrow function" }, {
		t("const "),
		i(1, "fn_name"),
		t(" = ("),
		i(2),
		t(")"),
		i(3),
		t(" => "),
		t("{"),
		i(0),
		t("}"),
	}),
}, { key = "javascript" })

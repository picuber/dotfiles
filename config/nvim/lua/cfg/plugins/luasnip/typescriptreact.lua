local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
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

ls.filetype_extend("typescriptreact", { "javascript" })

local function copy(idx)
	return function(args)
		return args[idx]
	end
end

local function firstUp(func)
	return function(args)
        local value = func(args)[1]
		return value:gsub("^%l", string.upper)
	end
end

ls.add_snippets("typescriptreact", {
	s({ trig = "com", name = "component" }, {
		t("type "),
		f(copy(1), 1),
		t({ "Props = {};", "", "export const " }),
		i(1, "ComponentName"),
		t(" = ({}: "),
		f(copy(1), 1),
		t({ "Props) => {", "  " }),
		i(0),
		t({ "", "  return <></>;", "};" }),
	}),

	s({ trig = "uses", name = "useState" }, {
		-- const [a, setA] = useState<>();
		t("const ["),
		i(1),
		t(", set"),
		f(firstUp(copy(1)), 1),
		t("] = useState<"),
		i(2),
		t(">("),
		i(0),
		t(");"),
	}),
}, { key = "typescriptreact" })

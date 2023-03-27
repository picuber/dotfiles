local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
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

local function date(_, _, format)
	return os.date(format)
end

ls.add_snippets("all", {
	s({ trig = "date", name = "current date" }, {
		f(date, {}, { user_args = { "%F" } }),
	}),
	s({ trig = "time", name = "current time" }, {
		c(1, {
			f(date, {}, { user_args = { "%R" } }),
			f(date, {}, { user_args = { "%R %Z" } }),
			f(date, {}, { user_args = { "%R%z" } }),
		}),
		i(0),
	}),
	s({ trig = "times", name = "current time w/ sec" }, {
		c(1, {
			f(date, {}, { user_args = { "%T" } }),
			f(date, {}, { user_args = { "%T %Z" } }),
			f(date, {}, { user_args = { "%T%z" } }),
		}),
		i(0),
	}),
	s({ trig = "dtime", name = "current date and time" }, {
		c(1, {
			f(date, {}, { user_args = { "%F %R" } }),
			f(date, {}, { user_args = { "%F %R %Z" } }),
			f(date, {}, { user_args = { "%F %R%z" } }),
		}),
		i(0),
	}),
	s({ trig = "dtimes", name = "current date and time w/ sec" }, {
		c(1, {
			f(date, {}, { user_args = { "%F %T" } }),
			f(date, {}, { user_args = { "%F %T %Z" } }),
			f(date, {}, { user_args = { "%F %T%z" } }),
		}),
		i(0),
	}),
	s({ trig = "epoch", name = "seconds since epoch" }, { f(function()
		return os.date("%s")
	end) }),
}, { key = "all" })

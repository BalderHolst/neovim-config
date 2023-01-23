-- How to snippet: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local same = function(index)
	return f(function(args, snip) return args[1][1] end, {index}, { user_args = nil })
end

return{
	-- Equations
	s({dscr="Inline math", trig = "e"}, { t("$"), i(1, "eq"), t("$") }),	-- Inline equations
	s({dscr="Display math", trig = "ee"}, { t("$$"), i(1, "eq"), t("$$") }),	-- Display equations

	-- Operatiors
	s("^", { t("^{"),  i(1), t("} "), i (0)}),
	s("_", { t("_{"),  i(1), t("} "), i (0)}),
	s("*", { t("\\cdot "),  i(0)}),
	s("f", { t("\\frac{"), i(1), t("}{"), i(2), t("} "), i(0)}),
	s("t", { t("\\text{"), i(1), t("} "), i(0)}),
}

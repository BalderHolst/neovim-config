-- How to snippet: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local same = function(index)
	return f(function(args, snip) return args[1][1] end, {index}, { user_args = nil })
end

return{
	-- Chapters and Sections
	s("ch", { t("\\chaper{"), i(1), t({"}", "\\label{ch:"}), same(1), t({"}", "", ""}), i(0) }),
	s("sec", { t("\\section{"), i(1), t({"}", "\\label{sec:"}), same(1), t({"}", "", ""}), i(0) }),
	s("ssec", { t("\\subsection{"), i(1), t({"}", "\\label{sec:"}), same(1), t({"}", "", ""}), i(0) }),
	s("sssec", { t("\\subsubsection{"), i(1), t({"}", "\\label{sec:"}), same(1), t({"}", "", ""}), i(0) }),


	-- Equations
	s({dscr="Inline math", trig = "e"}, { t("$"), i(1, "eq"), t("$") }),	-- Inline equations
	s({dscr="Display math", trig = "ee"}, { t("$$"), i(1, "eq"), t("$$") }),	-- Display equations

	-- Operatiors
	s("^", { t("^{"),  i(1), t("} "), i (0)}),
	s("_", { t("_{"),  i(1), t("} "), i (0)}),
	s("*", { t("\\cdot "),  i(0)}),
	s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("} "), i(0)}),
	s("text", { t("\\text{"), i(1), t("} "), i(0)}),
}

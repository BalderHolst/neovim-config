local matlab = require("matlab");
matlab.setup({
    matlab_path = "matlab",
    open_window = require("matlab.openers").vsplit,
    splash = false,
    matlab_flags = {},

})
return matlab

local M = {}

function M.setup()
   require("flutter-tools").setup{
	   ui = {
		   notification_style = 'native'
	   },
	   lsp = {
		   color = {
			   enabled = true,
			   background = false,
			   virtual_text = true, -- show the highlight using virtual text
      			   virtual_text_str = "■", -- the virtual text character to highlight
		   }
	   },
	   decorations = {
		   device = true,
	   },
	   settings = {
		   enableSnippets = true,
	   },
	   widget_guides = {
		   enabled = true,
	   },
   }
end

return M

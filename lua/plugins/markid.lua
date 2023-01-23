local m = require'markid'

local M = {}

M.colors = {
    dark = { "#619e9d", "#9E6162", "#81A35C", "#7E5CA3", "#9E9261", "#616D9E", "#97687B", "#689784", "#999C63", "#66639C" },
    balder = { "#91cecd", "#cE9192", "#b1d38C", "#aE8Cd3", "#cEc291", "#919DcE", "#c798aB", "#98c7b4", "#c9cC93", "#9693cC" },
    bright = {"#f5c0c0", "#f5d3c0", "#f5eac0", "#dff5c0", "#c0f5c8", "#c0f5f1", "#c0dbf5", "#ccc0f5", "#f2c0f5", "#c8bc33" },
    medium = { "#c99d9d", "#c9a99d", "#c9b79d", "#c9c39d", "#bdc99d", "#a9c99d", "#9dc9b6", "#9dc2c9", "#9da9c9", "#b29dc9" }
}
require "nvim-treesitter.configs".setup {
  markid = {
      enable = true,
      colors = M.colors.balder
      },
}

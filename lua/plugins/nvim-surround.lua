-- 快速添加包裹
-- ys[2w, iw, $, ...][", ', (, t<for HTML tag>, ...)]
-- <visual mode><S-s>[XXX]
-- ds[", (, {, ...] del surroundings
-- cs[before][after] change surroundings
return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
}

require'nvim-autopairs'.setup{
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    check_trs = true,
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

" Enable Mouse
set mouse=a

hi Normal guifg=NONE guibg=#434C5E

" hi vimGroupName ctermfg=87 ctermbg=NONE cterm=NONE guifg=NONE guibg=#434C5E
" hi vimGroup ctermfg=87 ctermbg=NONE cterm=NONE guifg=NONE guibg=#434C5E
" hi vimOption ctermfg=87 ctermbg=NONE cterm=NONE guifg=NONE guibg=#434C5E
" hi vimHiCtermFgBg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#434C5E
" hi vimHiGuiFgBg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#434C5E

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    " GuiFont {font_name}:h{size}
    GuiFont FiraCode Nerd Font Mono:h14
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Enable GUI opacity
if exists(':GuiWindowOpacity')
    GuiWindowOpacity 0.9
endif

" Enable GUI font ligatures
if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

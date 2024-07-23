" obsidian -----------------------------------------------
" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

" Emulate Tab Switching https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall
exmap foldall obcommand editor:fold-all
nmap zM :foldall

" javascript ----------------------------------------------
" this script does'nt work
" exmap nextHeading jsfile mdHelpers.js {jumpHeading(true)}
" exmap prevHeading jsfile mdHelpers.js {jumpHeading(false)}
" nmap ]] :nextHeading
" nmap [[ :prevHeading

" map ----------------------------------------------------
" use clipboard <Space> + ~
unmap <Space>
nmap <Space>y "+y
nmap <Space>p "+p
nmap <Space>P "+P
nmap <Space>d "+d
vmap <Space>y "+y
vmap <Space>p "+p
vmap <Space>P "+P
vmap <Space>d "+d

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" I like using H and L for beginning/end of line
" nmap H ^
" nmap L $
" vmap H ^
" vmap L $

" yank
nmap Y y$

" surround -----------------------------------------------
"exmap surround_wiki surround [[ ]]
"exmap surround_double_quotes surround " "
"exmap surround_single_quotes surround ' '
"exmap surround_brackets surround ( )
"exmap surround_square_brackets surround [ ]
"exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
"map st :surround_wiki
"nunmap s
"vunmap s
"map s" :surround_double_quotes
"map s' :surround_single_quotes
"map sb :surround_brackets
"map s( :surround_brackets
"map s) :surround_brackets
"map s[ :surround_square_brackets
"map s[ :surround_square_brackets
"map s{ :surround_curly_brackets
"map s} :surround_curly_brackets

" jump-to-link ---------------------------------------------
exmap jumpanywhere obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap gs :jumpanywhere

exmap jumpToLink obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap s :jumpToLink

exmap quickSwicherPlus obcommand darlal-switcher-plus:switcher-plus:open
nmap <Space>f :quickSwicherPlus

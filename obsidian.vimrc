" === Leader ===
" let mapleader=,
" can't set leaders in Obsidian vim, so the key just has to be used consistently.
" However, it needs to be unmapped, to not trigger default behavior: https://github.com/esm7/obsidian-vimrc-support#some-help-with-binding-space-chords-doom-and-spacemacs-fans
unmap ,

" Yank to system clipboard
set clipboard=unnamed


" === Surround ===
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_back_quotes surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
" NOTE: must use 'map' and not 'nmap'
nunmap s
vunmap s
map sw :surround_wiki<CR>
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_back_quotes<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s] :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>

" === Folding ===
exmap fold_toggle obcommand editor:toggle-fold
exmap fold_unfold_all obcommand editor:unfold-all
exmap fold_fold_all obcommand editor:fold-all

nmap za :fold_toggle<CR>
nmap zc :fold_toggle<CR>
nmap zo :fold_toggle<CR>
nmap zR :fold_unfold_all<CR>
nmap zM :fold_fold_all<CR>


" === Windowing ===
exmap wq obcommand workspace:close
exmap q obcommand workspace:close
exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-horizontal
exmap window_focus_left obcommand editor:focus-left
exmap window_focus_right obcommand editor:focus-right
exmap window_focus_bottom obcommand editor:focus-bottom
exmap window_focus_top obcommand editor:focus-top
exmap window_tab_new obcommand workspace:new-tab
exmap window_tab_next obcommand workspace:next-tab
exmap window_tab_prev obcommand workspace:previous-tab
exmap window_sidebar_toggle_left obcommand app:toggle-left-sidebar
exmap window_sidebar_toggle_right obcommand app:toggle-right-sidebar
exmap app_forward obcommand app:go-forward
exmap app_back obcommand app:go-back
exmap app_reload obcommand app:reload

nmap <C-w>v :vs<CR>
nmap <C-w>s :sp<CR>
nmap <C-w>h :window_focus_left<CR>
nmap <C-w>l :window_focus_right<CR>
nmap <C-w>j :window_focus_bottom<CR>
nmap <C-w>k :window_focus_top<CR>
nmap <C-w>n :window_tab_new<CR>

nmap ,ws :vs<CR>
nmap ,wS :sp<CR>
nmap ,wh :window_focus_left<CR>
nmap ,wl :window_focus_right<CR>
nmap ,wj :window_focus_bottom<CR>
nmap ,wk :window_focus_top<CR>
nmap ,wn :window_tab_new<CR>
nmap ,[[ :window_sidebar_toggle_left<CR>
nmap ,]] :window_sidebar_toggle_right<CR>
nmap ,wreload :app_reload<CR>
nmap ,tl :window_tab_next<CR>
nmap ,th :window_tab_prev<CR>
nmap ,L :app_forward<CR>
nmap ,H :app_back<CR>

" === View Modes ===
exmap viewmode_source obcommand editor:toggle-source

nmap ,ms :viewmode_source



" === Toggles ====
exmap toggle_spell obcommand editor:toggle-spellcheck

nmap ,,s :toggle_spell<CR>


" === Open components ===
exmap open_files obcommand switcher:open
exmap open_file_tree obcommand file-explorer:reveal-active-file
exmap open_search obcommand global-search:open
exmap open_backlinks obcommand backlink:open
exmap open_links obcommand outgoing-links:open
exmap open_graph obcommand graph:open
exmap open_graph_local obcommand graph:open-local
exmap open_commands obcommand command-palette:open
exmap open_calendar obcommand calendar:show-calendar-view
exmap open_bookmarks obcommand bookmarks:open
exmap open_outline obcommand outline:open
exmap open_tags obcommand tag-pane:open
exmap open_templates obcommand insert-templates


nmap ,of :open_files<CR>
nmap ,oF :open_file_tree<CR>
nmap ,os :open_search<CR>
nmap ,ob :open_backlinks<CR>
nmap ,ol :open_links<CR>
nmap ,og :open_graph<CR>
nmap ,oG :open_graph_local<CR>
nmap ,oc :open_commands<CR>
nmap ,oC :open_calendar<CR>
nmap ,om :open_bookmarks<CR>
nmap ,oo :open_outline<CR>
nmap ,ot :open_tags<CR>
nmap ,oT :open_templates<CR>

" === Daily Notes ===
exmap daily_open obcommand daily-notes
exmap daily_prev obcommand daily-notes:goto-prev
exmap daily_next obcommand daily-notes:goto-next

nmap ,dd :daily_open<CR>
nmap ,dh :daily_prev<CR>
nmap ,dl :daily_next<CR>

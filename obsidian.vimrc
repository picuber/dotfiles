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
map sw :surround_wiki
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_back_quotes
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s] :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

" === Folding ===
exmap fold_toggle obcommand editor:toggle-fold
exmap fold_unfold_all obcommand editor:unfold-all
exmap fold_fold_all obcommand editor:fold-all

nmap za :fold_toggle
nmap zc :fold_toggle
nmap zo :fold_toggle
nmap zR :fold_unfold_all
nmap zM :fold_fold_all


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

nmap <C-w>v :vs
nmap <C-w>s :sp
nmap <C-w>h :window_focus_left
nmap <C-w>l :window_focus_right
nmap <C-w>j :window_focus_bottom
nmap <C-w>k :window_focus_top
nmap <C-w>n :window_tab_new

nmap ,ws :vs
nmap ,wS :sp
nmap ,wh :window_focus_left
nmap ,wl :window_focus_right
nmap ,wj :window_focus_bottom
nmap ,wk :window_focus_top
nmap ,wn :window_tab_new
nmap ,[[ :window_sidebar_toggle_left
nmap ,]] :window_sidebar_toggle_right
nmap ,wreload :app_reload
nmap ,tl :window_tab_next
nmap ,th :window_tab_prev
nmap ,L :app_forward
nmap ,H :app_back

" === View Modes ===
exmap viewmode_source obcommand editor:toggle-source

nmap ,ms :viewmode_source



" === Toggles ====
exmap toggle_spell obcommand editor:toggle-spellcheck

nmap ,,s :toggle_spell


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


nmap ,of :open_files
nmap ,oF :open_file_tree
nmap ,os :open_search
nmap ,ob :open_backlinks
nmap ,ol :open_links
nmap ,og :open_graph
nmap ,oG :open_graph_local
nmap ,oc :open_commands
nmap ,oC :open_calendar
nmap ,om :open_bookmarks
nmap ,oo :open_outline
nmap ,ot :open_tags
nmap ,oT :open_templates

" === Daily Notes ===
exmap daily_open obcommand daily-notes
exmap daily_prev obcommand daily-notes:goto-prev
exmap daily_next obcommand daily-notes:goto-next

nmap ,dd :daily_open
nmap ,dh :daily_prev
nmap ,dl :daily_next

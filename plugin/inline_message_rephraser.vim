" Title:        Inline message rephraser
" Description:  A VIM plugin to rephrase message in inline mode.
" Last Change:  9 Nov 2024
" Maintainer:   ChinYikMing
" <https://github.com/ChinYikMing/inline-message-rephraser>

if exists("loaded_this_plugin")
    finish
endif

let loaded_this_plugin = 1

command! -nargs=0 R call inline_message_rephraser#rephrase()

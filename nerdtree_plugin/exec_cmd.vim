" ============================================================================
" File:        exec_cmd.vim
" Description: plugin for NERD Tree that provides an execute command menu item
" Maintainer:  Felipe Roveran <feliperoveran at hotmail dot com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
if exists("g:loaded_nerdtree_exec_cmd")
    finish
endif
let g:loaded_nerdtree_exec_cmd = 1

call NERDTreeAddMenuItem({
            \ 'text': '(e)xecute OS command on a childnode',
            \ 'shortcut': 'e',
            \ 'callback': 'NERDTreeOSCommand'})

function! NERDTreeOSCommand()
  let command = input('Command: ') . ' ' .  g:NERDTreeFileNode.GetSelected().path.str()
  let command = command . ' ' . input('Command: ' . command . ' ')

  if command !=# ''
    echo "\n" . system(command)
  else
    echo 'Aborted'
  endif
endfunction

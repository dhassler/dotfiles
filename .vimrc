""" basic settings first:
source $HOME/.vim/settings/basic.vim

""" load plugins via vim-plug
source $HOME/.vim/vim-plug.vim

""" and now, my own settings and mappings:

source $HOME/.vim/settings/colors.vim       " color settings
source $HOME/.vim/settings/editing.vim      " movement and editing
source $HOME/.vim/settings/statusline.vim   " custom statusline
source $HOME/.vim/settings/plugins.vim      " plugin settings
source $HOME/.vim/settings/autocommands.vim " autocommands
source $HOME/.vim/settings/misc.vim         " miscellaneous additional customizations

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  res 5
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile wrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

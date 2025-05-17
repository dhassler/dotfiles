""" plugin-specific settings

""" NERDTree

" auto-change CWD when changing tree root
let NERDTreeChDirMode=2
command -n=? -complete=dir NT NERDTreeToggle <args>

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '^tags$']
let NERDTreeDirArrows=1

if has("gui_running")
  nnoremap <D-r> :NERDTreeToggle<CR>
  " 'reveal in project' a la textmate:
  " nnoremap <D-R> :NERDTreeFind<CR>
  " but: open the nerd tree window first, in CWD, so the find doesn't change
  " the tree root.
  nnoremap <D-R> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
else
  map <leader>w :NERDTreeToggle<CR><space>
endif


""" NERDCommenter

" include space in comments
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

if has("gui_running")
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <Esc><plug>NERDCommenterToggle i
else
  map <C-_> <Esc><leader>c<space>
endif


""" unimpaired
" bubble lines:
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


""" Ack
vnoremap <C-a> "hy:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>a :Ack<space>
vmap <leader>a "hy:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>ta :tabnew<CR>:Ack<space>
vmap <leader>ta "hy:tabnew<CR>:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>va :vnew<CR>:Ack<space>
vmap <leader>va "hy:vnew<CR>:Ack "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>


""" surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35  = "#{\r}" " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"  " -
let g:surround_61 = "<%= \r %>" " =


""" tagbar
map <silent> <Leader>tb :TagbarOpen<CR>
map <Leader>t :TagbarToggle<CR>
if has("gui_running")
  map <D-e> :TagbarToggle<CR><C-w>l
endif


""" gist
" post gists privately by default
" let g:gist_private = 1
" show private gists by default
let g:gist_show_privates = 1


""" copy-as-rtf/TOhtml
" tell TOhtml to disable line numbering when generating HTML
let g:html_number_lines=0
" and to use a reasonable font
let g:html_font="Menlo"


""" gist
if executable("pbcopy")
  " The copy command
  let g:gist_clip_command = 'pbcopy'
elseif executable("xclip")
  " The copy command
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable("putclip")
  " The copy command
  let g:gist_clip_command = 'putclip'
end

" detect filetype if vim failed auto-detection.
let g:gist_detect_filetype = 1


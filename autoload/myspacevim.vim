function! myspacevim#after() abort
  " ****** ALE *********
  let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier' ],
  \ 'typescript': ['prettier'],
  \ 'typescript.tsx': ['prettier'],
  \ 'json': ['prettier'],
  \ 'css': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'scss.liquid': ['prettier'],
  \ 'elixir': ['mix_format']
  \ }
  let g:ale_fix_on_save = 1
  " let g:ale_open_list = 1
  let g:ale_set_quickfix = 1
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_pattern_options = {
  \ 'node_modules': {'ale_linters': [], 'ale_fixers': []}
  \}
  " If you configure g:ale_pattern_options outside of vimrc, you need this.
  let g:ale_pattern_options_enabled = 1

  let NERDTreeShowHidden = 1

  augroup SyntaxSettings
      autocmd!
      autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  augroup END
endfunction


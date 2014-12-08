let s:save_cpo = &cpo
set cpo&vim



let s:unite_source = {
      \ 'name': 'vaxe',
      \ 'hooks': {},
      \ 'action_table': {'*': {}},
      \ }


let s:vaxe_commands = {
      \ 'open_hxml': 'call vaxe#OpenHxml()',
      \ 'ctags': 'call vaxe#Ctags()',
      \ 'auto_import': 'call vaxe#ImportClass()',
      \ 'project_hxml': 'call vaxe#ProjectHxml()',
      \ 'jump_to_def': 'call vaxe#JumpToDefinition()',
      \ }

function! s:get_vaxe_commands(k)
  return s:vaxe_commands[a:k]
endfunction


function! s:unite_source.gather_candidates(args, context)
  let vaxe_commands = [
        \ 'open_hxml',
        \ 'ctags',
        \ 'auto_import',
        \ 'project_hxml',
        \ 'jump_to_def',
        \ ]

  " "action__type" is necessary to avoid being added into cmdline-history.
  return map(vaxe_commands, '{
        \ "word": v:val,
        \ "source": "vaxe",
        \ "kind": ["command"],
        \ "action__command": s:get_vaxe_commands(v:val),
        \ }')
endfunction


function! unite#sources#vaxe#define()
  return s:unite_source
endfunction




let &cpo = s:save_cpo
unlet s:save_cpo

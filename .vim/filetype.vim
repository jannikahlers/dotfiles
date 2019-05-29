" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile */ucs-test*/*/[0-9][0-9]*
                        \  if getline(1) =~ '^#!/usr/share/ucs-test/runner python' |
                        \    setfiletype python |
                        \  elseif getline(1) =~ '^#!/usr/share/ucs-test/runner /usr/share/ucs-test/selenium' |
                        \    setfiletype python |
                        \  elseif getline(1) =~ '^#!/usr/share/ucs-test/runner bash' |
                        \    setfiletype sh |
                        \  endif
  au! BufRead,BufNewFile *.univention-config-registry setfiletype ucsucr
  au! BufRead,BufNewFile *.univention-config-registry-variables setfiletype dosini
  au! BufRead,BufNewFile *.univention-config-registry-categories setfiletype dosini
  au! BufRead,BufNewFile *.schema setfiletype ldap_schema
  au! BufRead,BufNewFile /etc/ldap/schema/* setfiletype ldap_schema
  au! BufRead,BufNewFile /var/log/univention/test_* setfiletype ucstest
  au! BufRead,BufNewFile *.nasl setfiletype nasl
augroup END

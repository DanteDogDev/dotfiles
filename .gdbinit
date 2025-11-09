set debuginfod enabled on
set tui active-border-mode half

set auto-load safe-path /

set history save on
set pagination off
set confirm off

# Printing
set print pretty on
set print object on
set print static-members on

python
import sys
sys.path.insert(0, '/usr/share/gcc-15/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end

#!/bin/bash

function go {
  ps1_escaped=$(printf "%q" "${PS1_SIMPLE}")
  ssh -t root@$1 bash -ic "source /etc/bash.bashrc &> /dev/null
  export ps1_ip=\"\$(ifconfig | grep inet | grep -v 'inet6 fe80\|inet6 ::1\|inet 127.0.0.1' | head -1 | cut -d'n' -f2 | cut -d ' ' -f2 | cut -d':' -f2)\"
  export ps1_reverse=\"\$(dig -x \${ps1_ip} +short)\"
  export ps1_tty=\"\$(tty | cut -d '/'  -f 3-)\"
  if [[ \$ps1_reverse != '' ]]; then
    export ps1_reverse=\" (\${ps1_reverse})\"
  fi
  bash --rcfile <(cat /root/.bashrc; echo export PS1=\'${ps1_escaped}\'; echo \"alias penable='puppet agent --enable'\"; echo \"alias pdisable='puppet agent --disable'\"; echo \"alias pnoop='puppet agent --test --noop'\"; echo \"alias nine-nmv-updateall='for i in \\\$(nine-manage-vhosts virtual-host list | grep -B1 \\\"===\\\" | grep \\\"\\\\.\\\"); do nine-manage-vhosts virtual-host update \\\$i --no-notify-services; done; nine-manage-vhosts webserver reload'\")"
}



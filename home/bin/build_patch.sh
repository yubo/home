#!/bin/sh
path=`pwd`
cd /root/src/linux-2.6.32-220.23.1.el6.xiaomi.x86_64 && \
rm -rf /root/src/dsnat/linux-2.6.32-220.23.1.el6.x86_64/* && \
cat /root/src/dsnat/.list | xargs tar cf - | tar xf - -C /root/src/dsnat/linux-2.6.32-220.23.1.el6.x86_64 && \
cd /root/src/dsnat && \
diff -uprN linux-2.6.32-220.23.1.el6.x86_64.bak/ linux-2.6.32-220.23.1.el6.x86_64 > $path/lvs-2.6.32-220.23.1.el6.xiaomi.noconfig.patch


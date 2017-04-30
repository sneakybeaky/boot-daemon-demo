#!/bin/sh
chown daemon-demo:daemon-demo /opt/local/daemon-demo/log

cat <<- EOF > /etc/systemd/system/daemon-demo.service
    [Unit]
    Description=Spring boot daemon demo
    After=syslog.target

    [Service]
    User=daemon-demo
    ExecStart=/opt/local/daemon-demo/bin/daemon-demo.jar
    SuccessExitStatus=143

    [Install]
    WantedBy=multi-user.target
EOF

systemctl enable daemon-demo.service
systemctl start daemon-demo.service
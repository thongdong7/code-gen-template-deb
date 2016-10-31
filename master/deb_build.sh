#!/usr/bin/env bash

{{ generated_file_note }}

set -e

rm ../{{package}}_{{version}}-1_all.deb || true

dpkg-buildpackage -us -uc

sudo apt-get remove -y {{package}} || true
sudo dpkg -i ../{{package}}_{{version}}-1_all.deb

test -x /opt/venvs/{{package}}/bin/{{packageService}}
/opt/venvs/{{package}}/bin/pip list

#echo Expect service script exists
#sudo test -x /lib/systemd/system/{{package}}.service

echo Done

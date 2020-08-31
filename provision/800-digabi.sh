#!/bin/sh

set -e

echo "I: Add key for dos-repository"
apt-key add - <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQINBFGd+iwBEADafhGwtg46hhNa1o0QGQb0B3V805GwS5K/7enLqca2QPRAR7vm
gYexCLU1+LUupSATdeT3JdB/r0VY0dc+S08Gy75Bc9elSn5kW2xuI7McuRj1IzeJ
LfmctKd1FDEDZdJfYNM/VEKTNdQJm4k3d1NJL23xF/bjbNc4u4sV/RvgKHhto6gP
ZrUfqu3/oYwfzBi9Hr76qJujsD7zhW9NuewUKlME5TxhxxWhQ+Ai0ERCwIShI22j
3Q6Z+38uuRNWCAiCjReUF/GskaUEXgFVpT9vYNYvh8a39F8uwzwM0UXasEI7t/cM
vY73vP35A3HOnxl+Kl6Cmbp6BzYTsGjz1E4NzGytOWJXjB59VtCowWlFKR+JYSbm
u9zqx1tyP7OprzhoM9xffLF3dy3yaIe227M0nxwktT1KBvuBgHsBnHnPVfkxESVl
dW8qS5QLAoqvZDGfxxrUy0F6wZ9BpIZY6cgjuV4SM5H/oHeEaFUd6BG47yWqMwrk
Wwgf0bzczNqxg97+dPsvHEbJ3NZghPAscZnEbj0G59o7Gp/JMs4O4KR5QJP2i4oF
AjzOMhuPlI1IipsLAeIRRXQop9Zt3Bos9ez0i+t261pOcJd4baGx+bmI3+hkGXPQ
yfZoQ4EBZndwoqK/koQVoXCz/2YdKg1IMN9xlpSqjeNvikVKMHPSKNfYhQARAQAB
tGhZbGlvcHBpbGFzdHV0a2ludG9sYXV0YWt1bnRhIC8gRGlnYWJpIChTaWduaW5n
IGtleSBmb3IgRGlnYWJpIHJlcG9zaXRvcnkpIDxkaWdhYmlAeWxpb3BwaWxhc3R1
dGtpbnRvLmZpPokCPgQTAQIAKAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AF
AldL3jUFCRh55wMACgkQIPFHBp09Bu7Luw//cW/Kqx3HLFWhTWoHuPnE1OYtNAOU
PaozK7UF+Uerazm6T1de5sELls/H8xU+g4Qx91otyjkf6Y+nft8icmvV4cySmbSd
yJfu53TKyNylud0d2FUG6zMb7NhkBniUY+l35AKhiYfFCAZ3B3NlVHGMiVxuRqL6
NSHwlvfQ0GKn9xt+2piMLqdtO1xJ9m+zeF0rvFWndS5YXlIMC6SE4p7UezN2LI74
aqmtvaUvmD0JwCV5l4PUY4mVvT9sR75LfjJwTBN2dbTe2CDDosIXv0KQaXeINyyO
hHsDyBxD17UD7j7SCELqkjy/lIYLojCBdWv3vJEbxrrTy5UJN50wJVOPhkR9hiif
+3fI0NAFQHckuNlkA+quziSBom2G8rIqluN9/avvWFAHe1CwYqe6bDv1ZNqd1fwx
K7woYZUM1EEH9hg0NWE1QcKMHc+36/5sXThe435CEOzTHa98CHclK8zkMqVVfRJN
rdiXxYlwLekXrm8JMTdT7YcF0ZLMkEg1sjehOpo2hO0e6gUzNcg/tQe+Qjzy3n8H
Pz8tIe319Wy1C1C9ewS374Y8zDPjEP6KCQCxEhiThzHblr2SqEFuu94Mmc8VDHB/
V4Tppvy96UF5ZfIhyj3zbADQV1v42lEhFMp6GUnd9hIIXPojDFEGEGvnYjM7v40H
PbUzCM99E0WbMRO5Ag0EUZ36LAEQAM9TlBrgf5RHCluIjyLZx8hlxYBShco0OjlY
RwdtZKh/XwHxlarxey1lS80qrLyyn+b71yw3w9NeMaUDdl7r5jfCZfOt5OoeXZyv
jNXQ4IrGrnU1m13tI7TuPIGEwnga3j9t7Q+cV+ZHTfcdZ+c36RJNLvp3kGbsSHzJ
5/ReLnMm2/oh4aaaopNlfXt51KWB3Ua8F2cRBX7zhFsNyhnghtWdYJQ0cUxTyj2E
opeKH7YBWk+/bFqO0MVZZhRcdmOuT01uaLb0hQPMG5oImwDH+QOyeHdjtWp8DU4v
3oGy9a6ek4Cr/rvCxGhOWX4huRJ3e0wrCOMT3ws9LULtdPjiyJ+xwVYxhqP8YEH1
tEQlS/gHkcW8eO7BXULMt0FufO9gQsuikyzBNhMi02K4XeikppMGy4HQ4pDDyiHP
uFgN8z/Sp+8/9yuo7fOO7xTt/11++TNXT5Cx4YFCsQGIQuW1Et8NPk3TTuuEOGQY
+PnO2asUhUfYAVsgJtytc2vk+t8OTQAocMf9FY4g+VXjiF/S2w2sDGZJwo+WVA6n
Fj78Z1GyVdeAg5kdqNDGNqKgYLDnPfnIQ6doMRdJRIoJoe3MuFrYu9fSv25QFnfG
31NEIpnRiEflZBrVq+p1uurwX4Ps7xMkzkBweQ3v+HpMLxElKWQ9C14HY2Rz3TmC
rw/3EWZlABEBAAGJAiUEGAECAA8CGwwFAlOIPekFCQWsqrsACgkQIPFHBp09Bu5t
Zw/+KQaqz/qVMpnXfbTkeYkErmqgy0CVMhPwmZRbV0Ov2VtvonGwvZq6nhlDfDW2
LwT5iiuTmYC0+zP1cqGRZb5ncHiWKZOWXJ2lhaIHt6xscTqLSfX+1Gk6DttPRVGJ
mDUES5TkE2qOHsMURNaFS1aL/ZXQ12qK3Aluny7vSwEmGiziuUsJ41/6XKPpJ3Wl
OjivroZukSZAK2+PKzJ9u31RALutekrf+LcyqrzYMQq7iY8xYR2lz7N4r/qkl3N+
HPflpvv4vUZZ7KwbiJPG/EnWrLdmaVGOJkfKY3oKd3l57ws/c6fiR+fWXGRJnErs
fOhIo7Iq6BQMB6IizW/FhvOxo9z0CflJx2XTPXReeVOcBhssOVlAkcYRpYQvadnE
ZAK8aR7KJV5cKY43Lmfx4fm7JVqqN1Cc45iixTHJp7aVaSU3DRM3jRrGRmtZgJ73
4/Wj1D811s8NmWW8PEFrpHMBsprIK6RqxvJl2btL7Fi/Tct0ZLHjwKQ4Gn1YCArS
ZJvzmWztq9119z2DDYU+8fbSU73+qGAZbI3WazetUta7cKx4HUPEWgcxqGkBJJ7i
XyIpnMZ52oXRsu3HZRhpS9wYWnWsVMrueiGswD3uolRwNnNyp1bqs4O0PK1nWTNe
xTdSJOxqD0SEOfFMS3bSDVZNDc14XJFLP6h8zxD16T/Y1bE=
=Nxg9
-----END PGP PUBLIC KEY BLOCK-----
EOF


export DEBIAN_FRONTEND="noninteractive"

echo "I: Set kernel.unprivileged_userns_clone sysctl to 1 for Google Chrome"
echo "kernel.unprivileged_userns_clone = 1" >> /etc/sysctl.d/81-enable-chrome-sandbox.conf

echo "I: Increase max amount of open files from default 10k"
echo "fs.file-max = 64000" >> /etc/sysctl.d/80-digabi-files.conf

echo "I: Set system timezone to Europe/Helsinki"
timedatectl set-timezone Europe/Helsinki

echo "I: Install Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
cat >/etc/apt/sources.list.d/chrome.list <<EOF
deb http://dl.google.com/linux/chrome/deb/ stable main
EOF

echo "I: Add stretch-backports repository to sources"
cat >/etc/apt/sources.list.d/stretch-backports.list <<EOF
deb http://deb.debian.org/debian stretch-backports main
EOF

apt-get update

apt-get -y -o "Acquire::http::Pipeline-Depth=10" install ruby-dev zip nginx libpq-dev google-chrome-stable libnss3-tools git rsync curl unzip ruby parallel uuid-runtime netcat-traditional locales postgresql-9.6 postgresql-contrib-9.6 texlive-base texlive-latex-base texlive-lang-european texlive-fonts-recommended texlive-fonts-extra texlive-latex-recommended texlive-latex-extra latexmk net-tools icu-devtools libgconf-2-4 tmux jq gnupg libxss1
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | sudo -u vagrant bash
sudo -u vagrant /bin/bash -c ". ~/.nvm/nvm.sh; for v in 8.11.3 10.17.0 12.4.0 12.6.0 12.7.0 12.8.0 12.14.0; do nvm install \$v; nvm exec \$v npm install -g yarn; done; nvm alias default 8"

echo "I: Install Go >= 1.11 from backports for Go NSA server"
apt-get -y install -t stretch-backports golang

echo "I: Install finnish & us utf-8 locales.."
sed -i -e '/fi_FI.UTF-8/s/# //' -e '/en_US.UTF-8/s/# //' /etc/locale.gen
echo 'LANG=en_US.UTF-8' > /etc/default/locale
locale-gen

echo "I: Configure postgresql.."
su postgres -c "createuser -d vagrant" || true
su postgres -c  "psql -c 'alter user vagrant with superuser;'"
sed -i.bak '/127.0.0.1\|::1\/128/s/md5/trust/' /etc/postgresql/9.6/main/pg_hba.conf
echo "TimeZone = 'Europe/Helsinki'" >> /etc/postgresql/9.6/main/postgresql.conf
rm -f /etc/postgresql/9.6/main/pg_hba.conf.bak
service postgresql restart


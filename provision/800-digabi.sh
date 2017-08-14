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

echo "I: Add PostgreSQL Apt Repository"

apt-key add - <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

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
IIP9up4xwgje9LB7fMxsSkCDTHOk
=s3DI
-----END PGP PUBLIC KEY BLOCK-----
EOF

cat >/etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main
EOF

export DEBIAN_FRONTEND="noninteractive"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
cat >/etc/apt/sources.list.d/chrome.list <<EOF
deb http://dl.google.com/linux/chrome/deb/ unstable main
EOF

apt-get update

apt-get -y -o "Acquire::http::Pipeline-Depth=10" install ruby-dev zip npm nodejs nginx libpq-dev google-chrome-unstable libnss3-tools git rsync curl unzip ruby parallel uuid-runtime netcat-traditional vlc locales postgresql-9.5 postgresql-contrib-9.5 texlive-base texlive-latex-base latexmk net-tools
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | sudo -u vagrant bash
sudo -u vagrant /bin/bash -c ". ~/.nvm/nvm.sh; nvm install 6.11.1 ; nvm install 8.3.0 ; nvm install --lts 6.9.1"

sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

echo "I: Install finnish locale.."
sed -i.bak -e '/fi_FI.UTF-8/s/# //' /etc/locale.gen
locale-gen

echo "I: Configure postgresql.."
su postgres -c "createuser -d vagrant" || true
sed -i.bak '/127.0.0.1\|::1\/128/s/md5/trust/' /etc/postgresql/9.5/main/pg_hba.conf
service postgresql restart

echo "I: Upgrade npm"
npm install -g npm@^2.14.1

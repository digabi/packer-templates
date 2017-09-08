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

echo "I: Add Yarn Apt Repository"

apt-key add - <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
Vhzuyn3GTtg1w/T6CaYVXBjcHFk=
=HsHU
-----END PGP PUBLIC KEY BLOCK-----
EOF

cat >/etc/apt/sources.list.d/yarn.list <<EOF
deb http://dl.yarnpkg.com/debian/ stable main
EOF


export DEBIAN_FRONTEND="noninteractive"

echo "I: Set kernel.unprivileged_userns_clone sysctl to 1 for Google Chrome"
echo "kernel.unprivileged_userns_clone = 1" >> /etc/sysctl.conf

echo "I: Install Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
cat >/etc/apt/sources.list.d/chrome.list <<EOF
deb http://dl.google.com/linux/chrome/deb/ stable main
EOF

apt-get update

apt-get -y -o "Acquire::http::Pipeline-Depth=10" install ruby-dev zip nginx libpq-dev google-chrome-unstable libnss3-tools git rsync curl unzip ruby parallel uuid-runtime netcat-traditional vlc locales postgresql-9.5 postgresql-contrib-9.5 texlive-base texlive-latex-base latexmk net-tools yarn=1.0.1
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | sudo -u vagrant bash
sudo -u vagrant /bin/bash -c ". ~/.nvm/nvm.sh; nvm install 6.11.1 ; nvm install 8.3.0 ; nvm install --lts 6.9.1"

sudo -u vagrant /bin/bash -c 'find ${HOME}/.nvm -name npm -type l | while read -r path ; do mv  -v "${path}" "${path}.digabi-real"; done'

cat > /usr/local/bin/npm<<'EOF'
#!/bin/bash

if ! which npm.digabi-real
then
    echo "WARNING: npm.digabi-real not found, should be under .nvm" 1>&2
    echo "         Ignoring command $@"
    exit 0
fi

case "$@" in
    start*)
        npm.digabi-real "$@"
        exit $?
        ;;
esac

for retry in $(seq 5)
do
    start_time=$(date +%s)
    timeout -k 2 300 npm.digabi-real "$@"
    status=$?
    end_time=$(date +%s)
    npm_printf=$(echo "$@" | sed s/%/%%/g)
    printf "%(%T)T npm ${npm_printf} \033[34mexecution took $(expr ${end_time} - ${start_time}) seconds\033[0m\n"

    [ ${status} -eq 0 ] && break

    if [ ${status} -ge 124 ]
    then
        printf "%(%T)T npm ${npm_printf} \033[34mtimed out after five minutes\033[0m"
    else
        printf "%(%T)T npm ${npm_printf} \033[31mfailed\033[0m"
    fi

    if [ ${retry} -lt 5 ]
    then
        case "$@" in
            install*)
                echo " - retry after removing node_modules (${retry})"
                rm -rf node_modules
            ;;
            *)
                echo " - retry (${retry})"
        esac
        sleep 1
    else
        echo " - giving up after ${retry} tries"
        exit 1
    fi
done

EOF

chmod +x /usr/local/bin/npm

echo "I: Install finnish locale.."
sed -i.bak -e '/fi_FI.UTF-8/s/# //' /etc/locale.gen
locale-gen

echo "I: Configure postgresql.."
su postgres -c "createuser -d vagrant" || true
sed -i.bak '/127.0.0.1\|::1\/128/s/md5/trust/' /etc/postgresql/9.5/main/pg_hba.conf
service postgresql restart


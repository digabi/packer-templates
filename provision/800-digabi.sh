#!/bin/sh

set -e


echo "I: Add Digabi repository signing key..."
TEMPFILE="$(mktemp)"

cat > ${TEMPFILE} <<EOF
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
dGtpbnRvLmZpPokCHAQQAQIABgUCUZ4LogAKCRA+6Ty1EcY0/ZR9D/429wabEhT7
qOM4GWBJqeiROzv738PHPWKAx0Iz1W6tapZjyMwmhIP4ieQ+KRmDwRaoLNxpaKgm
Ap6v1dR+dQJ1qCk6Hn3zFn49QAYk7/QRcfCe3kBo+pt9L5KoiuMujefsVqrWLKRF
nd8BIo3WSougaCiLCDmpBkmeCS+yAxRdymj/9Bol76j579Ka6MG9U3Osyr/5dI32
3DHHdnDAM4lVPT/XXPAVhsys0lMKQBA9Zmky61E35YSc/t4pkVhipbITS36jQHaF
ALGypS4hH/XfdR/WaQuUHPLhuiooEuAOiZYbOGC9Kh182/uMOI26ZMBetM8VJKqz
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
1TrxR7qjngY2cT8AICLQ+iWGl1f1YL6yW79Ztj0=
=d66t
-----END PGP PUBLIC KEY BLOCK-----
EOF

apt-key add ${TEMPFILE}
rm ${TEMPFILE}

cat >/etc/apt/sources.list.d/digabi.list << EOF
deb http://192.168.2.49/digabi jessie main contrib non-free
EOF

echo "I: Add PostgreSQL Apt Repository"

cat >${TEMPFILE}<<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

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
IIP9up4xwgje9LB7fMxsSkCDTHOk
=s3DI
-----END PGP PUBLIC KEY BLOCK-----
EOF

apt-key add ${TEMPFILE}
rm ${TEMPFILE}

cat >/etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main
EOF

export DEBIAN_FRONTEND="noninteractive"

apt-get update

apt-get -y -o "Acquire::http::Pipeline-Depth=10" install digabi-dev ruby-dev zip npm nodejs nginx libpq-dev libnss3-tools git rsync curl unzip ruby parallel uuid-runtime netcat-traditional vlc postgresql-9.5 postgresql-contrib-9.5
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | sudo -u vagrant bash
sudo -u vagrant /bin/bash -c ". ~/.nvm/nvm.sh; nvm install 4.2.1"

echo "I: Configure postgresql.."
su postgres -c "createuser -d vagrant" || true
sed -i.bak '/127.0.0.1\|::1\/128/s/md5/trust/' /etc/postgresql/9.5/main/pg_hba.conf
service postgresql restart


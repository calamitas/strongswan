docker build -t strongswan --build-arg UID=`id -u` .
docker network create --ipv6 --subnet=fc31:0:0:2::/64 strongswan

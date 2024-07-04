docker build --no-cache -t jayachandraoggy/speedu:0.1 .

docker run -d \
  --name=speedu \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TRANSMISSION_WEB_HOME= `#optional` \
  -e USER=transmission \
  -e PASS=transmission \
  -e WHITELIST= `#optional` \
  -e PEERPORT= `#optional` \
  -e HOST_WHITELIST= `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v ./config:/transmission/config \
  -v ./downloads:/downloads \
  -v ./watch:/watch \
  --restart unless-stopped \
  jayachandraoggy/speedu:0.1

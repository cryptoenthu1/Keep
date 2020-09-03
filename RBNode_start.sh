source ~/.bash_profile
sudo docker run -dit \
--restart always \
--volume $HOME/keep-client:/mnt \
--env KEEP_ETHEREUM_PASSWORD=$KEEP_CLIENT_ETHEREUM_PASSWORD \
--env LOG_LEVEL=info \
--name keep-client \
-p 3919:3919 \
keepnetwork/keep-client:v1.3.0-rc.3 --config /mnt/config/config.toml start

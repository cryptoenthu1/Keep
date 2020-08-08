#Requesting the Input values
echo "================================================================================================================================"
echo "As mentioned Please have YOUR SERVER IP, INFURA PROJECT ID, ETH ADDRESS, ETH WALLET PASSWORD handy"
echo "================================================================================================================================"
echo "Start entering values one by one as system keeps ask"
echo "================================================================================================================================"

read -p "Enter Your Server IP : " server
read -p "Enter Your Infura Id : " infura
read -p "Enter Your Etherium Wallet Address : " eth
read -p "Enter Your Etherium Wallet Passwd : " passwd

echo 'export SERVER_IP='$server'' >> ~/.bash_profile
source ~/.bash_profile
echo 'export INFURA_PROJECT_ID='$infura'' >> ~/.bash_profile
source ~/.bash_profile
echo 'export ETH_WALLET='$eth'' >> ~/.bash_profile
source ~/.bash_profile
echo 'export KEEP_CLIENT_ETHEREUM_PASSWORD='$passwd'' >> ~/.bash_profile
source ~/.bash_profile

source ~/.bash_profile

#Setup the firewall rules
sudo ufw allow 22/tcp
sleep 1
sudo ufw allow 3919/tcp
sleep 1
yes | sudo ufw enable
sleep 1

#Install docker
sudo apt-get update
sleep 5
sudo apt-get remove docker docker-engine docker.io
sleep 5
sudo apt install docker.io curl -y
sleep 5
sudo systemctl start docker
sleep 1
sudo systemctl enable docker
sleep 1

#Create directories and export environment variables
mkdir -p $HOME/keep-client/config
mkdir -p $HOME/keep-client/keystore
mkdir -p $HOME/keep-client/persistence

source ~/.bash_profile

#Writing  $HOME/keep-client/config/config.toml file
echo '# Ethereum host connection info.' >> $HOME/keep-client/config/config.toml
echo '[ethereum]' >> $HOME/keep-client/config/config.toml
echo ' URL = "wss://ropsten.infura.io/ws/v3/'$INFURA_PROJECT_ID'"' >> $HOME/keep-client/config/config.toml
echo ' URLRPC = "https://ropsten.infura.io/v3/'$INFURA_PROJECT_ID'"' >> $HOME/keep-client/config/config.toml
echo '# Keep operator Ethereum account.' >> $HOME/keep-client/config/config.toml
echo '[ethereum.account]' >> $HOME/keep-client/config/config.toml
echo ' Address = "'$ETH_WALLET'"' >> $HOME/keep-client/config/config.toml
echo ' KeyFile = "/mnt/keystore/keep_wallet.json"' >> $HOME/keep-client/config/config.toml
echo '# Keep contract addresses configuration.' >> $HOME/keep-client/config/config.toml
echo '[ethereum.ContractAddresses]' >> $HOME/keep-client/config/config.toml
echo ' KeepRandomBeaconOperator = "0xf417b31104631280adF9F6828ee19985BC299fdC"' >> $HOME/keep-client/config/config.toml
echo ' TokenStaking = "0x8117632eC1D514550b3880Bc68F9AC1A76c9C67B"' >> $HOME/keep-client/config/config.toml
echo ' KeepRandomBeaconService = "0xd83248e311DC2Ba0d2A051e86f0678d8857f6ADD"' >> $HOME/keep-client/config/config.toml
echo '# Keep network configuration.' >> $HOME/keep-client/config/config.toml
echo '[LibP2P]' >> $HOME/keep-client/config/config.toml
echo ' Peers = ["/dns4/bootstrap-1.core.keep.test.boar.network/tcp/3001/ipfs/16Uiu2HAkuTUKNh6HkfvWBEkftZbqZHPHi3Kak5ZUygAxvsdQ2UgG",
"/dns4/bootstrap-2.core.keep.test.boar.network/tcp/3001/ipfs/16Uiu2HAmQirGruZBvtbLHr5SDebsYGcq6Djw7ijF3gnkqsdQs3wK","/dns4/bootstrap-3.test.keep.network/tcp/3919/ipfs/16Uiu2HAm8KJX32kr3eYUhDuzwTucSfAfspnjnXNf9veVhB12t6Vf",
"/dns4/bootstrap-2.test.keep.network/tcp/3919/ipfs/16Uiu2HAmNNuCp45z5bgB8KiTHv1vHTNAVbBgxxtTFGAndageo9Dp"]' >> $HOME/keep-client/config/config.toml
echo ' Port = 3919' >> $HOME/keep-client/config/config.toml
echo ' # Override the node’s default addresses announced in the network' >> $HOME/keep-client/config/config.toml
echo ' AnnouncedAddresses = ["/ip4/'$SERVER_IP'/tcp/3919"]' >> $HOME/keep-client/config/config.toml
echo '# Storage is encrypted' >> $HOME/keep-client/config/config.toml
echo '[Storage]' >> $HOME/keep-client/config/config.toml
echo ' DataDir = "/mnt/persistence"' >> $HOME/keep-client/config/config.toml

source ~/.bash_profile

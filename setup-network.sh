# Create the channel
docker exec -e "CORE_PEER_ID=cli" cli peer channel create -o orderer.vt.com:7050 -c vt-channel -f /etc/hyperledger/configtx/channel.tx
sleep 3
# Join peer0.manufacturer.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block

# Join peer0.owner.vt.com to the channel.

docker exec -e "CORE_PEER_LOCALMSPID=OwnerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/owner.vt.com/users/Admin@owner.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.owner.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block

# Join peer0.supplier.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=SupplierMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/supplier.vt.com/users/Admin@supplier.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.supplier.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block

# Join peer0.dealer.vt.com to the channel.

docker exec -e "CORE_PEER_LOCALMSPID=DealerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/dealer.vt.com/users/Admin@dealer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.dealer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block

# Join peer0.regulator.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=RegulatorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/regulator.vt.com/users/Admin@regulator.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.regulator.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block

# Join peer0.scrapper.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=ScrapperMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/scrapper.vt.com/users/Admin@scrapper.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.scrapper.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b vt-channel.block



sleep 3

# Install chaincode to peer0.manufacturer.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/

# Install chaincode to peer0.owner.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=OwnerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/owner.vt.com/users/Admin@owner.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.owner.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/


# Install chaincode to peer0.supplier.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=SupplierMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/supplier.vt.com/users/Admin@supplier.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.supplier.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/

# Install chaincode to peer0.dealer.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=DealerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/dealer.vt.com/users/Admin@dealer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.dealer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/

# Install chaincode to peer0.regulator.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=RegulatorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/regulator.vt.com/users/Admin@regulator.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.regulator.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/

# Install chaincode to peer0.scrapper.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=ScrapperMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/scrapper.vt.com/users/Admin@scrapper.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.scrapper.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n vt-network -v 1.0 -l golang -p supply/go/



sleep 3
# Instantiate and initialize chaincode to peer0.manufacturer.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

# Instantiate and initialize chaincode to peer0.owner.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=OwnerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/owner.vt.com/users/Admin@owner.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.owner.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

# Instantiate and initialize chaincode to peer0.supplier.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=SupplierMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/supplier.vt.com/users/Admin@supplier.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.supplier.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

# Instantiate and initialize chaincode to peer0.dealer.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=DealerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/dealer.vt.com/users/Admin@dealer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.dealer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

# Instantiate and initialize chaincode to peer0.regulator.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=RegulatorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/regulator.vt.com/users/Admin@regulator.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.regulator.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

# Instantiate and initialize chaincode to peer0.scrapper.vt.com
docker exec -e "CORE_PEER_LOCALMSPID=ScrapperMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/supply/hyperledger/fabric/peer/crypto/peerOrganizations/scrapper.vt.com/users/Admin@scrapper.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.scrapper.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.vt.com:7050 -C vt-channel -n vt-network -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','OwnerMSP.member','SupplierMSP.member','DealerMSP.member','RegulatorMSP.member','ScrapperMSP.member')"

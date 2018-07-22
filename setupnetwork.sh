# Create the channel
docker exec -e "CORE_PEER_ID=cli" cli peer channel create -o orderer.vt.com: -c supplychannel -f /etc/hyperledger/configtx/channel.tx
sleep 3
# Join peer0.manufacturer.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b supplychannel.block

# Join peer0.manufacturer.vt.com to the channel.

docker exec -e "CORE_PEER_LOCALMSPID=AnchorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/anchor.veefin.com/users/Admin@anchor.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.anchor.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b supplychannel.block

# Join peer0.manufacturer.vt.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=SellerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/seller.veefin.com/users/Admin@seller.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.seller.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer channel join -b supplychannel.block


# Install chaincode to peer0.manufacturer.vt.com
sleep 3
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n supply-network -v 5.14 -l golang -p supply/go/

# Install chaincode to peer0.Anchor.veefin.com

docker exec -e "CORE_PEER_LOCALMSPID=AnchorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/anchor.veefin.com/users/Admin@anchor.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.anchor.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n supply-network -v 5.14 -l golang -p supply/go/

# Install chaincode to peer0.Seller.veefin.com
docker exec -e "CORE_PEER_LOCALMSPID=SellerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/seller.veefin.com/users/Admin@seller.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.seller.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode install -n supply-network -v 5.14 -l golang -p supply/go/

sleep 3
# Instantiate and initialize chaincode
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.vt.com/users/Admin@manufacturer.vt.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.vt.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.veefin.com: -C supplychannel -n supply-network -l golang -v 5.14 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','AnchorMSP.member','SellerMSP.member')"

docker exec -e "CORE_PEER_LOCALMSPID=AnchorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/anchor.veefin.com/users/Admin@anchor.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.anchor.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.veefin.com: -C supplychannel -n supply-network -l golang -v 5.14 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','AnchorMSP.member','SellerMSP.member')"

docker exec -e "CORE_PEER_LOCALMSPID=SellerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/veefin/hyperledger/fabric/peer/crypto/peerOrganizations/seller.veefin.com/users/Admin@seller.veefin.com/msp" -e "CORE_PEER_ADDRESS=peer0.seller.veefin.com:7051" -e "CORE_PEER_ID=cli" cli peer chaincode instantiate -o orderer.veefin.com: -C supplychannel -n supply-network -l golang -v 5.14 -c '{"Args":[""]}' -P "OR ('ManufacturerMSP.member','AnchorMSP.member','SellerMSP.member')"

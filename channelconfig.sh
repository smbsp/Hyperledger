./bin/configtxgen -profile SupplyChainVehicleGenesis -outputBlock ./channel-artifacts/genesis.block

./bin/configtxgen -profile SupplyChainVehicleChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID vt-channel

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/OwnerMSPanchors.tx -channelID vt-channel -asOrg OwnerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/ManufacturerMSPanchors.tx -channelID vt-channel -asOrg ManufacturerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/SupplierMSPanchors.tx -channelID vt-channel -asOrg SupplierMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/DealerMSPanchors.tx -channelID vt-channel -asOrg DealerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/RegulatorMSPanchors.tx -channelID vt-channel -asOrg RegulatorMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/ScrapperMSPanchors.tx -channelID vt-channel -asOrg ScrapperMSP

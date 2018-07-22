./bin/configtxgen -profile SupplyChainVehicleGenesis -outputBlock ./channel-artifacts/genesis.block

./bin/configtxgen -profile SupplyChainVehicleChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID supplychannel

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/OwnerMSPanchors.tx -channelID supplychannel -asOrg OwnerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/ManufacturerMSPanchors.tx -channelID supplychannel -asOrg ManufacturerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/TransporterMSPanchors.tx -channelID supplychannel -asOrg TransporterMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/InsurerMSPanchors.tx -channelID supplychannel -asOrg InsurerMSP

./bin/configtxgen -profile SupplyChainVehicleChannel -outputAnchorPeersUpdate ./channel-artifacts/WarehouseMSPanchors.tx -channelID supplychannel -asOrg WarehouseMSP

FROM hyperledger/fabric-orderer:2.3

LABEL  maintainer="Thach Canh Nhut"

#2. Create the folder for configurations
RUN mkdir -p /var/hyperledger/OrdererOrg

ENV FABRIC_CFG_PATH=/var/hyperledger/OrdererOrg

#3. Copy the crypto for orderer
COPY ./config-org/Orderer /var/hyperledger/OrdererOrg

ENV ORDERER_GENERAL_LOCALMSPDIR=/var/hyperledger/OrdererOrg/msp

#4. Copy the genesis file
COPY genesis.block  /var/hyperledger/OrdererOrg

#5. Copy the orderer YAML
COPY ./config-org/Orderer/orderer.yaml /var/hyperledger/OrdererOrg 

CMD ["orderer"]
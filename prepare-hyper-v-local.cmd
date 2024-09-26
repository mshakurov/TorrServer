putty -ssh root@192.168.1.189 -pw qwe123 -m d:\shakurov\source\repos\TorrServer\TorrServer\prepare-hyper-v-local-commands-bef.sh  
pscp -pw qwe123 d:\shakurov\source\repos\TorrServer\TorrServer\torrserver root@192.168.1.189:/root/ts/
pscp -pw qwe123 d:\shakurov\source\repos\TorrServer\TorrServer\torrserver-alpine root@192.168.1.189:/root/ts/
pscp -pw qwe123 d:\shakurov\source\repos\TorrServer\TorrServer\prepare-hyper-v-local-commands-bef.sh root@192.168.1.189:/root/ts/
pscp -pw qwe123 d:\shakurov\source\repos\TorrServer\TorrServer\prepare-hyper-v-local-commands-aft.sh root@192.168.1.189:/root/ts/
pscp -pw qwe123 d:\shakurov\source\repos\TorrServer\TorrServer\prepare-hyper-v-local-start-service.sh root@192.168.1.189:/root/ts/
putty -ssh root@192.168.1.189 -pw qwe123 -m d:\shakurov\source\repos\TorrServer\TorrServer\prepare-hyper-v-local-commands-aft.sh  

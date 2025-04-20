apt-get install nftables -y
systemctl enable --now nftables  
rm -rf /etc/nftables/nftables.nft
cp /home/git/education/nftables_br.nft /etc/nftables/nftables.nft
systemctl restart nftables

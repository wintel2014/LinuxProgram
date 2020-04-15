total=0;for qty in $(cat $1); do let total=$total+$qty; done; echo "Total SELL crossed Orders="$total

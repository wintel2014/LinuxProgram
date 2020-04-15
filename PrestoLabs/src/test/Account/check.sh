total=0;for qty in $(grep vs log | gawk '{print $5}' | gawk -F'@' '{print $1}'); do let total=$total+$qty; done; echo "Total crossed Orders="$total
total=0;for qty in $(grep -v vs log  | gawk '{print $3}'); do let total=$total+$qty; done; echo "Total BUY crossed Orders="$total
total=0;for qty in $(grep -v vs log  | gawk '{print $7}'); do let total=$total+$qty; done; echo "Total SELL crossed Orders="$total

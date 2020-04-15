total=0;for qty in $(grep BUY orders_fully_corss.csv | gawk -F',' '{print $4}'); do let total=$total+$qty; done; echo "Total Buy Orders="$total
total=0;for qty in $(grep SELL orders_fully_corss.csv | gawk -F',' '{print $4}'); do let total=$total+$qty; done; echo "Total Sell Orders="$total

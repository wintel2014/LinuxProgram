BOOST_INSTALL_DIR = /home/jiazi/Desktop/boost/install/include
mpl_vector:ConfigFilter.cpp
	g++ $^ -I$(BOOST_INSTALL_DIR) -std=c++11 -O0 -g3 -o $@
	g++ -E $^ -I$(BOOST_INSTALL_DIR) -std=c++11 -O0 -g3 > $@.txt
	

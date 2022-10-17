#include <thread>
#include <Queue.hpp>
#include <gtest/gtest.h>
#include <ClientOrder.hpp>
int main()
{
	Queue queue(4096);
	QueueReader reader(queue);
	QueueWriter writer(queue);

	
	size_t waitWrite = 0;	
	std::thread W ([&writer, &waitWrite]() {
    			ClientOrder co;
			strncpy(co.mInvestorID, "Trader-Test-1", sizeof(ClientOrder::mInvestorID));
			while (1)
			{
				if ( writer.beginWrite(sizeof(ClientOrder)) )
				{
					writer.writeBuffer(&co, sizeof(co));
					writer.endWrite();
				}
				else
					waitWrite++;
			}
		}
	);

	std::thread R([&reader,  &waitWrite]() {
			while (1)
			{
				const QueueReader::ReadResult data = reader.beginRead();
				if(data.size())
				{
					auto pOrder1 = reinterpret_cast<const ClientOrder*>(data.buffer1);
					printf("%s writeWait=%ld\n", pOrder1->mInvestorID, waitWrite);
					auto pOrder2 = reinterpret_cast<const ClientOrder*>(data.buffer2);
					if(pOrder2)
						printf("buffer2 -- >%s\n", pOrder1->mInvestorID);
				}
				reader.endRead();
			}
		}
	);

	W.join();
	R.join();
}


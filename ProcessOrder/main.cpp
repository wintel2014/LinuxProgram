#include<ProcessOrder.h>
#include<Log.h>
using namespace std;

int main(int argc, char* argv[])
{
    ProcessOrder Stream(argv[1]);
    gMapBase=Stream.GetBase();
    Stream.LoadFile();
    Stream.LinkFile();
    Stream.ParseFile();
    Stream.ShowResult();
#ifdef INTEGRITY_VERIFY
     PrintHeader(gMapBase);
     Log("Header Packed Verify=%d\n",LayoutCheck());
#endif
    return 0;
}

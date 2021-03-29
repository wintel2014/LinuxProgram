#include <map>
#include <memory>
#include <string.h>
#include "macro.hpp"
int test();
extern char* __start_LogTypeSection;
extern char* __start_EVENTSECTION;
EventDesc* const pDesc =reinterpret_cast<EventDesc*>(&__start_EVENTSECTION);

EventDesc& GetDesc(size_t eventID_)
{
  return pDesc[(eventID_ - (size_t)pDesc)>>6];
}
struct LogBuffer
{
  size_t mEventID;
  char buffer[128];
};

struct Deserializer
{
  virtual void ConvertTo(char*dest, char*src) = 0;
};

template <typename T>
struct StructDeserializer;

template <>
struct StructDeserializer<Data> : public Deserializer
{
  void ConvertTo(char*dest, char*src) final
  {
    auto pData = reinterpret_cast<Data*>(src);
    sprintf(dest, "A=%d, B=%lf, C=%ld\n\n", pData->A, pData->B, pData->C);
  }
};

LogBuffer CreateLog()
{
  LogBuffer logRaw;
  CREATE_EVENT(logRaw.mEventID, "DEBUG", "DATA::A is {0};");
  Data d{1,2,3};
  memcpy(&logRaw.buffer, &d, sizeof(Data));
  return logRaw;
}

int main()
{
  static constexpr auto d = custom::Serializer<Data>::tag();
  STORE_STRING_IN_SECTION(toString(d), "LogTypeSection");

  auto addr =  &__start_LogTypeSection;
  printf("%p %p\n", *addr, __start_LogTypeSection);
  std::cout<<*addr<<"\n";

  std::map<size_t, std::unique_ptr<Deserializer>> DeserializersMap;
  auto logRaw = CreateLog();
  DeserializersMap.emplace(logRaw.mEventID, std::make_unique<StructDeserializer<Data>>());
  auto& pCurrent = GetDesc(logRaw.mEventID);
  char outBuf[1024]{0};
  auto size = sprintf(outBuf, "\n%s(%s %s) %ld: %s\n\n", pCurrent.mFile, pCurrent.mFunc, pCurrent.mLevel, pCurrent.mLineNo, pCurrent.mFormat);
  size -= sizeof("{0}\n\n");
  DeserializersMap[logRaw.mEventID]->ConvertTo(outBuf+size, logRaw.buffer); 
  
  std::cout<<outBuf;
  //std::cout<<"\n"<<pCurrent.mFile<<"("<<pCurrent.mFunc<<" "<<pCurrent.mLevel<<") "<<" "<<pCurrent.mLineNo<<":"<<pCurrent.mFormat<<"\n\n";

  long eventID1 = 123;
  long eventID2 = 123;
  CREATE_EVENT(eventID1, "DEBUG", "DATA is {0};");
  CREATE_EVENT(eventID2, "DEBUG", "DATA is {0};");
  printf("%lx %lx %ld\n\n", eventID1, eventID2, eventID2-eventID1);

  std::cout<<GetDesc(eventID1).mFile<<"("<<GetDesc(eventID1).mFunc<<" "<<GetDesc(eventID1).mLevel<<") "<<" "<<GetDesc(eventID1).mLineNo<<":"<<GetDesc(eventID1).mFormat<<"\n";
  std::cout<<GetDesc(eventID2).mFile<<"("<<GetDesc(eventID2).mFunc<<" "<<GetDesc(eventID2).mLevel<<") "<<" "<<GetDesc(eventID2).mLineNo<<":"<<GetDesc(eventID2).mFormat<<"\n";


  test();
  return 0;
}

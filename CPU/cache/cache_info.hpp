namespace FIRST {
    constexpr unsigned CAPACITY  = 32*1024;
    constexpr unsigned LINE_SIZE = 64;
    constexpr unsigned SETS_NUM  = 64;
    constexpr unsigned WAYS_NUM  = 8;
}
namespace MID {
    constexpr unsigned CAPACITY  = 256*1024;
    constexpr unsigned LINE_SIZE = 64;
    constexpr unsigned SETS_NUM  = 1024;
    constexpr unsigned WAYS_NUM  = 4;
}
namespace LLC {
    constexpr unsigned CAPACITY  = 9216*1024;
    constexpr unsigned LINE_SIZE = 64;
    constexpr unsigned SETS_NUM  = 12288;
    constexpr unsigned WAYS_NUM  = 12;
}

//#include <optional>
#include <string>
#include <string_view>
#include <variant>
#include <iostream>

//OrderStatus
struct Idle { inline static constexpr char value = 0; };
struct New { inline static constexpr char value = 1;};
struct NewAck { inline static constexpr char value = 2;}; //Acking  Acked
struct FullFill { inline static constexpr char value = 3;};
struct PartialFill { inline static constexpr char value = 3;};
struct WaitForCross{ inline static constexpr char value = 3;};
struct Cancelled { inline static constexpr char value = 4;};
struct CancelReject { inline static constexpr char value = 4;};
struct Error { inline static constexpr char value = 5;};


struct NewEvent {};
struct CancelEvent{};

using Event_VT = std::variant<NewEvent, CancelEvent>;
using STATE_VT = std::variant<Idle, New, NewAck, FullFill, Cancelled, CancelReject, PartialFill, WaitForCross, Error>;

enum Side {UNKNOWN=0, BUY, SELL};
struct Order
{
    STATE_VT mState {Idle{}};
    Side mSide {Side::UNKNOWN};
    size_t mOriginalQty;
    size_t mFilledQty;

    bool isFullFill()
    {   return mOriginalQty==mFilledQty; }
};

//OrderManager
struct OrderManager {
    STATE_VT operator() (Idle state, const NewEvent e)
    {
        std::cout <<"Recv New order\n";
        //Ack
        //Matching
        //Report
        return PartialFill{};
        
    }

    STATE_VT operator() (PartialFill state, const CancelEvent e)
    {
        std::cout <<"Recv CancelEvent\n";
        return Cancelled{};
    }

    STATE_VT operator() (FullFill state, const CancelEvent e)
    {
        std::cout <<"Recv CancelEvent\n";
        return CancelReject{};
    }

    template <typename State, typename Event>
    STATE_VT operator()(State s, const Event e) const {
        std::cout<<"CurrentState="<<typeid(s).name() << "Event=" << typeid(e).name()<<"\n";
        return Error{};
    }
};

template <typename StateVariant, typename EventVariant, typename OrderManager>
class FSM {
    STATE_VT State; //order->state
public:
    FSM(Order& o) : State(o.mState) {};
    void dispatch(const EventVariant &event) {
            State = std::visit(OrderManager{}, State, event);
            if(State.index() == STATE_VT{Idle{}}.index())
                std::visit(OrderManager{}, State, event);
    }
};

template <typename Fsm, typename ... Events>
void dispatch(Fsm &fsm, Events && ... events) {
    (fsm.dispatch(std::forward<Events>(events)), ...);
}
int main()
{
    Order order;
    FSM<STATE_VT, Event_VT, OrderManager> fsm(order);

    fsm.dispatch(NewEvent{});
/*
    dispatch(fsm,
        event_connect{"train-it.edu"},
        event_timeout{},
        event_connected{},
        event_disconnected{});
*/
}

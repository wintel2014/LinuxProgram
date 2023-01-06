#include <optional>
#include <string>
#include <string_view>
#include <variant>
#include <iostream>

struct event_connect   {};
struct event_connected {};
struct event_disconnected {};
struct event_timeout {};
using event = std::variant<event_connect, event_connected, event_disconnected, event_timeout>;

struct state_idle {};
struct state_connecting {
    static constexpr int n_max{3};
    int n{};
    std::string address;
};
struct state_connected {};
using state = std::variant<state_idle, state_connecting, state_connected>;

struct transitions {
    std::optional<state> operator()(state_idle &, const event_connect &e) {
        std::cout<<"CurrentState=IDLE Event=Connect\n";
        return state_connecting{0, std::string(e.address)};
    }    
    std::optional<state> operator()(state_connecting &, const event_connected &) {
        std::cout<<"CurrentState=Connecting Event=Connected\n";
        return state_connected{};
    }
    std::optional<state> operator()(state_connecting &s, const event_timeout &) {
        std::cout<<"CurrentState=Connecting Event=TimeOut\n";
        return ++s.n < state_connecting::n_max ?
            std::nullopt : std::optional<state>(state_idle{});
    }
    std::optional<state> operator()(state_connected &, const event_disconnected &) {
        std::cout<<"CurrentState=Connecting Event=Disconnected\n";
        return state_idle{};
    }
    template <typename State, typename Event>
    std::optional<state> operator()(State &s, const Event &e) const {
        std::cout<<"CurrentState="<<typeid(s).name() << "Event=" << typeid(e).name()<<"\n";
        return std::nullopt;
    }
};

template <typename StateVariant, typename EventVariant, typename Transitions>
class fsm {
    StateVariant state_;
public:
    void dispatch(const EventVariant &event) {
        auto new_state{std::visit(Transitions{}, state_, event)};
        if (new_state) {
            state_ = *std::move(new_state);
        }
    }
};
using connection_fsm = fsm<state, event, transitions>;

template <typename Fsm, typename ... Events>
void dispatch(Fsm &fsm, Events && ... events) {
    (fsm.dispatch(std::forward<Events>(events)), ...);
}

int main() {
    connection_fsm cf;
    dispatch(cf,
        event_connect{"train-it.edu"},
        event_timeout{},
        event_connected{},
        event_disconnected{});
}

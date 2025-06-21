#include "esphome.h"

template <class E>
esphome::Color get_binary_sensor_color(const E& entity,
        const esphome::Color& no_state,
        const esphome::Color on,
        const esphome::Color off) {

    if (!entity->has_state()) {
        return no_state;
    }
    return entity->state ? on : off;
}

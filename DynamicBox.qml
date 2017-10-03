import QtQuick 2.8
import QtQuick.Window 2.2
import Box2D 2.0

Rectangle {
    id: box
    BoxBody {
        bodyType: Body.Dynamic
        density: 1
        friction: 0.3
        restitution: 0.5
        height: box.height
        target: box
        width: box.width
        world: physicsWorld
    }
}

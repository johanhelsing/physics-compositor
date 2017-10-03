import QtQuick 2.8
import Box2D 2.0

//TODO: remove
Rectangle {
    id: wall
    BoxBody {
        height: wall.height
        target: wall
        width: wall.width
        world: physicsWorld
    }
}

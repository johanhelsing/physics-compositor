import Box2D 2.0

Body {
    id: body
    world: physicsWorld

    property alias fixture: box

    property alias density: box.density
    property alias friction: box.friction
    property alias restitution: box.restitution
    property alias sensor: box.sensor
    property alias categories: box.categories
    property alias collidesWith: box.collidesWith
    property alias groupIndex: box.groupIndex

    property alias x: box.x
    property alias y: box.y

    signal beginContact(Fixture other)
    signal endContact(Fixture other)

    Box {
        id: box
        width: body.target.width
        height: body.target.height

        onBeginContact: body.beginContact(other)
        onEndContact: body.endContact(other)
    }
}

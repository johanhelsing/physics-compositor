import QtQuick 2.8
import QtQuick.Window 2.2
import Box2D 2.0
import QtWayland.Compositor 1.0

WaylandCompositor {
    ListModel { id: shellSurfaces }
    WaylandOutput {
        sizeFollowsWindow: true
        window: Window {
            id: window
            visible: true
            width: 1280
            height: 720
            color: "black"
            World { id: physicsWorld }
            Repeater {
                model: shellSurfaces
                WaylandQuickItem {
                    id: waylandItem
                    x: Math.random() * (window.width - waylandItem.width)
                    surface: modelData.surface
                    BoxBody {
                        target: waylandItem
                        bodyType: Body.Dynamic
                        density: 1
                        friction: 0.3
                        restitution: 0.5
                    }
                    onSurfaceDestroyed: {
                        shellSurfaces.remove(index);
                    }
                }
            }
            Rectangle {
                color: "lightsteelblue"
                id: ground
                height: parent.height * 0.3
                width: parent.width * 0.5
                anchors.horizontalCenter: parent.horizontalCenter
                y: parent.height * 0.7
                BoxBody { target: ground }
            }
            Rectangle {
                id: fire
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                height: 10
                width: parent.width * 5
                BoxBody {
                    target: fire
                    onBeginContact: {
                        var waylandItem = other.getBody().target;
                        waylandItem.surface.client.close();
                    }
                }
            }
        }
    }
    WlShell {
        onWlShellSurfaceCreated: { shellSurfaces.append({"shellSurface": shellSurface }) }
    }
}

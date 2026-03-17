import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland // Hyprland IPC access
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 40
    color: "#1a1b26"

    // Text {
        
    //     anchors.centerIn: parent
    //     text: "My First Bar!"
    //     color: "#a9b1d6"
    //     font.pixelSize: 14
        
    // }

    RowLayout{
        anchors.fill: parent
        anchors.margins: 8

        Repeater{

            model: 9

            Text {
                //  Live data from Hyprland
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                text: index + 1
                // white = active, blue = has windows, gray = empty
                color: isActive? '#fafafa' : (ws ? "#7aa2f7" : '#393a3e')

                font { pixelSize: 15; bold: true }

                // Make workspace area clickable
                MouseArea{
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }               
            }
        }
        Item { Layout.fillWidth: true }
    }
}


import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Wayland
import qs.Commons
import qs.Services
import qs.Widgets

NPanel {
  id: root

  preferredWidth: 380
  preferredHeight: 500
  panelKeyboardFocus: true

  panelContent: Rectangle {
    color: Color.transparent

    ColumnLayout {
      anchors.fill: parent
      anchors.margins: Style.marginL * scaling
      spacing: Style.marginM * scaling

      // HEADER
      RowLayout {
        Layout.fillWidth: true
        spacing: Style.marginM * scaling

        NIcon {
          icon: "bluetooth"
          pointSize: Style.fontSizeXXL * scaling
          color: Color.mPrimary
        }

        NText {
          text: I18n.tr("bluetooth.panel.title")
          pointSize: Style.fontSizeL * scaling
          font.weight: Style.fontWeightBold
          color: Color.mOnSurface
          Layout.fillWidth: true
        }

        NToggle {
          id: bluetoothSwitch
          checked: BluetoothService.enabled
          onToggled: checked => BluetoothService.setBluetoothEnabled(checked)
          baseSize: Style.baseWidgetSize * 0.65 * scaling
        }

        NIconButton {
          enabled: BluetoothService.enabled
          icon: BluetoothService.adapter && BluetoothService.adapter.discovering ? "stop" : "refresh"
          tooltipText: I18n.tr("tooltips.refresh-devices")
          baseSize: Style.baseWidgetSize * 0.8
          onClicked: {
            if (BluetoothService.adapter) {
              BluetoothService.adapter.discovering = !BluetoothService.adapter.discovering
            }
          }
        }

        NIconButton {
          icon: "close"
          tooltipText: I18n.tr("tooltips.close")
          baseSize: Style.baseWidgetSize * 0.8
          onClicked: {
            root.close()
          }
        }
      }

      NDivider {
        Layout.fillWidth: true
      }

      Rectangle {
        visible: !(BluetoothService.adapter && BluetoothService.adapter.enabled)
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: Color.transparent

        // Center the content within this rectangle
        ColumnLayout {
          anchors.centerIn: parent
          spacing: Style.marginM * scaling

          NIcon {
            icon: "bluetooth-off"
            pointSize: 64 * scaling
            color: Color.mOnSurfaceVariant
            Layout.alignment: Qt.AlignHCenter
          }

          NText {
            text: I18n.tr("bluetooth.panel.disabled")
            pointSize: Style.fontSizeL * scaling
            color: Color.mOnSurfaceVariant
            Layout.alignment: Qt.AlignHCenter
          }

          NText {
            text: I18n.tr("bluetooth.panel.enable-message")
            pointSize: Style.fontSizeS * scaling
            color: Color.mOnSurfaceVariant
            Layout.alignment: Qt.AlignHCenter
          }
        }
      }

      NScrollView {
        visible: BluetoothService.adapter && BluetoothService.adapter.enabled
        Layout.fillWidth: true
        Layout.fillHeight: true
        horizontalPolicy: ScrollBar.AlwaysOff
        verticalPolicy: ScrollBar.AsNeeded
        clip: true
        contentWidth: availableWidth

        ColumnLayout {
          width: parent.width
          spacing: Style.marginM * scaling

          // Connected devices
          BluetoothDevicesList {
            label: I18n.tr("bluetooth.panel.connected-devices")
            property var items: {
              if (!BluetoothService.adapter || !Bluetooth.devices)
                return []
              var filtered = Bluetooth.devices.values.filter(dev => dev && !dev.blocked && dev.connected)
              return BluetoothService.sortDevices(filtered)
            }
            model: items
            visible: items.length > 0
            Layout.fillWidth: true
          }

          // Known devices
          BluetoothDevicesList {
            label: I18n.tr("bluetooth.panel.known-devices")
            tooltipText: I18n.tr("tooltips.connect-disconnect-devices")
            property var items: {
              if (!BluetoothService.adapter || !Bluetooth.devices)
                return []
              var filtered = Bluetooth.devices.values.filter(dev => dev && !dev.blocked && !dev.connected && (dev.paired || dev.trusted))
              return BluetoothService.sortDevices(filtered)
            }
            model: items
            visible: items.length > 0
            Layout.fillWidth: true
          }

          // Available devices
          BluetoothDevicesList {
            label: I18n.tr("bluetooth.panel.available-devices")
            property var items: {
              if (!BluetoothService.adapter || !Bluetooth.devices)
                return []
              var filtered = Bluetooth.devices.values.filter(dev => dev && !dev.blocked && !dev.paired && !dev.trusted)
              return BluetoothService.sortDevices(filtered)
            }
            model: items
            visible: items.length > 0
            Layout.fillWidth: true
          }

          // Fallback - No devices, scanning
          ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: Style.marginM * scaling
            visible: {
              if (!BluetoothService.adapter || !BluetoothService.adapter.discovering || !Bluetooth.devices) {
                return false
              }

              var availableCount = Bluetooth.devices.values.filter(dev => {
                                                                     return dev && !dev.paired && !dev.pairing && !dev.blocked && (dev.signalStrength === undefined || dev.signalStrength > 0)
                                                                   }).length
              return (availableCount === 0)
            }

            RowLayout {
              Layout.alignment: Qt.AlignHCenter
              spacing: Style.marginXS * scaling

              NIcon {
                icon: "refresh"
                pointSize: Style.fontSizeXXL * 1.5 * scaling
                color: Color.mPrimary

                RotationAnimation on rotation {
                  running: true
                  loops: Animation.Infinite
                  from: 0
                  to: 360
                  duration: Style.animationSlow * 4
                }
              }

              NText {
                text: I18n.tr("bluetooth.panel.scanning")
                pointSize: Style.fontSizeL * scaling
                color: Color.mOnSurface
              }
            }

            NText {
              text: I18n.tr("bluetooth.panel.pairing-mode")
              pointSize: Style.fontSizeM * scaling
              color: Color.mOnSurfaceVariant
              Layout.alignment: Qt.AlignHCenter
            }
          }

          Item {
            Layout.fillHeight: true
          }
        }
      }
    }
  }
}

import QtQuick
import QtQuick.Controls

Item {
	anchors.fill: parent

	Component {
		id: dragInstrumentOverlay
		Rectangle {
			id: dragInstrumentOverlayRect
			width: 64
			height: 64
			opacity: 0.5
			color: "white"
			scale: 0

			NumberAnimation {
				id: overlayStartAnim
				duration: 350
				easing: Easing.OutCirc
				property: "scale"
				target: dragInstrumentOverlayRect
				from: 0
				to: 1
				running: true
			}

			Behavior on scale {
				NumberAnimation {
					duration: 350
					easing: Easing.OutCirc
				}
			}

			Behavior on opacity {
				NumberAnimation {
					duration: 450
					easing: Easing.OutCirc
				}
			}

			Drag.active: true
			Drag.keys: ["hibiscus-studio/instrument"]
			Drag.hotSpot.x: width / 2
			Drag.hotSpot.y: height / 2
		}
	}
	
	ListModel {
		id: instrumentsModel
		ListElement { name: "CubedOscillator" }
		ListElement { name: "Supersawrus" }
		ListElement { name: "QKSampler" }
		ListElement { name: "Soundfont Player" }
		ListElement { name: "SFZ Player" }
		// ListView { name: "Audiographer" } // no promises....
	}

	ListView {
		anchors.fill: parent
		model: instrumentsModel
		anchors.margins: 8
		spacing: 4

		delegate: Button {
			width: parent.width
			height: 30

			DragHandler {
				id: draghandler
				target: null
				dragThreshold: 5

				property var dragOverlay: null

				onActiveChanged: function(mouse) {
					if (active) {
						dragOverlay = dragInstrumentOverlay.createObject(window)
						draghandler.target = dragOverlay
					} else {
						// dragOverlay.destroy()
						// dragOverlay = null
					}
				}
			}

			background: Rectangle {
				color: parent.hovered ? "#20ffffff" : "transparent"
				radius: 4
				border.color: parent.hovered ? "#40ffffff" : "#20ffffff"
				border.width: 1

				Text {
					text: model.name
					x: 8
					anchors.verticalCenter: parent.verticalCenter
					color: "white"
				}
			}
		}
	}
}
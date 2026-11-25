import QtQuick
import QtQuick.Controls

Item {
	anchors.fill: parent

	Component {
		id: dragInstrumentOverlay
		Rectangle {
			width: 64
			height: 64
			opacity: 0.5
			color: "white"
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
						dragOverlay.destroy()
						dragOverlay = null
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
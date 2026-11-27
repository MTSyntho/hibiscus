import QtQuick
import QtQuick.Controls
import "TrackList"

Rectangle {
	id: trackList
	color: "transparent"
	SplitView.fillWidth: true
	height: parent.height

	property int beatWidth: 30
	property int trackHeight: 48
	property int timeSignatureNum: 4 // beat per section
	// property int timeSignatureDenom: 4

	Item {
		x: -10
		width: parent.width + 10
		height: parent.height

		Rectangle {
			width: 1
			height: parent.height
			color: "#1Affffff"
		}

		Flickable {
			anchors.fill: parent
			contentWidth: 5000
			height: parent.height

			Column {
				anchors.fill: parent

				TimeRuler { id: timeRuler }

				Rectangle {
					width: parent.width
					color: "#1Affffff"
					height: 1
				}

				Item {
					width: parent.width
					height: trackHeight

					Row {
						Repeater {
							model: 1000

							Item {
								width: beatWidth
								height: trackHeight

								Rectangle {
									width: beatWidth
									// color: index % 4 == 0 ? "transparent" : "white"
									color: Math.floor( index / timeSignatureNum ) % 2 === 0 ? "transparent" : "#10ffffff"
									height: trackHeight
								}

								Rectangle {
									width: 1
									color: "#1Affffff"
									height: trackHeight
								}
							}
						}
					}
				}
			}		

			DropArea {
				id: trackListDropArea
				anchors.fill: parent

				keys: ["hibiscus-studio/instrument"]

				onEntered: function(drag) {
					if (drag.source) {
						drag.source.scale = 1.2
						drag.source.opacity = 0.75
					}
				}

				onExited: {
					if (drag.source) {
						drag.source.scale = 1.0
						drag.source.opacity = 0.5
					}
				}

				// onDropped: function(drop) {
				// 	console.log("dropz")
				// }
			}	
		}	
	}
}
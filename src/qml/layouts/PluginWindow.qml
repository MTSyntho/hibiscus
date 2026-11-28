import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import "Plugins"

Rectangle {
	id: pluginWindow
	property string plugin: ""
	width: 387
	height: 413
	color: "#3c3c3c"
	gradient: Gradient {
		GradientStop { position: 0.0; color: "#3c3c3c" }
		GradientStop { position: 1.0; color: "#333333" }
	}
	// border.color: "#26ffffff"
	border.color: "#10ffffff"
	border.width: 1
	radius: 4

	MultiEffect {
		anchors.fill: pluginWindow
		source: pluginWindow

		shadowEnabled: true
		shadowColor: "#45000000"
		shadowBlur: 1.5
		blurMax: 24
		shadowHorizontalOffset: 0
		shadowVerticalOffset: 4
		// autoPaddingEnabled: true
	}

	// stop clicks and drags from registering behind the window
	DragHandler { target: null }
	TapHandler { target: null } 

	Item {
		width: parent.width
		height: titlebar.height + container.anchors.margins

		DragHandler {
			target: pluginWindow
		}
	}

	Item {
		id: resizeHandles
		anchors.fill: parent

		Rectangle { // left handler
			width: 5
			height: parent.height - 6

			PointHandler {
				property real startWindowX: 0
				property real startDragX: 0
				property real startWidth: 0
				target: null

				onActiveChanged: {
					if (active) { startWindowX = pluginWindow.x; startWidth = pluginWindow.width; startDragX = point.scenePosition.x }
				}

				// onTranslationChanged: {
				// 	if (active) {
				// 		let deltaX = point.scenePosition.x - startDragX
				// 		pluginWindow.x = Math.min( startWindowX, startWindowX + deltaX )
				// 		pluginWindow.width = Math.max( 387, startWidth - deltaX )
				// 	}
				// }
				onTranslationChanged: {
				    if (active) {
				        let deltaX = point.scenePosition.x - startDragX
				        let maxX = startWindowX + startWidth - 387
				        pluginWindow.x = Math.min(maxX, startWindowX + deltaX)
				        pluginWindow.width = Math.max(387, startWidth - deltaX)
				    }
				}

			}
		}

		Rectangle { // bottom-left handler
			width: 5
			height: 6
			anchors.bottom: parent.bottom

			PointHandler {
				property real startWindowX: 0
				property real startDragX: 0
				property real startWidth: 0
				property real startHeight: 0
				property real startDragY: 0
				target: null

				onActiveChanged: {
					if (active) { startWindowX = pluginWindow.x; startWidth = pluginWindow.width; startDragX = point.scenePosition.x }
					if (active) { startHeight = pluginWindow.height; startDragY = point.scenePosition.y }
				}

				onTranslationChanged: {
				    if (active) {
				        let deltaX = point.scenePosition.x - startDragX
				        let maxX = startWindowX + startWidth - 387
				        pluginWindow.x = Math.min(maxX, startWindowX + deltaX)
				        pluginWindow.width = Math.max(387, startWidth - deltaX)
				    }
					if (active) {
						let deltaY = point.scenePosition.y - startDragY
						pluginWindow.height = Math.max( 413, startHeight + deltaY )
					}
				}
			}
		}

		Rectangle { // bottom handler
			width: parent.width - 10
			height: 3
			anchors.bottom: parent.bottom
			x: 5

			PointHandler {
				property real startHeight: 0
				property real startDragY: 0
				target: null

				onActiveChanged: {
					if (active) { startHeight = pluginWindow.height; startDragY = point.scenePosition.y }
				}

				onTranslationChanged: {
					if (active) {
						let deltaY = point.scenePosition.y - startDragY
						pluginWindow.height = Math.max( 413, startHeight + deltaY )
					}
				}
			}
		}

		Rectangle { // bottom-right handler
			width: 5
			height: 6
			anchors.bottom: parent.bottom
			anchors.right: parent.right

			PointHandler {
				property real startHeight: 0
				property real startDragY: 0
				property real startWidth: 0
				property real startX: 0
				target: null

				onActiveChanged: {
					if (active) { startHeight = pluginWindow.height; startDragY = point.scenePosition.y }
					if (active) { startWidth = pluginWindow.width; startX = point.scenePosition.x } 
				}

				onTranslationChanged: {
					if (active) {
						let deltaY = point.scenePosition.y - startDragY
						pluginWindow.height = Math.max( 413, startHeight + deltaY )
					}
					if (active) {
						let deltaX = point.scenePosition.x - startX // why write 'difference', when i can be fancy and use delta~
						pluginWindow.width = Math.max( 387, startWidth + deltaX )
						console.log(translation.x)
					}
				}
			}
		}

		Rectangle { // right handler
			width: 5
			height: parent.height - 6
			anchors.right: parent.right

			// DragHandler {
			PointHandler {
				property real startWidth: 0
				property real startX: 0
				target: null

				onActiveChanged: {
					if (active) { startWidth = pluginWindow.width; startX = point.scenePosition.x } 
				}

				onTranslationChanged: {
					if (active) {
						let deltaX = point.scenePosition.x - startX // why write 'difference', when i can be fancy and use delta~
						pluginWindow.width = Math.max( 387, startWidth + deltaX )
						console.log(translation.x)
					}
				}
			}
		}
	}

	Item {
		id: container
		anchors.fill: parent
		anchors.margins: 6

		Column {
			spacing: 6

			Item {
				id: titlebar
				width: container.width
				height: 16

				Row {
					spacing: 5


					Image {
						source: "../assets/ui/icons/instruments.svg"
						width: 16
						height: 16
					}

					Text {
						text: "CubedOscillator"
						font.pixelSize: 10
						color: "white"
						y: parent.height / 2 - height / 2
					}

					Text {
						text: "( Hibiscus Native )"
						font.pixelSize: 10
						color: "white"
						opacity: 0.45
						font.italic: true
						y: parent.height / 2 - height / 2
					}
				}

				Row {
					spacing: 6
					anchors.right: parent.right

					Button {
						width: 16
						height: 16

						background: Rectangle {
							color: parent.hovered ? "#20ffffff" : "transparent"
							Image {
								source: "../assets/ui/icons/settings.svg"
								width: 16
								height: 16
							}
						}
					}
					
					Button {
						width: 16
						height: 16

						background: Rectangle {
							color: parent.hovered ? "#20ffffff" : "transparent"
							Image {
								source: "../assets/ui/icons/presets.svg"
								width: 16
								height: 16
							}
						}
					}
					
					Button {
						width: 16
						height: 16

						background: Rectangle {
							color: parent.hovered ? "#20ffffff" : "transparent"
							Image {
								source: "../assets/ui/icons/minimise.svg"
								width: 16
								height: 16
							}
						}
					}
					
					Button {
						width: 16
						height: 16

						background: Rectangle {
							color: parent.hovered ? "#20ffffff" : "transparent"
							Image {
								source: "../assets/ui/icons/close.svg"
								width: 16
								height: 16
							}
						}
					}

				}
			}

			Rectangle {
				id: toolbar
				width: container.width
				height: 22
				color: "#262626"
				gradient: Gradient {
					GradientStop { position: 0.0; color: "#262626" }
					GradientStop { position: 1.0; color: "#202020" }
				}

				Row {}

				Item {
					id: border // a broke mans gradient border
					anchors.fill: parent
					opacity: 0.20

					Rectangle {
						width: 1
						height: parent.height
						// x: 0
						anchors.left: parent.left
						gradient: Gradient {
							GradientStop { position: 0.0; color: "#1a1a1a" }
							GradientStop { position: 1.0; color: "#ffffff" }
						}
					}

					Rectangle {
						width: 1
						height: parent.height
						anchors.right: parent.right
						gradient: Gradient {
							GradientStop { position: 0.0; color: "#1a1a1a" }
							GradientStop { position: 1.0; color: "#ffffff" }
						}
					}

					Rectangle {
						width: parent.width
						height: 1
						anchors.top: parent.top
						color: "#1a1a1a"
					}

					Rectangle {
						width: parent.width
						height: 1
						anchors.bottom: parent.bottom
						color: "#ffffff"
					}

				}
			}

			Item {
				id: pluginViewport
				width: container.width
				height: container.height - titlebar.height - toolbar.height - 12 // bruh

				CubedOscillator {}
			}
		}
	}
}
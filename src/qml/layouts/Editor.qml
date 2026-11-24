import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Effects

Window {
	id: window
	width: 800
	height: 600
	title: "Hibiscus Studio"
	visibility: Window.Maximized
	// visibility: Window.FullScreen
	color: "#262626"

	readonly property bool isSoftwareRendered: GraphicsInfo.api === GraphicsInfo.Software

	Item {
		id: background
		width: window.width
		height: window.height - topBar.height - bottomBar.height
		y: topBar.height
		clip: true

		Image {
			anchors.fill: parent
			source: "../assets/ui/background.png"
        	fillMode: Image.PreserveAspectCrop
		}
	}

	Viewport {}

	Item {
		id: topBar
		width: window.width
		height: 58
		// visible: isSoftwareRendered

		Image {
			id: topBarBackground
			anchors.fill: parent
			source: "../assets/ui/topBar.png"
		}

		Item {
			width: parent.width
			height: 25
			Row {
				spacing: 7

				Rectangle {
					width: 25
					height: 25
				}

				Rectangle {
					width: 35
					height: 25
					// color: "#20ffffff"
					color: "transparent"

					Text {
						text: "File"
						color: "white"
						font.pixelSize: 12
						anchors.centerIn: parent
					}
				}

				Rectangle {
					width: 35
					height: 25
					// color: "#20ffffff"
					color: "transparent"

					Text {
						text: "Edit"
						color: "white"
						font.pixelSize: 12
						anchors.centerIn: parent
					}
				}

				Rectangle {
					width: 35
					height: 25
					// color: "#20ffffff"
					color: "transparent"

					Text {
						text: "View"
						color: "white"
						font.pixelSize: 12
						anchors.centerIn: parent
					}
				}

				Rectangle {
					width: 35
					height: 25
					// color: "#20ffffff"
					color: "transparent"

					Text {
						text: "Tools"
						color: "white"
						font.pixelSize: 12
						anchors.centerIn: parent
					}
				}

				Rectangle {
					width: 35
					height: 25
					// color: "#20ffffff"
					color: "transparent"

					Text {
						text: "Help"
						color: "white"
						font.pixelSize: 12
						anchors.centerIn: parent
					}
				}
			}
		}

		Rectangle {
			width: parent.width
			height: 1
			color: "#1Affffff"
			y: parent.height
		}
	}

	Item {
		id: bottomBar
		width: window.width
		height: 15
		anchors.bottom: parent.bottom

		Rectangle {
			width: parent.width
			height: 1
			color: "#1Affffff"
			y: -1
		}

		Image {
			anchors.fill: parent
			source: "../assets/ui/bottomBar.png"
		}

		Text {
			text: "CPU Usage: x%"
			font.pixelSize: 10
			color: "white"
			x: 4
		}

	}
}
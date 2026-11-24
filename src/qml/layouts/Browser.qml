import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Rectangle {
	height: parent.height
	color: "#E6262626"

	clip: true

	property bool openToggle: false

	function toggleBrowserOpen() {
		openToggle = !openToggle
		browser.SplitView.preferredWidth = browser.openToggle ? SplitView.maximumWidth : SplitView.minimumWidth
	}

	function snapBrowserSize() {
		if ( width < SplitView.maximumWidth / 2 ) {
			openToggle = false
			browser.SplitView.preferredWidth = SplitView.minimumWidth
		} else {
			openToggle = true
			browser.SplitView.preferredWidth = SplitView.maximumWidth
		}
	}

	Item {
		width: 35
		height: parent.height

		Column {
			spacing: 8
			topPadding: 12
			bottomPadding: 12
			anchors.horizontalCenter: parent.horizontalCenter

			Button {
				width: 25
				height: 25

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6
							// color: "transparent"

					Image {
						width: 20
						height: 20
						source: "../assets/ui/icons/instruments.svg"
						anchors.centerIn: parent
					}
				}						
			}

			Button {
				width: 25
				height: 25

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6

					Image {
						width: 20
						height: 20
						source: "../assets/ui/icons/plugins.svg"
						anchors.centerIn: parent
					}
				}						
			}

			Button {
				width: 25
				height: 25

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6

					Image {
						width: 20
						height: 20
						source: "../assets/ui/icons/samples.svg"
						anchors.centerIn: parent
					}
				}						
			}

			Button {
				width: 25
				height: 25

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6

					Image {
						width: 20
						height: 20
						source: "../assets/ui/icons/presets.svg"
						anchors.centerIn: parent
					}
				}						
			}

			Button {
				width: 25
				height: 25

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6

					Image {
						width: 20
						height: 20
						source: "../assets/ui/icons/projects.svg"
						anchors.centerIn: parent
					}
				}						
			}

			Button {
				width: 25
				height: 25

				onPressed: toggleBrowserOpen()
						// onPressed: { openToggle = !openToggle }

				background: Rectangle {
					color: parent.hovered ? "#20ffffff" : "transparent"
					radius: 6
					rotation: openToggle ? 0 : -180

					Image {
						width: 25
						height: 25
						source: "../assets/ui/icons/right.svg"
						anchors.centerIn: parent
					}
				}						
			}

		}
	}


	Item {
		x: 35
		width: parent.width - x
		height: parent.height


		Item {
			anchors.fill: parent
			anchors.margins: 16

			ColumnLayout {
				anchors.fill: parent
				scale: openToggle ? 1 : 0.95
				opacity: openToggle ? 1 : 0.25

				Behavior on opacity {
					NumberAnimation {
						duration: 500
						easing: Easing.OutQuart
					}
				}

				Behavior on scale {
					NumberAnimation {
						duration: 500
						easing: Easing.OutQuart
					}
				}

				Row {
					Layout.fillWidth: true
					spacing: 8
					Image {
						width: 24
						height: 24
						source: "../assets/ui/icons/instruments.svg"
						// color: "white"
						// anchors.horizontalCenter: parent.horizontalCenter
					}

					Text {
						text: "Instruments"
						color: "white"
						font.pixelSize: 20
						font.weight: Font.Bold
					}
				}

				Text {
					text: "Drag an instrument into the song editor"
					color: "white"
				}

				Rectangle {
					Layout.fillWidth: true
					Layout.fillHeight: true
					color: "#40000000"
					radius: 8
					border.color: "#26ffffff"
					border.width: 1

					Image {
						source: "../assets/ui/browserBackground.png"
						opacity: 0.05
						fillMode: Image.PreserveAspectCrop
						anchors.fill: parent
					}
				}
			}
		}
	}
}
import QtQuick
import QtQuick.Controls
import QtQuick.Window

Item {
	id: viewport
	anchors.fill: parent
	clip: true


	SplitView {	
		width: window.width
		height: window.height - topBar.height - bottomBar.height
		y: topBar.height
		spacing: 0
		orientation: Qt.Horizontal

		// SplitView.fillHeight: true
		handle: Rectangle {
			implicitWidth: 10
			height: parent.height
			color: "#00000000"
		}


		Rectangle {
			SplitView.minimumWidth: 35
			SplitView.maximumWidth: window.width / 3
			height: parent.height
			color: "#E6262626"

			Item {
				width: 35
				height: parent.height

				Column {
					spacing: 8
					topPadding: 12
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

				}
			}

			Rectangle {
				width: 1
				height: parent.height
				color: "#1Affffff"
				x: parent.width + 1
			}
		}

		Rectangle {
			color: "transparent"
			SplitView.fillWidth: true
			height: parent.height
		}
	}
}

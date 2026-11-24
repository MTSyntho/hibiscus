import QtQuick
import QtQuick.Controls
import QtQuick.Window

Item {
	id: viewport
	anchors.fill: parent
	clip: true


	SplitView {	
		id: workspaceSplitview
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

		onResizingChanged: {
			if (!resizing) {
				browser.snapBrowserSize()
			}
		}

		Browser {
			id: browser
			SplitView.minimumWidth: 35
			SplitView.maximumWidth: window.width / 3
			// SplitView.preferredWidth: browser.openToggle ? SplitView.maximumWidth : SplitView.minimumWidth
			SplitView.preferredWidth: 35

			Behavior on SplitView.preferredWidth {
				// enabled: !workspaceSplitview.resizing
				NumberAnimation {
					duration: 350
					easing: Easing.OutQuart
				}
			}
		}

		Rectangle {
			id: songEditor
			color: "transparent"
			SplitView.fillWidth: true
			height: parent.height

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
					contentWidth: 1000
					height: parent.height

					Column {
						// anchors.fill: parent

						Rectangle {
							width: parent.width
							height: 35
							opacity: 0.2
						}

						Rectangle {
							width: 100
							height: 65
						}
					}			
				}	
			}


		}
	}
}

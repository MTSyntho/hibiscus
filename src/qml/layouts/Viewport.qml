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
			z: 5

			Behavior on SplitView.preferredWidth {
				// enabled: !workspaceSplitview.resizing
				NumberAnimation {
					duration: 350
					easing: Easing.OutQuart
				}
			}
		}

		TrackList { id: trackList }
	}

	PluginWindow { width: 387; height: 413; y: 200; plugin: "cubedosc" }
}

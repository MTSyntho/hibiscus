import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Hibiscus.Studio

Window {
    id: splash
    modality: Qt.ApplicationModal
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    property string version: "Version 26.11-1"

  	// bruh i had to do this bcuz of niri
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height

    color: "transparent"
	width: 640
	height: 480

	property var editorInstance: null

	function startEditor() {
		editorInstance = mainWindow.createObject()
		if ( editorInstance ) {
			console.log('Starting Editor...')
			editorInstance.show()
			splash.close()
		} else {
			currentStateText.text = "Failed to open editor window...."
			console.log("Failed to open editor...")
		}
	}

	Component {
		id: mainWindow
		Editor {}
	}

	HibiscusBackend {
		id: backend
	}

	// dummy purposes... not for production use!
	Timer {
	    interval: 3000
	    running: splash.visible
	    repeat: false
	    onTriggered: startEditor()
	}

	Item {
		anchors.fill: parent
		
		Image {
			source: "../assets/splash.png"
			anchors.fill: parent
		}

		BusyIndicator {
			Material.accent: "white"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: parent.height / 5
			width: 30
			height: width
			running: true
		}

		Text {
			id: currentStateText
			text: "Initialising Hibiscus..."
			color: "white"
			font.pixelSize: 12
			x: 12
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 12
		}

		Text {
			id: versionText
			text: "Version yy.mm-b"
			color: "white"
			font.pixelSize: 12
			anchors.right: parent.right
			anchors.rightMargin: 12
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 12
		}
	}

    Component.onCompleted: {
		backend.init_audio()
    	currentStateText.text = backend.audio_status
    	versionText.text = version
    	visible = true
    }
}

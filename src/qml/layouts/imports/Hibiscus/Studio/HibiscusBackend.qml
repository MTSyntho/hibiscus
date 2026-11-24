import QtQuick

Item {
	property string audio_status: "Dummy backend!"
	property string version: "yy.mm-b"

	function init_audio() {
		console.log('NOTE: The dummy backend is currently loaded! This is purely to make the frontend usable w/ the `qml6` binary ( very fast iteration aha )')
	}
}
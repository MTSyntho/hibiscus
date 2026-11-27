import QtQuick
import QtQuick.Controls
// import QtQuick.Effects
// import Qt5Compat.GraphicalEffects // very sad

Rectangle {
	anchors.fill: parent
	clip: true

	property var currentSelectedWave: sawWaveBtn

	Item {
		anchors.fill: parent

		Image {
			anchors.fill: parent
			source: "../../assets/plugins/cubedOsc/background.jpg"
			fillMode: Image.PreserveAspectCrop
		}

		Image {
			anchors.fill: parent
			source: "../../assets/plugins/cubedOsc/textEngravings.png"
		}

		Image {
			anchors.fill: parent
			source: "../../assets/plugins/cubedOsc/knobShadows.png"
		}

		Item {
			width: parent.width
			height: 45
			anchors.verticalCenter: parent.verticalCenter

			Image {
				width: height
				height: parent.height
				source: "../../assets/plugins/cubedOsc/prevOsc.png"
				anchors.left: parent.left
			}

			Image {
				width: height
				height: parent.height
				source: "../../assets/plugins/cubedOsc/nextOsc.png"
				anchors.right: parent.right
			}
		}

		Item { 
			anchors.fill: parent

			Image {
				x: 37
				y: 48
				width: 90
				height: 96
				source: "../../assets/plugins/cubedOsc/knob.png"


				Dial {
					width: parent.width
					height: parent.width
					anchors.top: parent.top
					id: volumeKnob

					from: 0
					value: 50
					to: 100
					snapMode: Dial.SnapOnRelease
					stepSize: 1

					background: Rectangle {
						color: "transparent"
					}

					handle: Image {
						anchors.fill: parent
						source: "../../assets/plugins/cubedOsc/knobIndicator.png"
						rotation: volumeKnob.angle
					}
				}
			}

			Image {
				x: 249
				y: 48
				width: 90
				height: 96
				source: "../../assets/plugins/cubedOsc/knob.png"


				Dial {
					width: parent.width
					height: parent.width
					anchors.top: parent.top
					id: finetuneKnob

					from: -100
					value: 0
					to: 100
					snapMode: Dial.NoSnap
					stepSize: 1

					background: Rectangle {
						color: "transparent"

						Text {
							id: finetuneText
							text: Math.round(finetuneKnob.value)
							anchors.centerIn: parent
							font.pixelSize: 24

							color: "#40000000"
							// layer.enabled: true
							// layer.effect: InnerShadow {
					        //     radius: 1
					        //     samples: 16
					        //     horizontalOffset: -0.5
					        //     verticalOffset: 1
					        //     color: "#33000000"
					        // }
						}

						// Text {
						// 	text: finetuneText.text
						// 	font.pixelSize: finetuneText.font.pixelSize
						// 	x: finetuneText.x - 0.5
						// 	y: finetuneText.y + 0.5
						// 	color: "#73ffffff"
						// }

						// MultiEffect {
						// 	anchors.fill: finetuneText
						// 	source: finetuneText

						// 	shadowEnabled: true
						// 	shadowColor: "#73ffffff"
						// 	shadowBlur: 0
						// 	shadowHorizontalOffset: -0.5
						// 	shadowVerticalOffset: 0.5
						// 	autoPaddingEnabled: true
						// }
					}

					handle: Image {
						anchors.fill: parent
						source: "../../assets/plugins/cubedOsc/knobIndicator.png"
						rotation: finetuneKnob.angle
					}
				}
			}

			Image {
				x: 37
				y: 201
				width: 90
				height: 96
				source: "../../assets/plugins/cubedOsc/knob.png"


				Dial {
					width: parent.width
					height: parent.width
					anchors.top: parent.top
					id: semitoneKnob

					from: -24
					value: 0
					to: 24
					snapMode: Dial.SnapAlways
					stepSize: 1

					background: Rectangle {
						color: "transparent"

						Text {
							text: Math.round(semitoneKnob.value)
							anchors.centerIn: parent
							font.pixelSize: 24
							color: "#40000000"
						}
					}

					handle: Image {
						anchors.fill: parent
						source: "../../assets/plugins/cubedOsc/knobIndicator.png"
						rotation: semitoneKnob.angle
					}
				}
			}
		}

		Item {
			id: sliderContainer
			width: 188
			height: 85
			x: 151
			y: 209

			Column {
				spacing: 34

				Slider {
					width: sliderContainer.width
					height: 6
					id: phaseOffsetSlider

					background: Image {
						source: "../../assets/plugins/cubedOsc/sliderBackground.png"
					}

					handle: Image {
						source: "../../assets/plugins/cubedOsc/sliderHandle.png"
						width: 10
						height: 25
						x: phaseOffsetSlider.leftPadding + phaseOffsetSlider.visualPosition * (phaseOffsetSlider.availableWidth - width)
						y: phaseOffsetSlider.topPadding + phaseOffsetSlider.availableHeight / 2 - height / 2
						
						Image {
							width: 13
							height: 30
							x: -3.5
							source: "../../assets/plugins/cubedOsc/sliderHandleShadow.png"
							z: -1
						}
					}
				}

				Slider {
					width: sliderContainer.width
					height: 6
					id: detuneSlider

					background: Image {
						source: "../../assets/plugins/cubedOsc/sliderBackground.png"
					}

					handle: Image {
						source: "../../assets/plugins/cubedOsc/sliderHandle.png"
						width: 10
						height: 25
						x: detuneSlider.leftPadding + detuneSlider.visualPosition * (detuneSlider.availableWidth - width)
						y: detuneSlider.topPadding + detuneSlider.availableHeight / 2 - height / 2
						
						Image {
							width: 13
							height: 30
							x: -3.5
							source: "../../assets/plugins/cubedOsc/sliderHandleShadow.png"
							z: -1
						}
					}
				}

				Slider {
					width: sliderContainer.width
					height: 6
					id: panningSlider

					background: Image {
						source: "../../assets/plugins/cubedOsc/sliderBackground.png"
					}

					handle: Image {
						source: "../../assets/plugins/cubedOsc/sliderHandle.png"
						width: 10
						height: 25
						x: panningSlider.leftPadding + panningSlider.visualPosition * (panningSlider.availableWidth - width)
						y: panningSlider.topPadding + panningSlider.availableHeight / 2 - height / 2

						Image {
							width: 13
							height: 30
							x: -3.5
							source: "../../assets/plugins/cubedOsc/sliderHandleShadow.png"
							z: -1
						}
					}
				}
			}
		}

		Image {
			id: selectedWaveIndicator
			source: "../../assets/plugins/cubedOsc/waveformSelection.png"
			width: 4
			height: 4

			y: 310
			x: waveformRow.x + currentSelectedWave.x + ( currentSelectedWave.width / 2 ) - ( width / 2 )

			Behavior on x {
				NumberAnimation {
					duration: 350
					easing: Easing.OutCirc
				}
			}
		}

		Row {
			id: waveformRow
			spacing: 3
			x: 152
			y: 316

			Button {
				id: sineWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/sineWave.png"
				}

				onClicked: currentSelectedWave = sineWaveBtn
			}

			Button {
				id: squareWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/squareWave.png"
				}

				onClicked: currentSelectedWave = squareWaveBtn
			}

			Button {
				id: sineSquareWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/sineSquareWave.png"
				}

				onClicked: currentSelectedWave = sineSquareWaveBtn
			}

			Button {
				id: triangleWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/triangleWave.png"
				}

				onClicked: currentSelectedWave = triangleWaveBtn
			}

			Button {
				id: sawWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/sawWave.png"
				}

				onClicked: currentSelectedWave = sawWaveBtn
			}

			Button {
				id: customWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/customWave.png"
				}

				onClicked: currentSelectedWave = customWaveBtn
			}

			Button {
				id: whiteNoiseWaveBtn
				width: 24
				height: width

				background: Image {
					source: "../../assets/plugins/cubedOsc/whiteNoiseWave.png"
				}

				onClicked: currentSelectedWave = whiteNoiseWaveBtn
			}
		}
	}

}

/// The bridge definition for our QObject
#[cxx_qt::bridge]
pub mod qobject {

    unsafe extern "C++" {
        include!("cxx-qt-lib/qstring.h");
        /// An alias to the QString type
        type QString = cxx_qt_lib::QString;
    }

    extern "RustQt" {
        // The QObject definition
        // We tell CXX-Qt that we want a QObject class with the name MyObject
        // based on the Rust struct MyObjectRust.
        #[qobject]
        #[qml_element]
        #[qproperty(QString, audio_status)]
	#[qproperty(QString, version)]
        type HibiscusBackend = super::HibiscusBackendRust;

        // Declare the invokable methods we want to expose on the QObject
        #[qinvokable]
        #[cxx_name = "init_audio"]
        fn init_audio(self: Pin<&mut HibiscusBackend>);

        #[qinvokable]
        #[cxx_name = "sayHi"]
        fn say_hi(&self, string: &QString, number: i32);
    }

    impl cxx_qt::Threading for HibiscusBackend {}
}

use core::pin::Pin;
use cxx_qt_lib::QString;
use cxx_qt::Threading;
mod audio;

/// The Rust struct for the QObject
// #[derive(Default)]
pub struct HibiscusBackendRust {
    audio_status: QString,
    version: QString,
}


impl Default for HibiscusBackendRust {
    fn default() -> Self {
        Self {
            audio_status: QString::default(),
            version: QString::from(env!("CARGO_PKG_VERSION")),
        }
    }
}

impl qobject::HibiscusBackend {
    pub fn init_audio(mut self: Pin<&mut Self>) {
        self.as_mut().set_audio_status(QString::from("Enumerating Audio Devices..."));

        let qt_thread = self.qt_thread();


        // Start a background thread that doesn't block the invokable
        std::thread::spawn(move || {
            std::thread::sleep(std::time::Duration::from_secs(1));

            match audio::enumerate_devices() {
                Ok(()) => {
                    qt_thread.queue(|mut backend| {
                        backend.as_mut().set_audio_status(QString::from("_complete_signal"));
                    });
                }

                // i am gonna die bruh
                // we're all gonna die - paul bazooka ( djmax respect )

                Err(e) => {
                    qt_thread.queue(|mut backend| {
                        backend.as_mut().set_audio_status(QString::from("An error occured! Please check the console for more info..."));
                    });
                    return;
                }
            }

            // Say hello on the Qt event loop
            qt_thread.queue(|_| {
                println!("Hello");
            }).unwrap();
        });
    }

    /// Print a log message with the given string and number
    pub fn say_hi(&self, string: &QString, number: i32) {
        println!("Hi from Rust! String is '{string}' and number is {number}");
    }
}


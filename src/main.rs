use cxx_qt_lib::{QGuiApplication, QQmlApplicationEngine, QUrl};
// use directories::BaseDirs;
use std::path::Path;
use std::fs;
mod backend;
// mod audio;

fn main() {
    let mut app = QGuiApplication::new();
    let mut engine = QQmlApplicationEngine::new();


    if let Some(engine) = engine.as_mut() {
        engine.load(&QUrl::from("qrc:/layouts/Main.qml"));
    }

    if let Some(app) = app.as_mut() {
        app.exec();
    }
}
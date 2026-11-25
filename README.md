<div align="center">
	<h1>Hibiscus Studio</h1>
	<p>A digital audio workstation, simple by design.</p> <!-- what am i writing bruh... -->
</div>

---

Hibiscus Studio is a free and open-source digital audio workstation that enables music production, 
providing an easy-to-use interface for beginners to grasp onto.

It ships a small subset of instruments by default, with the assumption that
you provide your own additional instruments on top of what comes by default.

As the DAW is still very early in its development ( and could get dropped at any moment ), 
these instruments have not been fully implemented as of yet.

Here are the list of all the instruments. ( These are not their official names, just generics )
- [ ] Triple Oscillator ( 3xOSC )
- [ ] Supersaw Synth
- [ ] Audio Sampler
- [ ] Soundfont Player
- [ ] SFZ Player 
- [ ] Audio Slicer

External plugin support
- [ ] VST3 Host
- [ ] CLAP Host
- [ ] LV2 Host 

# Building and Instllation
Pre-built binaries can be obtained from [GitHub Releases](https://github.com/mtsyntho/hibiscus/releases). 
This is ideally what most should opt for.

If you intend on building from source, then read on.

## Prerequisties
- Rust
<!-- - ALSA -->

## Commands
```sh
git clone https://github.com/mtsyntho/hibiscus.git
cd hibiscus
cargo build # You can append `--release` for final builds
```

The final binary should be located in `./target/debug/` or `./target/release`.

### Note
This README is very incomplete, it exists for the sake of existing, and may be refactored in the later future. 
This is it for now. Please understand...
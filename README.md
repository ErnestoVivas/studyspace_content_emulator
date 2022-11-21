# studyspace_content_emulator

Emulator for testing the appearance of contents created for the studyspace app.

## Install and run
To run the emulator, the flutter sdk and a suitable IDE (e.g. Android Studio or Visual Studio) need
to be installed on your system.

- Clone this repository to a desired location on your system
- Open the project in your IDE and run it (does not matter if in debug or release mode)

## Usage
- Place the content CSV into the folder 'TEST_CSV_FILES'
- If your content references images, place the images into the 'TEST_CSV_FILES/images' folder
- On the running emulator, click on the button with the type of content you want to visualize (e.g. 'Überblick')
- Pick your created csv in the file dialog. The emulator will show the content

The created CSV must correspond to the defined data models. CSV must be saved with '\r\n' or '\n' as
end of line delimiters and '\t' (tab) as column delimiters (not commas). If your CSV does not
comply with the correct format, the emulator will crash or result in undefined behavior.
s
### Multiple Choice Question
To be renamed to Single Choice Question.
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


## Data models
The Data models are defined in AWS Amplify / data store. The columns of the CSV that you create
must correspond to the attributes of the data models. A list and explanation of the data models
is given below.

### DisplayElement
A display element is an object that is used to display information in the 'overview' page of the app.
A list of display elements results in a complete overview. Display elements have the following
attributes:

- id: (String) Mandatory by AWS. You can set this to the same value as 'key'.
- key: (String) Identifies object, format: 'subject_key/topic_key/subtopic_key/overview/page/index', e.g. '0/0/0/overview/0/0'
- page: (int) page, that the element belongs to
- index: (int) number of the element in a list of elements (index increases throughout pages)
- type: (int) the type of the display element. Current types are:
  - 0: Pure text
  - 1: Text with inline equations (use as little as possible)
  - 2: Pure equations (use this over inline equations whenever possible)
  - 3: image (specify image path as stored in S3 bucket!)
  - 4: bullet list
  - 5: Table
  - 6: Horizontal line
  - 7: Quote
  - 8: Information box
  - 9: Title 1
  - 10: Title 2
  - 11: Title 3
- value: (String) The real content of the DisplayElement, stored as a string. Depending on the type, the app will render the content accordingly

The format and rendering of types 4-11 are currently being developed.

### Multiple Choice Question
To be renamed to Single Choice Question.
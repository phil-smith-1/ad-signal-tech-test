# Ad Signal Extract Frames Test

For this test we'd like you to build a Rails application that meets the below requirements.

Feel free to add any requirements that you think will enhance the usability. This is an opportunity to show us what you can deliver! 

## Requirements

Build a web application that:

1. Has a page that allows a user to upload a video file, along with a title
2. Has a page that displays an uploaded video file along with its title, along with 1 image per second of video. Eg if a video is 30 seconds long 30 images should appear on the page.
3. Has a page that shows a list of previous uploads
4. MP4 file format must be supported. Other file formats can be supported

To get you started we have a couple of video files that can be used:

* [Meg 2 trailer 10s cut](https://drive.google.com/file/d/17bB-oX1AuBnrZz8SvGt8X60Df6GsouNg/view?usp=drive_link) (1.7MB, 10s)
* [Meg 2 trailer full](https://drive.google.com/file/d/1MIgcANybzVYgCJUZZ4ixe_M8EwLjMgxw/view?usp=drive_link) (16.4MB, 135s)

## Non functional requirements

### Documentation

Add a readme document to explain how the app works, how it runs and to note limits on scope or other restrictions.

### Git usage

Please ensure that your Git history is tidy - we would like to review commit by commit. Feel free to use commit messages to document any design decisions you make and/or  to provide clarifications you feel are warranted, whether they are technical or design-related or anything else.

### Tests

As an engineering team, we want to ensure that our codebases have good test coverage so that we have robust and error-free applications.

We use RSpec but if you prefer to use minitest or any other framework feel free to make that switch and let us know why you prefer.

Feel free to add any other supporting gems which will support you further in testing if needed.

# Solution README

## Tech
- Ruby 3.2.2
- Rails 7.0.6
- Tailwind
- RSpec
- Factorybot
- Rubocop

## Setup
First clone the repository. Once cloned, run `bundle` to install the Gems. Next set up the database:

`rails db:create db:schema:load`

This will set up the development and test databases.

## Usage
In the console run `rails s` to boot your local server. You can then visit `localhost:3000` to use the system. From here you may view a list of videos. Click on a the "Show this video" button to see more information.

## Testing
The application was developed with Test Driven Development. To run the test suite (unit tests), use `rspec` in the console. The test files are located in the `spec` directory.

## Coding Techniques
The following coding techniques/patterns have been used in the development of this challenge:
- Test Driven Development
- Processing optimisation
- N+1 management
- Jobs
- Factory pattern
- SOLID design principles

## Choices and Assumptions
I made several choices and assumptions during the development process, many of which have been made due to time constraints. These include:
- There is no user system, therefore:
  - Videos are not owned by a user
  - Any public user can make changes to any video
  - Any public user can add videos
- There are no constraints on video type, however:
  - Only MP4 file extension is supported
  - Only video file type can be uploaded
- There are no constraints on video length or filesize (This could cause performance issues with larger or longer videos)

## Future Improvements
1. More testing
2. Large video files could lead to performance issues. In this case, run the video processing job asynchronously to protect the system.
3. Update to a more sophisticated UI/Design
4. More exception/error handling.

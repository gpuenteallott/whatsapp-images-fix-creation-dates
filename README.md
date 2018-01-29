# Whatsapp Images - Fix Creation Dates Script (MacOS)

Do you want to include *Whatsapp* pictures in your photo library? Are you annoyed by the fact that they lost their **Created Date** meta data? This is a solution!

*Whatsapp* at least keeps the image generation date on the filename. That is the date that a picture was taken with the *Whatsapp* app or sent over a chat conversation.

This script will batch update all *Whatsapp* images so that their **Created Date** matches the one in their filenames.

As of this day, the fileformat is `IMG-YYYYMMDD-WAXXXX.jpg`.

## Instructions

1. Place your images in a folder.
2. Run the command:

```bash
./whatsapp-images-fix-creation-dates.sh input_directory [output_directory]
```

If no `output_directory` is provided, it will create one named 'result'.

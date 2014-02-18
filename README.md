# TOUR DE FUN

## Dev setup

1. Clone the repo
2. Run bundler
3. Create db and run migrations
4. Populate with seeds

    bundle
    rake db:create db:migrate db:seed

### Image uploading

Create `config/s3.rb` and add your S3 key and secret. This file is git-ignored and should never be committed.

    ENV['S3_KEY'] = 'ADD YOUR KEY'
    ENV['S3_SECRET'] = 'ADD YOUR SECRET'

## Brainstorming

* Large text, 18-20px
* Typography (typekit?)

### Home

* Big background image
* Overlay event info on top, centered
* Sponsors logos underneath in a row

### Evergreen pages (about, contact)

* Center content (if subnav isn't needed) ~600px

### Shows (Timeslots)

* Display shows for this year
* Yearly archive /shows (current), /shows/2013, etc
* List, Map tabs
* Auto build map with location, chrono data


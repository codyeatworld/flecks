Flecks
======

A simple script to crawl web pages and send text messages when changes are
detected on certain elements on the page using xpaths.

## Requirements

- Ruby 2.7.0 +
- Twilio
- Chrome driver

## Setup

### Install gems

```bash
./install-gems.sh
```

### Install Chrome driver

#### Linux

Download it from the official [source](https://www.chromium.org/getting-involved/download-chromium).
Chrome binary should be in the `PATH` or `BROWSER_PATH`.

#### macOS

`brew install chromium`

### Configure settings

Copy settings file:

```bash
cp settings/flecks.json.example settings/flecks.json
```

#### Twilio

Modify the settings file to include your Twilio credentials.

#### Pages

Pages to crawl are configured in the `settings/flecks.json` file.

```javascript
{
  "pages": [
    {
      // Name of the webpage used for logging and text messages
      "name": "Rouge Flecks",
      // URL of the webpage
      "url": "https://www.roguefitness.com/rogue-fleck-plates",
      // How often to check for changes
      "interval": 5,
      // xpaths to the elements to check
      "xpaths": [
        "//*[@id='super-product-table']"
      ],
      // Phone number to send a text message to
      "phone_number": "+15554443333"
    }
  ]
}
```

Add an entry to the pages array to crawl as more pages.

## Run

```bash
./script/start
```

#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright (c) 2014-17 Richard Hull and contributors
# See LICENSE.rst for details.
# PYTHON_ARGCOMPLETE_OK

"""
3 Day weather forecast from the BBC
"""



import feedparser

# Go to http://www.bbc.co.uk/weather and enter your town/city into
# the 'Find a forecast' box. Then when you click through, substitute
# the location_id below
location_id = 2934691
weather_rss_url = "http://open.live.bbc.co.uk/weather/feeds/en/{0}/3dayforecast.rss".format(location_id)

print weather_rss_url
feed = feedparser.parse(weather_rss_url)
msg = feed["feed"]["title"]
print msg, " - "

for items in feed["items"]:
    msg = items["title"]
    msg = msg.split(",")[0]
    print msg

    for msg in items["description"].split(","):
        print msg

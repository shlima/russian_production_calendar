#!/usr/bin/env bash

rm ./*.gem
gem build russian_production_calendar.gemspec
gem push russian_production_calendar-*

![](./doc/logo.png?sanitize=true)

# RussianProductionCalendar (1997 - 2025)

[![pipeline status](https://travis-ci.com/shlima/russian_production_calendar.svg?branch=master)](https://travis-ci.com/shlima/russian_production_calendar)
[![Code Climate](https://codeclimate.com/github/shlima/russian_production_calendar/badges/gpa.svg)](https://codeclimate.com/github/shlima/russian_production_calendar)
[![Gem Version](https://badge.fury.io/rb/russian_production_calendar.svg)](https://badge.fury.io/rb/russian_production_calendar)

This gem checks holiday/workday status of the given date. 
Holidays [dataset](https://github.com/shlima/russian_production_calendar/blob/master/lib/russian_production_calendar/calendar.csv) is provided by [Open Data Portal](https://data.gov.ru/opendata/7708660670-proizvcalendar) 
by Russian Ministry of Economic Development (includes add-ons from [Consultant+](http://www.consultant.ru/law/ref/calendar/proizvodstvennye/))

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'russian_production_calendar'

# if you wish to extend the standard Date class with gem's helpers
gem 'russian_production_calendar', require: 'russian_production_calendar/ext/date'
```

And then execute:

```bash
$ bundle
```

## Usage

This gem has its own interface for working with dates:

```ruby
RussianProductionCalendar.holiday?(Date.today)
```

And also can extend the standard date class:

```ruby
require 'russian_production_calendar/ext/date'

Date.today.holiday?
```

```ruby
@date = Date.today

# Returns true if today is a day off or a public holiday 
@date.holiday? #=> true

# Returns true if today is a working day
@date.workday? #=> false

# Returns the next business day (including the current one)
@date.gte_workday #=> #<Date>

# Returns the previous business day (including the current one)
@date.lte_workday #=> #<Date>

# Returns the next business day
@date.gt_workday #=> #<Date>

# Returns the previous business day
@date.lt_workday #=> #<Date>

# Returns the next weekend day (including the current one)
@date.gte_holiday #=> #<Date>

# Returns the previous weekend day (including the current one)
@date.lte_holiday #=> #<Date>

# Returns the next weekend day
@date.gt_holiday #=> #<Date>

# Returns the previous weekend day
@date.lt_holiday #=> #<Date>
```

## Tricks

Find out all holidays of the given year:

```ruby
@holidays = Range.new(Date.new(2020, 1, 1), Date.new(2020, 12, 31)).select(&:holiday?)
```

Find out working days of the given year:

```ruby
@workdays = Range.new(Date.new(2020, 1, 1), Date.new(2020, 12, 31)).select(&:workday?)
```

Find out the number of days off during the New Year holidays:

```ruby
Date.new(2021, 1, 1).gt_workday -  Date.new(2021, 1, 1) #=> 10
```

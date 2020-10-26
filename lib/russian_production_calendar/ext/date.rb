# frozen_string_literal: true

# to be able to use:
# gem 'russian_production_calendar', require: 'russian_production_calendar/ext/date'
require 'russian_production_calendar'

class Date
  def holiday?
    RussianProductionCalendar.holiday?(self)
  end

  def workday?
    RussianProductionCalendar.workday?(self)
  end

  def gte_workday
    RussianProductionCalendar.gte_workday(self)
  end

  def lte_workday
    RussianProductionCalendar.lte_workday(self)
  end

  def gt_workday
    RussianProductionCalendar.gt_workday(self)
  end

  def lt_workday
    RussianProductionCalendar.lt_workday(self)
  end

  def gte_holiday
    RussianProductionCalendar.gte_holiday(self)
  end

  def lte_holiday
    RussianProductionCalendar.lte_holiday(self)
  end

  def gt_holiday
    RussianProductionCalendar.gt_holiday(self)
  end

  def lt_holiday
    RussianProductionCalendar.lt_holiday(self)
  end
end
